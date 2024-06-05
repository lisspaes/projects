import 'package:flutter_demostration/presentation/ui/animated_screen.dart';
import 'package:flutter_demostration/presentation/ui/buttons_screen.dart';
import 'package:flutter_demostration/presentation/ui/counter_screen.dart';
import 'package:flutter_demostration/presentation/ui/home_screen.dart';
import 'package:flutter_demostration/presentation/ui/infinite_scroll.dart';
import 'package:flutter_demostration/presentation/ui/progress_screen.dart';
import 'package:flutter_demostration/presentation/ui/snackbar_screen.dart';
import 'package:flutter_demostration/presentation/ui/theme_changer_screen.dart';
import 'package:flutter_demostration/presentation/ui/tutorial_screen.dart';
import 'package:flutter_demostration/presentation/ui/ui_controls.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(

  initialLocation: '/',

  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      ),

    GoRoute(
      path: '/counter-river',
      name: CounterScreen.name,
      builder: (context, state) => const CounterScreen(),
      ),

      GoRoute(
      path: '/buttons',
      name: ButtonsScreen.name,
      builder: (context, state) => const ButtonsScreen(),
      ),

      GoRoute(
      path: '/snackbar',
      name: SnackbarScreen.name,
      builder: (context, state) => const SnackbarScreen(),
      ),
      GoRoute(
      path: '/progress',
      name: ProgressScreen.name,
      builder: (context, state) => const ProgressScreen(),
      ),
      GoRoute(
      path: '/animated',
      name: AnimatedScreen.name,
      builder: (context, state) => const AnimatedScreen(),
      ),
      GoRoute(
      path: '/ui-controls',
      name: UiControlsScreen.name,
      builder: (context, state) => const UiControlsScreen(),
      ),
      GoRoute(
      path: '/infinite',
      name: InfiniteScrollScreen.name,
      builder: (context, state) => const InfiniteScrollScreen(),
      ),
      GoRoute(
      path: '/tutorial',
      name: TutotialScreen.name,
      builder: (context, state) => const TutotialScreen(),
      ),
      GoRoute(
      path: '/theme',
      name: ThemeChangerScreen.name,
      builder: (context, state) => const ThemeChangerScreen(),
      ),
  ]

);