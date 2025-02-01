import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  ChartBar({super.key, required this.fill});

  var fill = 0.0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FractionallySizedBox(
        alignment: Alignment.bottomCenter,
        heightFactor: fill,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              shape: BoxShape.rectangle),
        ),
      ),
    );
  }
}
