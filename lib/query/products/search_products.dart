import 'package:http/http.dart';

import '/query/params/search_products.dart';
export '/query/params/search_products.dart';
import '/util/global_handler.dart';

Future<Response> fetchSearchProductsMethod(
    {required ParamsSearchProducts params}) async {
  // This is the url that will be called:
  var url = "https://dummyjson.com/products/search?q=Laptop";
  //  Requesting data from the server:
  var response = await GlobalHandler.requestGet(
      path: Uri.parse(url).replace(
        queryParameters: params.query!.toJson(),
      ),
      headersValue: {});

  // This is the response of the request:
  return response;
}
