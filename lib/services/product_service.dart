import 'package:project_9/models/product_model.dart';
import 'package:project_9/services/api_service.dart';

class ProductService {
  final ApiService apiService = ApiService();

  Future<List<ProductModel>> getProducts() async {
    final data = await apiService.get(endPoint: '/products');
    List<ProductModel> productModel =
        (data as List).map((item) => ProductModel.fromJson(item)).toList();
    return productModel;
  }

  Future<ProductModel> createProduct(ProductModel product) async {
    final data = await apiService.post(
      endPoint: '/products',
      data: product.toJson(),
    );
    ProductModel productModel = ProductModel.fromJson(data);
    return productModel;
  }

  Future<ProductModel> updateProduct(ProductModel product) async {
    final data = await apiService.put(
      endPoint: '/products/${product.id}',
      data: product.toJson(),
    );
    ProductModel productModel = ProductModel.fromJson(data);
    return productModel;
  }

  Future<void> deleteProduct(int id) async {
    await apiService.delete(endPoint: '/products/$id');
  }
}
