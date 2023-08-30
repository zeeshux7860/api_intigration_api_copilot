import 'dart:convert';

import 'package:flutter/material.dart';
import '../model//products/get_all.dart';
import '../query//products/get_all.dart';
import '../model//products/single_product.dart';
import '../query//products/single_product.dart';
import '../model//products/search_products.dart';
import '../query//products/search_products.dart';

class ProductsProvider extends ChangeNotifier {
  GetAllModel? getAllModel;
  SingleProductModel? singleProductModel;
  SearchProductsModel? searchProductsModel;
 int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
  Future<GetAllModel?> getAll() async {
    try {
      var response = await fetchGetAllMethod();
      if (response.statusCode == 200) {
        getAllModel = GetAllModel.fromJson(json.decode(response.body));
       
        notifyListeners();
        var result = GetAllModel.fromJson(json.decode(response.body));
        return result;
      } else {
        // throw Exception('Failed to load data');
        // handling error
        getAllModel = GetAllModel.fromJson(json.decode(response.body));
        notifyListeners();

        var result = GetAllModel.fromJson(json.decode(response.body));
        return result;
      }
    } catch (e) {
      if (e is String) {
        throw Exception(e);
      } else {
        throw Exception(e.toString());
      }
    }
  }

  Future<SingleProductModel?> singleProduct() async {
    try {
      var response = await fetchSingleProductMethod();
      if (response.statusCode == 200) {
        singleProductModel =
            SingleProductModel.fromJson(json.decode(response.body));
        notifyListeners();
        var result = SingleProductModel.fromJson(json.decode(response.body));
        return result;
      } else {
        // throw Exception('Failed to load data');
        // handling error
        singleProductModel =
            SingleProductModel.fromJson(json.decode(response.body));
        notifyListeners();

        var result = SingleProductModel.fromJson(json.decode(response.body));
        return result;
      }
    } catch (e) {
      if (e is String) {
        throw Exception(e);
      } else {
        throw Exception(e.toString());
      }
    }
  }

  Future<SearchProductsModel?> searchProducts(
      {required ParamsSearchProducts params}) async {
    try {
      var response = await fetchSearchProductsMethod(params: params);
      if (response.statusCode == 200) {
        searchProductsModel =
            SearchProductsModel.fromJson(json.decode(response.body));
        notifyListeners();
        var result = SearchProductsModel.fromJson(json.decode(response.body));
        return result;
      } else {
        // throw Exception('Failed to load data');
        // handling error
        searchProductsModel =
            SearchProductsModel.fromJson(json.decode(response.body));
        notifyListeners();

        var result = SearchProductsModel.fromJson(json.decode(response.body));
        return result;
      }
    } catch (e) {
      if (e is String) {
        throw Exception(e);
      } else {
        throw Exception(e.toString());
      }
    }
  }
}
