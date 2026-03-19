import 'package:crm_proof_of_concept/src/screens/agenda.dart';
import 'package:crm_proof_of_concept/src/screens/home.dart';
import 'package:crm_proof_of_concept/src/screens/propostas.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String home = '/';
  static const String proposed = '/proposta';
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  debugLogDiagnostics: true,

  routes: [
    GoRoute(
      path: AppRoutes.home,
      name: 'home',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'proposta',
          name: 'proposta',
          builder: (context, state) => const proposedScreen()
        ),
        GoRoute(
          path: 'agenda',
          name: 'agenda',
          builder: (context, state) => const AgendaScreen()
        )
      ],
    )
  ]
);