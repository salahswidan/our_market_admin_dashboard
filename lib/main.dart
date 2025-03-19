import 'package:flutter/material.dart';
import 'package:our_market_admin_dashboard/features/home/views/home_view.dart';

import 'features/auth/view/login_view.dart';

void main() {
  runApp(const MyApp());
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
