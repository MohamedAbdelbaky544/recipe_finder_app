import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_finder_app/core/presentation/extension/theme.dart';
import 'package:recipe_finder_app/core/presentation/extension/tr.dart';
import 'package:recipe_finder_app/home/presentation/controller/get_meal_controller.dart';

class ProductDetailPage extends ConsumerWidget {
  static const String path = 'product_detail_page';
  const ProductDetailPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, watch) {
    final viewModel = watch.watch(GetFutureMealDetails(id));
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(viewModel.mealData?.strMeal ?? ''),
        centerTitle: true,
      ),
      body: viewModel.mealData == null && viewModel.error == null
          ? Center(child: CircularProgressIndicator())
          : viewModel.error != null
          ? Center(
              child: Column(
                children: [
                  Text(viewModel.error ?? 'Error'),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.getData(id: id);
                    },
                    child: Text('retry'),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: SizedBox(
                      height: 190,
                      width: double.maxFinite,
                      child: viewModel.mealData!.strMealThumb != null
                          ? CachedNetworkImage(
                              imageUrl: viewModel.mealData!.strMealThumb!,
                              fit: BoxFit.fill,
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error, size: 32),
                            )
                          : Icon(Icons.error),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    context.translation.ingredients,
                    style: context.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    viewModel.mealData?.strInstructions ?? '',
                    style: context.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
    );
  }
}
