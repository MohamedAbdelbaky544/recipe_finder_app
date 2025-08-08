import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_finder_app/core/presentation/extension/theme.dart';
import 'package:recipe_finder_app/home/presentation/controller/get_random_meal_controller.dart';
import 'package:recipe_finder_app/core/presentation/extension/tr.dart';
import 'package:recipe_finder_app/home/presentation/pages/product_detail_page.dart';
import 'package:recipe_finder_app/home/presentation/widgets/search_text_widget.dart';

class HomePage extends ConsumerWidget {
  static const String path = '/Home_Page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, watch) {
    final viewModel = watch.watch(GetFutureMeal);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translation.searchRecipes),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            SearchTextField(
              onChanged: (value) {
                viewModel.getData(search: value);
              },
            ),
            SizedBox(height: 16),
            viewModel.mealData.isEmpty && viewModel.error == null
                ? Expanded(child: Center(child: CircularProgressIndicator()))
                : viewModel.error != null
                ? Column(
                    children: [
                      Center(child: Text(viewModel.error ?? 'Error')),
                      ElevatedButton(
                        onPressed: () {
                          viewModel.getData(search: 'a');
                        },
                        child: Text('retry'),
                      ),
                    ],
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: viewModel.mealData.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsetsGeometry.only(bottom: 16),
                          child: GestureDetector(
                            onTap: () {
                              context.pushNamed(
                                ProductDetailPage.path,
                                queryParameters: {
                                  'id': viewModel.mealData[index].idMeal,
                                },
                              );
                            },
                            child: Container(
                              height: 190,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: 190,
                                    width: double.maxFinite,
                                    child:
                                        viewModel
                                                .mealData[index]
                                                .strMealThumb !=
                                            null
                                        ? CachedNetworkImage(
                                            imageUrl: viewModel
                                                .mealData[index]
                                                .strMealThumb!,
                                            fit: BoxFit.fill,
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(
                                                      Icons.error,
                                                      size: 32,
                                                    ),
                                          )
                                        : Icon(Icons.error),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsGeometry.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          viewModel.mealData[index].strMeal,
                                          style: context
                                              .textTheme
                                              .headlineMedium
                                              ?.copyWith(
                                                color: context
                                                    .appColor
                                                    .textColor
                                                    .white,
                                              ),
                                        ),
                                        Text(
                                          viewModel.mealData[index].strArea ??
                                              '',
                                          style: context.textTheme.bodyMedium
                                              ?.copyWith(
                                                color: context
                                                    .appColor
                                                    .textColor
                                                    .white,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
