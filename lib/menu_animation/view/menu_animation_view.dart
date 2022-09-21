import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/menu_viewmodel.dart';
import 'drawer_menu.dart';

class MenuAnimationView extends StatefulWidget {
  const MenuAnimationView({Key? key}) : super(key: key);

  @override
  State<MenuAnimationView> createState() => _MenuAnimationViewState();
}

class _MenuAnimationViewState extends State<MenuAnimationView>
    with TickerProviderStateMixin {
  late AnimationController _drawerSlideController;
  @override
  void initState() {
    super.initState();
    _drawerSlideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _drawerSlideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<MenuViewmodel>(context);
    return Scaffold(
      appBar: _appBar(viewmodel),
      body: Stack(
        children: [Container(color: Colors.white), _buildDrawer(viewmodel)],
      ),
    );
  }

  Widget _buildDrawer(MenuViewmodel viewmodel) {
    return AnimatedBuilder(
      animation: _drawerSlideController,
      builder: (context, index) {
        return FractionalTranslation(
          translation: Offset(-1.0 + _drawerSlideController.value, 0.0),
          child: viewmodel.isDrawerOpen ? const DrawerMenu() : const SizedBox(),
        );
      },
    );
  }

  PreferredSizeWidget _appBar(MenuViewmodel viewmodel) {
    return AppBar(
      leading: AnimatedBuilder(
        animation: _drawerSlideController,
        builder: (context, child) {
          return IconButton(
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            onPressed: () {
              _toogleDraver(viewmodel);
            },
            icon: AnimatedCrossFade(
              firstChild: const Icon(Icons.menu),
              secondChild: const Icon(Icons.close),
              crossFadeState: viewmodel.isDrawerOpen
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 200),
            ),
          );
        },
      ),
      title: const Text("Menu Animation"),
    );
  }

  void _toogleDraver(MenuViewmodel viewmodel) {
    viewmodel.isDrawerOpen
        ? _drawerSlideController.reverse()
        : _drawerSlideController.forward();
    viewmodel.changeDrawerOpen;
  }
}
