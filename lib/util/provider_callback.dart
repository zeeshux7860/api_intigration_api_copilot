import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dummy_api.dart';
import '../provider/products.dart';
import '../provider/cart.dart';

class CallBackProvider {
  late BuildContext? context;

  /// init method
  ///  [config] is required to get callback from phonepe gateway app to your app after payment is done or failed or cancelled by user or by phonepe gateway app itself due to some error or any other reason
  void init({required BuildContext value}) {
    context = value;
  }

  // instance of this class
  static final CallBackProvider _instance = CallBackProvider();

  // getter of this class
  /// [instance] is used to get instance of this class
  static CallBackProvider get instance => _instance;

  // get Provider of this class
  // [provider] is used to get provider of this class
  // [listen] is used to listen changes in provider
  DummyApiProvider get dummyApiProviderWithoutListener =>
      Provider.of<DummyApiProvider>(context!, listen: false);
  DummyApiProvider get dummyApiProviderListener =>
      Provider.of<DummyApiProvider>(context!, listen: true);

  // get Provider of this class
  // [provider] is used to get provider of this class
  // [listen] is used to listen changes in provider
  ProductsProvider get productsProviderWithoutListener =>
      Provider.of<ProductsProvider>(context!, listen: false);
  ProductsProvider get productsProviderListener =>
      Provider.of<ProductsProvider>(context!, listen: true);

  // get Provider of this class
  // [provider] is used to get provider of this class
  // [listen] is used to listen changes in provider
  CartProvider get cartProviderWithoutListener =>
      Provider.of<CartProvider>(context!, listen: false);
  CartProvider get cartProviderListener =>
      Provider.of<CartProvider>(context!, listen: true);
}

/// Path: lib/util/provider_callback.dart
/// initlize this class in your main.dart file
/// CallBackProvider.instance.init(value: context);
///

/// Path: lib/util/provider_callback.dart
/// use this class in your main.dart file
/// CallBackProvider.instance.CrudExpressCopyProviderWithoutListener;
/// CallBackProvider.instance.CrudExpressCopyProviderListener;
