import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_basics/bloc/product_detail_bloc/product_detail_event.dart';
import 'package:flutter_basics/bloc/product_detail_bloc/product_detail_state.dart';
import 'package:flutter_basics/bloc/product_detail_bloc/product_detail_bloc.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductDetailBloc>().add(
      ProductDetailFetchEvent(id: widget.productId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          if (state is ProductDetailLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProductDetailLoadedState) {
            final product = state.productDetails;
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Brand: ${product.brand}'),
                  const SizedBox(height: 8),
                  Text('Price: ₹ ${product.price}'),
                  const SizedBox(height: 8),
                  Text('Rating: ⭐ ${product.rating}'),
                ],
              ),
            );
          }

          if (state is ProductDetailErrorState) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
