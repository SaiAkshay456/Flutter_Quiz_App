import "package:dio/dio.dart";
import "package:flutter_basics/models/ProductDetailModel.dart";
import 'package:flutter_basics/models/ProductResponseModel.dart';
import "package:flutter_basics/core/dio_client.dart";

class ProductRepository {
  ProductRepository();
  Future<List<ProductResponseModel>> fetchProducts(int page) async {
    try {
      final response = await dio.get('/products?limit=20&page=$page');
      final List products = response.data['products'];
      print(products);
      return products.map((e) => ProductResponseModel.fromJson(e)).toList();
    } on DioException catch (e) {
      throw Exception(e.message ?? 'Failed to fetch products');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<ProductDetailModel> fetchProductDetails(String id) async {
    try {
      final response = await dio.get('/products/$id');
      if (response.statusCode == 200) {
        return ProductDetailModel.fromJson(
          response.data as Map<String, dynamic>,
        );
      } else {
        throw Exception(
          'Failed to load product details. Status: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw Exception(
        e.response?.data?['message'] ?? 'Network error: ${e.message}',
      );
    }
  }
}
