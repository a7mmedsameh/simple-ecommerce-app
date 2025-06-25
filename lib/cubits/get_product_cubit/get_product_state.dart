import 'package:project_9/models/product_model.dart';

class ProductState {}

class ProductLoadinState extends ProductState {}

class ProductSuccesLoadState extends ProductState {
  final List<ProductModel> productModel;

  ProductSuccesLoadState(this.productModel);
}

class ProductErrorState extends ProductState {
  final String error;

  ProductErrorState(this.error);
}
