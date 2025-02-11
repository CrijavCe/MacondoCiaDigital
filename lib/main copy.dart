import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:minimal/presentation/pages/z_pages.dart';
import 'package:minimal/routes.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    usePathUrlStrategy();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
        child: child!,
      ),
      initialRoute: '/',
      onGenerateInitialRoutes: (initialRoute) {
        final Uri uri = Uri.parse(initialRoute);
        return [
          buildPage(path: uri.path, queryParams: uri.queryParameters),
        ];
      },
      onGenerateRoute: (RouteSettings settings) {
        final Uri uri = Uri.parse(settings.name ?? '/');
        return buildPage(path: uri.path, queryParams: uri.queryParameters);
      },
      debugShowCheckedModeBanner: false,
    );
  }

  Route<dynamic> buildPage(
      {required String path, Map<String, String> queryParams = const {}}) {
    return Routes.noAnimation(
        settings: RouteSettings(
            name: (path.startsWith('/') == false) ? '/$path' : path),
        builder: (context) {
          String pathName =
              path != '/' && path.startsWith('/') ? path.substring(1) : path;
          return switch (pathName) {
            '/' || HomePage.name => const HomePage(),
            PostPage.name => const ResponsiveBreakpoints(breakpoints: [
                Breakpoint(start: 0, end: 480, name: MOBILE),
                Breakpoint(start: 481, end: 1200, name: TABLET),
                Breakpoint(start: 1201, end: double.infinity, name: DESKTOP),
              ], child: PostPage()),
            TypographyPage.name => const TypographyPage(),
            _ => const SizedBox.shrink(),
          };
        });
  }
}
