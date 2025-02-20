import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:minimal/presentation/pages/more_page.dart';
import 'package:minimal/presentation/pages/us_page.dart';
import 'package:minimal/presentation/pages/z_pages.dart';
import 'package:minimal/presentation/widget/minimal_menu_bar_wg.dart';
import 'package:minimal/shared/assets/widgets/shared.dart';
import 'package:responsive_framework/responsive_framework.dart';

// Provider de GoRouter
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: SplashScreen.name,
        builder: (context, state) => const SplashScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return MainLayout(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            name: HomePage.name,
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: '/us',
            name: UsPage.name,
            builder: (context, state) => const UsPage(),
            // builder: (context, state) => const PostPage(),
          ),
          GoRoute(
            path: '/more',
            name: MorePage.name,
            builder: (context, state) => const MorePage(),
          ),
          GoRoute(
            path: '/typography',
            name: TypographyPage.name,
            builder: (context, state) => const TypographyPage(),
          ),
          GoRoute(
            path: '/register',
            name: PageRegister.name,
            builder: (context, state) => const PageRegister(),
          ),
        ],
      ),
    ],
  );
});

class MainLayout extends StatelessWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      floatingActionButton: CustomFloatingActionButton(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: Colors.transparent,
            toolbarHeight: size.height * 0.30,
            flexibleSpace: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
              child: Container(
                height: size.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white, // Fondo blanco
                  borderRadius: BorderRadius.circular(15), // Bordes redondeados
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: const MinimalMenuBar(),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: MaxWidthBox(
                maxWidth: 1600,
                backgroundColor: Colors.transparent,
                child: child),
          ),
        ],
      ),
    );
  }
}
