import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_9/cubits/get_product_cubit/get_product_state.dart';
import 'package:project_9/models/product_model.dart';
import 'package:project_9/services/product_service.dart';

class GetProductCubit extends Cubit<ProductState> {
  GetProductCubit() : super(ProductLoadinState());

  void getProducts() async {
    emit(ProductLoadinState());
    try {
      List<ProductModel> productModel = await ProductService().getProducts();
      emit(ProductSuccesLoadState(productModel));
    } catch (e) {
      emit(ProductErrorState(e.toString()));
    }
  }

  void createProducts(ProductModel product) async {
    emit(ProductLoadinState());
    try {
      await ProductService().createProduct(product);
      getProducts();
    } catch (e) {
      emit(ProductErrorState(e.toString()));
    }
  }

  void deleteProducts(int id) async {
    emit(ProductLoadinState());
    try {
      await ProductService().deleteProduct(id);
      getProducts();
    } catch (e) {
      emit(ProductErrorState(e.toString()));
    }
  }

  void updateProducts(ProductModel product) async {
    emit(ProductLoadinState());
    try {
      await ProductService().updateProduct(product);
      getProducts();
    } catch (e) {
      emit(ProductErrorState(e.toString()));
    }
  }
}
