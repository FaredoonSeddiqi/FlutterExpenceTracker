import 'package:flutter/material.dart';


class chartbar extends StatelessWidget {
  const chartbar({super.key,required this.fill});

  final double fill;
  @override
  Widget build(BuildContext context) {

    final isdarkmode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox(
          heightFactor: fill, 
          child:DecoratedBox(decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.vertical(top:Radius.circular(8)),
            color: isdarkmode ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.primary.withOpacity(0.65),
          )),
        ),
      ),
    );
  }
}