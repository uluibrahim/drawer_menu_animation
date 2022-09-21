import 'package:flutter/material.dart';
import 'package:munu_animation/menu_animation/viewmodel/menu_viewmodel.dart';
import 'package:provider/provider.dart';


import 'menu_animation/view/menu_animation_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu animation',
      home: ChangeNotifierProvider(
        create: (context) => MenuViewmodel(),
        child: const MenuAnimationView(),
      ),
    );
  }
}
