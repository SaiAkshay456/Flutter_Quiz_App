import "package:flutter/material.dart";
import "package:flutter_basics/bloc/product_detail_bloc/product_detail_bloc.dart";
import "package:flutter_basics/bloc/products_bloc/product_bloc.dart";
import "package:flutter_basics/bloc/products_bloc/product_events.dart";
import "package:flutter_basics/products_widget.dart";
import "package:flutter_basics/respository/productRepository.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) =>
              ProductBloc(ProductRepository())..add(ProductFetch()),
        ),
        BlocProvider<ProductDetailBloc>(
          create: (context) => ProductDetailBloc(ProductRepository()),
        ),
      ],
      child: const MaterialApp(home: ProductsWidget()),
    );
  }
}
