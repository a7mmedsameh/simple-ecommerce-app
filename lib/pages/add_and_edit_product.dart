import 'package:flutter/material.dart';
import 'package:project_9/widgets/custom_text_field.dart';

class AddAndEditProduct extends StatelessWidget {
  const AddAndEditProduct({
    super.key,
    required this.pageStatus,
    required this.onPressed,
    required this.titleController,
    required this.priceController,
    required this.imageUrlController,
    required this.descriptionController,
  });
  final String pageStatus;
  final VoidCallback onPressed;
  final TextEditingController titleController;
  final TextEditingController priceController;
  final TextEditingController imageUrlController;
  final TextEditingController descriptionController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xff366291),
        title: Text(
          '$pageStatus Product',
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: CustomTextField(
                controller: titleController,
                hintText: 'Title',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: CustomTextField(
                controller: priceController,
                hintText: 'Price',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: CustomTextField(
                controller: descriptionController,
                hintText: 'Description',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: CustomTextField(
                controller: imageUrlController,
                hintText: 'Image URL',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff366291),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    elevation: 0,
                  ),
                  child: Text(
                    "$pageStatus Product",
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
