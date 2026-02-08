import "package:flutter/material.dart";
import "package:flutter_basics/bloc/products_bloc/product_bloc.dart";
import "package:flutter_basics/bloc/products_bloc/product_events.dart";
import "package:flutter_basics/products_widget.dart";
import "package:flutter_basics/respository/productRepository.dart";
import "package:flutter_bloc/flutter_bloc.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (BuildContext context) =>
              ProductBloc(ProductRepository())..add(ProductFetch()),
        ),
      ],
      child: const MaterialApp(home: ProductsWidget()),
    );
  }
}
