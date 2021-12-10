import 'package:flutter/material.dart';

class AppSectionTitle extends StatelessWidget {
  final String title;
  const AppSectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Expanded(
        child: Text(
          title,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
