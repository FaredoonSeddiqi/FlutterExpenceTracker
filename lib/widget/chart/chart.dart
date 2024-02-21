// import 'package:expencetracker/model/expencedata.dart';
// import 'package:flutter/material.dart';
// import '../chart/charbar.dart';

// class chart extends StatelessWidget {
//   const chart({super.key,required this.expences});


//   final List<Expence> expences;
//   List<expenBuket> get bugkets{
//     return [
//       expenBuket(category: Category.food, expence: expences),
//       expenBuket(category: Category.sport, expence: expences),
//       expenBuket(category: Category.travel, expence: expences),
//       expenBuket(category: Category.work, expence: expences),



//     ];
//   }

//   double get maxtotalExpence{

//     double maxtotalExpence = 0;

//     for(final bugkets in bugkets){
//       if(bugkets.totalexpence >maxtotalExpence){
//         maxtotalExpence = bugkets.totalexpence;
//       }
//     }

//     return maxtotalExpence;

//   }
//   @override
//   Widget build(BuildContext context) {
//     final isdarkmode = MediaQuery.of(context).platformBrightness == Brightness.dark;

//     return Container(
//       margin: EdgeInsets.all(16),
//       padding: EdgeInsets.symmetric(horizontal:8,vertical: 16),
//       width: double.infinity,
//       height: 180,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         gradient: LinearGradient(colors: [
//           Theme.of(context).colorScheme.primary.withOpacity(0.3),
//           Theme.of(context).colorScheme.primary.withOpacity(0.0),
         
//         ],
//         begin: Alignment.bottomCenter,
//         end: Alignment.topCenter,
//         ),
        
//       ),
//       child: Column(
//         children: [
//             Expanded(child: Row(
//               children: [
//                 for(final bugket in bugkets)
//                   chartbar(fill: bugket.totalexpence/maxtotalExpence)
//               ],
//             )
//             ),
//             SizedBox(height: 12,),
//             Row(children:bugkets.map((bugket)=>Expanded(child: Padding(padding:const EdgeInsets.symmetric(horizontal: 4),
//             child: Icon(
//               categoryIcons[]
//               color: isdarkmode ? Theme.of(context).colorScheme.secondary
//             : Theme.of(context).colorScheme.primary.withOpacity(0.7),
//             ),
//             )),).toList(),),
//         ],
//       ),
//     );
//   }
// }