import 'dart:math';

import 'package:expencetracker/main.dart';
import 'package:expencetracker/widget/chart/chart.dart';
import 'package:expencetracker/widget/expenceslist/expencelist.dart';
import 'package:expencetracker/widget/newexpences.dart';
import 'package:flutter/material.dart';
import 'package:expencetracker/model/expencedata.dart';

class expencepage extends StatefulWidget {
  const expencepage({super.key});

  @override
  State<expencepage> createState() => _expencepageState();
}

class _expencepageState extends State<expencepage> {
  final List<Expence> registerd = [
   
  ];

  void openadditem() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: ((context) => newExpence(
              onadditem: addexpence,
            )));

  }

  void addexpence(Expence expence) {
    setState(() {
      registerd.add(expence);
    });
  }

  void removeExpence(Expence expence){
    final expencesindex = registerd.indexOf(expence);
    setState(() {
      registerd.remove(expence);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: Text('Removed'),
      action: SnackBarAction(label:'Undo', onPressed: (){
        setState(() {
          registerd.insert(expencesindex,expence);
        });
      }),
      
      ));
  }

  @override
  Widget build(BuildContext context) {
  // final width = MediaQuery.of(context).size.width;

    Widget maincontent = Center(child: Text('No Expences'),);
    if(registerd.isNotEmpty){
      maincontent =  ExpenceList(expence: registerd, onremoveExpence: removeExpence,);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Expences Tracker'),
        actions: [
          IconButton(
            onPressed: openadditem,
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
        //   chart(expences: registerd),
         maincontent,
        ],
      ),
      // width < 600 ? Column(
      //   children: [
      //   //   chart(expences: registerd),
      //    maincontent,
      //   ],
      // ):Row(
      //   children: [
      //     maincontent,
      //   ],
      // ),
    );
  }
}
