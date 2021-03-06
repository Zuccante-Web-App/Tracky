// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? join(await sqflite.getDatabasesPath(), name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PriceDao _priceDaoInstance;

  ProductDao _productDaoInstance;

  CurrencyDao _currencyDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    return sqflite.openDatabase(
      path,
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Price` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `idProduct` INTEGER, `date` TEXT, `amount` INTEGER, FOREIGN KEY (`idProduct`) REFERENCES `Product` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Currency` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `symbol` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Product` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT, `link` TEXT, `seller` TEXT, `targetAmount` INTEGER, `idCurrency` INTEGER, FOREIGN KEY (`idCurrency`) REFERENCES `Currency` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  PriceDao get priceDao {
    return _priceDaoInstance ??= _$PriceDao(database, changeListener);
  }

  @override
  ProductDao get productDao {
    return _productDaoInstance ??= _$ProductDao(database, changeListener);
  }

  @override
  CurrencyDao get currencyDao {
    return _currencyDaoInstance ??= _$CurrencyDao(database, changeListener);
  }
}

class _$PriceDao extends PriceDao {
  _$PriceDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _priceInsertionAdapter = InsertionAdapter(
            database,
            'Price',
            (Price item) => <String, dynamic>{
                  'id': item.id,
                  'idProduct': item.idProduct,
                  'date': item.date,
                  'amount': item.amount
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _priceMapper = (Map<String, dynamic> row) => Price(
      row['id'] as int,
      row['idProduct'] as int,
      row['date'] as String,
      row['amount'] as int);

  final InsertionAdapter<Price> _priceInsertionAdapter;

  @override
  Future<List<Price>> findAllPrices() async {
    return _queryAdapter.queryList('SELECT * FROM Price', mapper: _priceMapper);
  }

  @override
  Future<Price> findPriceById(int id) async {
    return _queryAdapter.query('SELECT * FROM Price WHERE id = ?',
        arguments: <dynamic>[id], mapper: _priceMapper);
  }

  @override
  Future<Price> findLatestPriceFromProductId(int id) async {
    return _queryAdapter.query(
        'SELECT Price.* FROM Price JOIN Product ON Price.idProduct = Product.id WHERE Product.id = ? LIMIT=1',
        arguments: <dynamic>[id],
        mapper: _priceMapper);
  }

  @override
  Future<void> insertPrice(Price price) async {
    await _priceInsertionAdapter.insert(price, sqflite.ConflictAlgorithm.abort);
  }
}

class _$ProductDao extends ProductDao {
  _$ProductDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _productInsertionAdapter = InsertionAdapter(
            database,
            'Product',
            (Product item) => <String, dynamic>{
                  'id': item.id,
                  'name': item.name,
                  'link': item.link,
                  'seller': item.seller,
                  'targetAmount': item.targetAmount,
                  'idCurrency': item.idCurrency
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _productMapper = (Map<String, dynamic> row) => Product(
      row['id'] as int,
      row['name'] as String,
      row['link'] as String,
      row['seller'] as String,
      row['targetAmount'] as int,
      row['idCurrency'] as int);

  final InsertionAdapter<Product> _productInsertionAdapter;

  @override
  Future<List<Product>> findAllProducts() async {
    return _queryAdapter.queryList('SELECT * FROM Product',
        mapper: _productMapper);
  }

  @override
  Future<Product> findProductById(int id) async {
    return _queryAdapter.query('SELECT * FROM Product WHERE id = ?',
        arguments: <dynamic>[id], mapper: _productMapper);
  }

  @override
  Future<void> insertProduct(Product product) async {
    await _productInsertionAdapter.insert(
        product, sqflite.ConflictAlgorithm.abort);
  }
}

class _$CurrencyDao extends CurrencyDao {
  _$CurrencyDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _currencyInsertionAdapter = InsertionAdapter(
            database,
            'Currency',
            (Currency item) =>
                <String, dynamic>{'id': item.id, 'symbol': item.symbol});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _currencyMapper = (Map<String, dynamic> row) =>
      Currency(row['id'] as int, row['symbol'] as String);

  final InsertionAdapter<Currency> _currencyInsertionAdapter;

  @override
  Future<List<Currency>> findAllCurrencies() async {
    return _queryAdapter.queryList('SELECT * FROM Currency',
        mapper: _currencyMapper);
  }

  @override
  Future<Currency> findCurrencyById(int id) async {
    return _queryAdapter.query('SELECT * FROM Currency WHERE id = ?',
        arguments: <dynamic>[id], mapper: _currencyMapper);
  }

  @override
  Future<void> insertCurrency(Currency currency) async {
    await _currencyInsertionAdapter.insert(
        currency, sqflite.ConflictAlgorithm.abort);
  }
}
