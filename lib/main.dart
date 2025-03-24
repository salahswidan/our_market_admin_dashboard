import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market_admin_dashboard/core/my_observer.dart';
import 'package:our_market_admin_dashboard/features/home/views/home_view.dart';

import 'features/auth/view/login_view.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = MyObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Our Market Admin',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: HomeView(),
    );
  }
}
