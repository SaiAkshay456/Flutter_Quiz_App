import "package:flutter_basics/core/dio_client.dart";
import 'package:flutter_basics/bloc/products_bloc/product_events.dart';
import 'package:flutter_basics/bloc/products_bloc/product_state.dart';
import 'package:flutter_basics/respository/productRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository repository;
  ProductBloc(this.repository) : super(ProductInitialState()) {
    on<ProductFetch>((event, emit) async {
      emit(ProductLoadingState());
      try {
        final products = await repository.fetchProducts();
        emit(ProductLoadedState(listOfProducts: products));
      } catch (err) {
        print(err);
        emit(ProductErrorState(errorMessage: err.toString()));
      }
    });
  }
}
