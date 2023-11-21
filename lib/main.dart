import 'package:flutter/material.dart';
import 'package:harta_karun/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            child: MaterialApp(
                title: 'Harta Karun',
                theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 100, 49, 6)),
                    useMaterial3: true,
                ),
                home: LoginPage()),
        );
    }
}