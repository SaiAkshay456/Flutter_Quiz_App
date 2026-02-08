import "package:dio/dio.dart";
import 'package:flutter_basics/models/ProductResponseModel.dart';
import "package:flutter_basics/core/dio_client.dart";

class ProductRepository {
  ProductRepository();
  Future<List<ProductResponseModel>> fetchProducts() async {
    try {
      final response = await dio.get('https://dummyjson.com/products?limit=15');
      final List products = response.data['products'];
      print(products);
      return products.map((e) => ProductResponseModel.fromJson(e)).toList();
    } on DioException catch (e) {
      throw Exception(e.message ?? 'Failed to fetch products');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
