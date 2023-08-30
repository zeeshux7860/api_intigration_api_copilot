import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dummy_api.dart';
import '../provider/products.dart';
import '../provider/cart.dart';

class ProviderApp extends StatelessWidget {
  final Widget child;
  const ProviderApp({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // this is all the provider we have in the app
    return MultiProvider(providers: [
      ChangeNotifierProvider<DummyApiProvider>(
          create: (_) => DummyApiProvider()),
      ChangeNotifierProvider<ProductsProvider>(
          create: (_) => ProductsProvider()),
      ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
    ], child: child);
  }
}
