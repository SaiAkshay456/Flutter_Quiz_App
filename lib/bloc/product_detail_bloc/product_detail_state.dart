import 'package:equatable/equatable.dart';
import 'package:flutter_basics/models/ProductDetailModel.dart';

abstract class ProductDetailState extends Equatable {
  const ProductDetailState();
  @override
  List<Object?> get props => [];
}

class ProductDetailInitialState extends ProductDetailState {}

class ProductDetailLoadingState extends ProductDetailState {}

class ProductDetailLoadedState extends ProductDetailState {
  final ProductDetailModel productDetails;
  const ProductDetailLoadedState({required this.productDetails});
  @override
  List<Object?> get props => [productDetails];
}

class ProductDetailErrorState extends ProductDetailState {
  final String errorMessage;
  const ProductDetailErrorState({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
