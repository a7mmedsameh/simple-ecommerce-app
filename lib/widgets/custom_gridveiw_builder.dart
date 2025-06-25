import 'package:flutter/material.dart';
import 'package:project_9/models/product_model.dart';
import 'package:project_9/widgets/custom_product_card.dart';

class CustomGridveiwBuilder extends StatelessWidget {
  final List<ProductModel> products;

  const CustomGridveiwBuilder({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.55,
      ),
      itemCount: products.length,
      itemBuilder: (context, i) {
        return CustomProductCard(productModel: products[i]);
      },
    );
  }
}
