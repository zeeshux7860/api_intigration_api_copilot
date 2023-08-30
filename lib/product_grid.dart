import 'package:api_integration/product_card.dart';
import 'package:api_integration/util/provider_callback.dart';
import 'package:flutter/material.dart';

var instance = CallBackProvider.instance;

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
// only intlize the provider once 
    instance.init(value: context);
    
    // now we can access the callback instance

    return instance.productsProviderListener.getAllModel == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns in the grid
              crossAxisSpacing: 10.0, // Spacing between columns
              mainAxisSpacing: 10.0, // Spacing between rows
            ),
            // make sure u are using the listner method
            itemCount:
                instance.productsProviderListener.getAllModel!.products!.length,
            itemBuilder: (ctx, index) {
              final product = instance
                  .productsProviderListener.getAllModel!.products![index];
              return ProductCard(
                name: product.title!,
                price: product.price!.toDouble(),
                image: product.images![0],
              );
            },
          );
  }
}


// i will share the full code in the how it's work section
// so dont worry about it
// i hope u understand the concept
// if u have any doubt then ask me
// thank you
// happy coding