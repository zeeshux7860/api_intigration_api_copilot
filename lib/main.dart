import 'package:api_integration/product_grid.dart';
import 'package:api_integration/util/provider.dart';
import 'package:api_integration/util/provider_callback.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      
    // wrap ProviderApp bcz we need to access the provider
    return ProviderApp(
      child: MaterialApp(
        title: 'First App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ListingPage(),
      ),
    );
  }
}

class ListingPage extends StatefulWidget {
  const ListingPage({super.key});

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  // now we can access the callback instance
  var instance = CallBackProvider.instance;
  @override
  void initState() {
    // only intlize the provider once
    instance.init(value: context);

    // get my all products make sure if u are using methid like this then you need without listner method
    instance.productsProviderWithoutListener.getAll();
    // done there
    super.initState();
  }

// this image is dummy here ok so dont worry about it
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        title: const Text('Product Listing'),
      ),
      // going to use the product grid
      body: const ProductGrid(),
    );
  }
}
