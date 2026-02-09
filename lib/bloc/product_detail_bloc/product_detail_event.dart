import 'package:equatable/equatable.dart';

abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();
}

class ProductDetailFetchEvent extends ProductDetailEvent {
  final String id;
  const ProductDetailFetchEvent({required this.id});
  @override
  List<Object?> get props => [id];
}
