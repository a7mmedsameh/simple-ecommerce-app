import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_9/cubits/get_product_cubit/get_product_cubit.dart';
import 'package:project_9/models/product_model.dart';
import 'package:project_9/pages/add_and_edit_product.dart';

class PositionedForAdd extends StatelessWidget {
  const PositionedForAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      right: 16,
      child: FloatingActionButton(
        backgroundColor: const Color(0xffd0e4ff),
        onPressed: () {
          final titleController = TextEditingController();
          final priceController = TextEditingController();
          final imageUrlController = TextEditingController();
          final descriptionController = TextEditingController();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => AddAndEditProduct(
                    pageStatus: 'Add',
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
                      context.read<GetProductCubit>().createProducts(
                        ProductModel(
                          title: title,
                          price: price,
                          images: [image],
                          description: description,
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
        child: const Icon(Icons.add, color: Color(0xff102540)),
      ),
    );
  }
}
