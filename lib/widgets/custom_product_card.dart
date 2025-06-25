import 'package:flutter/material.dart';
import 'package:project_9/models/product_model.dart';
import 'package:project_9/widgets/content_card.dart';
import 'package:project_9/widgets/icon_for_delete_product.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 236, 233, 233),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.network(
                  productModel.images.first,
                  fit: BoxFit.cover,
                  height: 187,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 187,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.broken_image,
                        color: Colors.red,
                        size: 40,
                      ),
                    );
                  },
                ),
              ),
              IconForDeleteProduct(productModel: productModel),
            ],
          ),
          ContentCard(productModel: productModel),
        ],
      ),
    );
  }
}
