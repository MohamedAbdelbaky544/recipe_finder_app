import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_finder_app/core/presentation/themes/app_theme.dart';
import 'package:recipe_finder_app/core/presentation/utils/generated/translation/translations.dart';
import 'package:recipe_finder_app/core/presentation/utils/router/route_info.dart';
import 'package:recipe_finder_app/core/presentation/utils/router/router.dart';
import 'package:recipe_finder_app/home/presentation/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: const Locale('en'),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: Translations.localizationsDelegates,
      supportedLocales: Translations.supportedLocales,
      theme: Theme.of(context).appTheme(Brightness.light).getThemeData(context),
      routerConfig: _goRouterConfig,
      themeMode: ThemeMode.light,
      builder: (context, widget) {
        return MediaQuery.withClampedTextScaling(
          minScaleFactor: 0.8,
          maxScaleFactor: 1.2,
          child: Builder(
            builder: (context) {
              if (widget == null) {
                return const SizedBox();
              }
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: SafeArea(
                  top: false,
                  left: false,
                  right: false,
                  child: widget,
                ),
              );
            },
          ),
        );
      },
    );
  }
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter _goRouterConfig = GoRouter(
  initialLocation: HomePage.path,
  navigatorKey: _rootNavigatorKey,
  routes: _getRoutes(Routes.I.route),
);

List<RouteBase> _getRoutes(List<RouteInfo>? routes) => (routes ?? [])
    .map(
      (subRoutes) => GoRoute(
        path: subRoutes.path,
        name: subRoutes.name ?? subRoutes.path,
        builder: (context, state) => subRoutes.builder(context, state),
        routes: _getRoutes(subRoutes.routes),
      ),
    )
    .toList();
