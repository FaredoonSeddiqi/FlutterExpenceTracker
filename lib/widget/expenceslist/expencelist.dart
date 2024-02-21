import 'package:expencetracker/model/expencedata.dart';
import 'package:expencetracker/widget/expenceitem.dart';
import 'package:flutter/material.dart';

class ExpenceList extends StatelessWidget {
  const ExpenceList({super.key, required this.expence, required this.onremoveExpence});
  final void Function(Expence expence) onremoveExpence;
  final List<Expence> expence;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: expence.length,
        itemBuilder: (ctx, index) => Dismissible(
            key: ValueKey(expence[index]),
            onDismissed: (direction){
              onremoveExpence(expence[index]);
            },
            child: itempage(expence[index])));
  }
}
