import 'package:baby_milestones_tracker/view/page/dashboard/dashboard.dart';
import 'package:baby_milestones_tracker/view/page/onboarding/onboarding.dart';

import 'imports/generalImport.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final router = GoRouter(
  debugLogDiagnostics: false,
  initialLocation: '/',
  routes: [
    // onboarding
    GoRoute(
        name: onboardingPageRoute,
        path: '/',
        builder: (context, state) => const OnBoardingPage()),

    // dash board
    GoRoute(
        name: dashboardPageRoute,
        path: '/dashboardPageRoute',
        builder: (context, state) => const DashboardPage()),
  ],
);