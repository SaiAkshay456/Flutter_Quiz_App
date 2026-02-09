import 'package:flutter_basics/bloc/product_detail_bloc/product_detail_event.dart';
import 'package:flutter_basics/bloc/product_detail_bloc/product_detail_state.dart';
import 'package:flutter_basics/respository/productRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailBloc
    extends Bloc<ProductDetailFetchEvent, ProductDetailState> {
  ProductRepository repository;
  ProductDetailBloc(this.repository) : super(ProductDetailInitialState()) {
    on<ProductDetailFetchEvent>((event, emit) async {
      try {
        final product = await repository.fetchProductDetails(event.id);
        emit(ProductDetailLoadedState(productDetails: product));
      } on Exception catch (e) {
        emit(ProductDetailErrorState(errorMessage: e.toString()));
      }
    });
  }
}
