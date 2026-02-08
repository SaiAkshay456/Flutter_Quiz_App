import 'package:equatable/equatable.dart';
import 'package:flutter_basics/models/ProductResponseModel.dart';

abstract class ProductState extends Equatable {
  const ProductState();
  @override
  List<Object?> get props => [];
}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {
  const ProductLoadingState();
}

class ProductLoadedState extends ProductState {
  final List<ProductResponseModel> listOfProducts;
  const ProductLoadedState({required this.listOfProducts});
  @override
  List<Object?> get props => [listOfProducts];
}

class ProductErrorState extends ProductState {
  final String errorMessage;
  const ProductErrorState({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
