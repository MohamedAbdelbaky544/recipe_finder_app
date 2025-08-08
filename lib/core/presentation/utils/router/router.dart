import 'package:recipe_finder_app/core/presentation/utils/router/route_info.dart';
import 'package:recipe_finder_app/home/presentation/pages/home_page.dart';
import 'package:recipe_finder_app/home/presentation/pages/product_detail_page.dart';

class Routes {
  Routes._();
  static Routes I = Routes._();

  final route = [
    RouteInfo(
      path: HomePage.path,
      builder: (context, state) => HomePage(),

      routes: [
        RouteInfo(
          path: ProductDetailPage.path,
          builder: (context, state) =>
              ProductDetailPage(id: state.uri.queryParameters['id']!),
        ),
      ],
    ),
  ];
}
