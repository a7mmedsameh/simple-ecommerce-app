import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_9/cubits/get_product_cubit/get_product_cubit.dart';
import 'package:project_9/models/product_model.dart';
import 'package:project_9/pages/add_and_edit_product.dart';

class CustomGestureDetectorEdit extends StatelessWidget {
  const CustomGestureDetectorEdit({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final titleController = TextEditingController(text: productModel.title);
        final priceController = TextEditingController(
          text: productModel.price.toString(),
        );
        final imageUrlController = TextEditingController(
          text: productModel.images.first,
        );
        final descriptionController = TextEditingController(
          text: productModel.description,
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => AddAndEditProduct(
                  pageStatus: 'Edit',
                  onPressed: () {
                    final title = titleController.text;
                    final price = num.tryParse(priceController.text);
                    final image = imageUrlController.text;
                    final description = descriptionController.text;
                    if (title.isEmpty ||
                        image.isEmpty ||
                        description.isEmpty ||
                        price == null ||
                        price <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill all fields correctly'),
                        ),
                      );
                      return;
                    }
                    if (image.startsWith('http')) {
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('error image URL')),
                      );
                      return;
                    }
                    Navigator.pop(context);
                    context.read<GetProductCubit>().updateProducts(
                      ProductModel(
                        title: title,
                        price: price,
                        images: [image],
                        description: description,
                        id: productModel.id,
                        categoryId: 1,
                      ),
                    );
                  },
                  titleController: titleController,
                  priceController: priceController,
                  imageUrlController: imageUrlController,
                  descriptionController: descriptionController,
                ),
          ),
        );
      },
      child: const Text(
        'Edit Product',
        style: TextStyle(color: Colors.grey, fontSize: 14),
      ),
    );
  }
}
