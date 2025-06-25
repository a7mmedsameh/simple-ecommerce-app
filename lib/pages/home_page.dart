import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_9/cubits/get_product_cubit/get_product_cubit.dart';
import 'package:project_9/cubits/get_product_cubit/get_product_state.dart';
import 'package:project_9/widgets/custom_gridveiw_builder.dart';
import 'package:project_9/widgets/positioned_for_add.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xff366291),
        title: const Text(
          style: TextStyle(color: Colors.white),
          'Ecommerce App',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              BlocProvider.of<GetProductCubit>(context).getProducts();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          BlocBuilder<GetProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductLoadinState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductSuccesLoadState) {
                return CustomGridveiwBuilder(products: state.productModel);
              } else if (state is ProductErrorState) {
                return Center(child: Text('Error: ${state.error}'));
              } else {
                return const SizedBox();
              }
            },
          ),
          const PositionedForAdd(),
        ],
      ),
    );
  }
}
