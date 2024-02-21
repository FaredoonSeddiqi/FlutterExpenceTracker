import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatedate = DateFormat.yMd();

const uuid = Uuid();

const categoryIcons = {
  Category.food:Icon(Icons.food_bank),
  Category.sport:Icon(Icons.sports_baseball),
  Category.travel:Icon(Icons.travel_explore_rounded),
  Category.work:Icon(Icons.work)
};

enum Category {food,travel,sport,work}
class Expence{
Expence({required this.title,required this.amount,required this.date,required this.category}):id =uuid.v4();

final String id;
final String title;
final double amount;
final DateTime date;
final Category category;



}

class expenBuket{
 
  const expenBuket({required this.category,required this.expence});
   
  expenBuket.forCatogory(List<Expence> allexpence,this.category):expence = allexpence.where((expence) => expence.category == category).toList();

  final Category category;
  final List<Expence> expence;
  
  double get totalexpence{
    double sum = 0;
    for(final expences in expence){
      sum += sum+expences.amount;
    }
    return sum;
  }
}