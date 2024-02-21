import 'package:expencetracker/model/expencedata.dart';
import 'package:flutter/material.dart';


class itempage extends StatelessWidget {
  const itempage(this.expence,{super.key});

  final Expence expence;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Card(
        child:Column(
           children: [
            Text(expence.title),
            SizedBox(height: 4,),
            Row(
              children: [
                Text('\$${expence.amount.toStringAsFixed(2)}'),
                Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expence.category]?.icon),
                    SizedBox(width: 4,),
                    Text(formatedate.format(expence.date)),
                  ],
                )
                
              ],
            )
           ],
        ),
      ),
    );
  }
}