import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_9/cubits/get_product_cubit/get_product_cubit.dart';
import 'package:project_9/pages/home_page.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetProductCubit()..getProducts(),
      child: const MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()),
    );
  }
}
