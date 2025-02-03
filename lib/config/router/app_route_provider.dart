import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:minimal/pages/pages.dart';

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
      GoRoute(
        path: '/home',
        name: ListPage.name,
        builder: (context, state) => const ListPage(),
      ),
      GoRoute(
        path: '/post',
        name: PostPage.name,
        builder: (context, state) => const PostPage(),
      ),
      GoRoute(
        path: '/typography',
        name: TypographyPage.name,
        builder: (context, state) => const TypographyPage(),
      ),
    ],
  );
});
