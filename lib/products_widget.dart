import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_basics/bloc/products_bloc/product_bloc.dart';
import 'package:flutter_basics/bloc/products_bloc/product_state.dart';
import 'package:flutter_basics/product_details_screen.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProductLoadedState) {
            return ListView.builder(
              itemCount: state.listOfProducts.length,
              itemBuilder: (context, index) {
                final product = state.listOfProducts[index];

                return ListTile(
                  title: Text(product.title),
                  subtitle: Text('₹ ${product.price}'),
                  leading: CircleAvatar(child: Text(product.title[0])),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            ProductDetailScreen(productId: product.id),
                      ),
                    );
                  },
                );
              },
            );
          }

          if (state is ProductErrorState) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          return const Center(child: Text('No products yet'));
        },
      ),
    );
  }
}
