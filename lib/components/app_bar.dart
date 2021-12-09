import 'package:flutter/material.dart';

class AppBarComponet extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const AppBarComponet({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.purple,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}