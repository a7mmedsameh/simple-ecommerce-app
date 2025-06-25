import 'package:flutter/material.dart';
import 'package:project_9/models/product_model.dart';
import 'package:project_9/widgets/custom_gesture_detector_change.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Title: ${productModel.title}',
            maxLines: 1,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'Description: ${productModel.description}',
            maxLines: 1,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '\$${productModel.price.round().toString()}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          CustomGestureDetectorChange(productModel: productModel),
        ],
      ),
    );
  }
}
