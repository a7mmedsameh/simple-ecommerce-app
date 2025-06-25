import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_9/cubits/get_product_cubit/get_product_cubit.dart';
import 'package:project_9/models/product_model.dart';

class IconForDeleteProduct extends StatelessWidget {
  const IconForDeleteProduct({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8,
      child: CircleAvatar(
        backgroundColor: const Color.fromARGB(146, 255, 255, 255),
        child: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: const Color(0xffe8e7ec),
                  title: const Text('Delete Product'),
                  content: Text(
                    'Are you sure you want to delete "${productModel.title}"?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color.fromARGB(255, 78, 109, 145),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<GetProductCubit>().deleteProducts(productModel.id!);
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${productModel.title} has been deleted.',
                            ),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      child: const Text(
                        'Delete',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
