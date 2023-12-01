import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_kitchen/Pages/home.dart';
import 'package:my_kitchen/Pages/ingredients.dart';
import 'package:my_kitchen/Pages/recipes.dart';
import 'package:my_kitchen/Pages/settings.dart';
import 'package:my_kitchen/Pages/tab_bar_pages.dart';
import 'package:my_kitchen/Themes/theme.dart';
import 'package:my_kitchen/View%20Model/home_page_cubit_state.dart';
import 'package:my_kitchen/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: BlocProvider(
        create: (context) => HomePageCubit(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _pages = [
    const Home(),
    const Ingredients(),
    const Recipes(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return TabBarPages(pages: _pages);
  }
}
