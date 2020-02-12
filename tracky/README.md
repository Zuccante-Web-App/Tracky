# Tracky

## API Docs

  ### ApiResponse \<T\>
  
  This class is used for storing network calls responses. T is a generic type of data which represents a particoular response.

   #### Fileds
  
    T data : data of the response
    bool esit : esit of the request (true good, false bad)
  
  ### Api
  
  This class contains the method used for getting data from the internet.
  
  __Future<ApiResponse\<Product\>\> getProductByLink( String url ) :__
  
      Given the Amazon product url returns data of the product the link refer to
