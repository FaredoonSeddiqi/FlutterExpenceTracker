import 'package:expencetracker/model/expencedata.dart';
import 'package:flutter/material.dart';
class newExpence extends StatefulWidget {
  const newExpence({super.key, required this.onadditem});

  final void Function(Expence expence) onadditem;

  @override
  State<newExpence> createState() => _newExpenceState();
}

class _newExpenceState extends State<newExpence> {
  final titlecontrolle = TextEditingController();
  final amount = TextEditingController();
  DateTime? selectDate;
  Category selectcategory = Category.food;


  void showdatapicker() async{
    final now = DateTime.now();
    final firstdate = DateTime(now.year - 1,now.month,now.day);
    final pickdate = await showDatePicker(context: context, initialDate:now, firstDate: firstdate, lastDate:now);
    setState(() {
      selectDate = pickdate;
    });
  }

  void submitevalue(){
      final enteramount = double.tryParse(amount.text);
      final amountisvalid = enteramount == null || enteramount<=0;

      if(titlecontrolle.text.trim().isEmpty || amountisvalid || selectDate == null){
        showDialog(context: context, builder:((context) => AlertDialog(
          title: const Text('validate the input'),
          content: const Text('Enter the valid amount,date,Title'),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('okay'))
          ],
        )));
        return;
      }
      widget.onadditem(Expence(title: titlecontrolle.text, amount: enteramount, date: selectDate!, category: selectcategory));
      Navigator.pop(context);
  }
  @override
  void dispose() {
    titlecontrolle.dispose();
    amount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16,48,16,16),
      child: Column(
        children: [
          TextField(
            controller: titlecontrolle,
            maxLength: 50,
            decoration: InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amount,
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(prefixText: '\$', label: Text("amount")),
                ),
              ),
              Expanded(
                
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(selectDate == null ? formatedate.format(DateTime.now()) : formatedate.format(selectDate!) ),
                  IconButton(onPressed: showdatapicker, icon: Icon(Icons.calendar_month))
                ],
              ))
            ],
          ),
          Row(
            children: [
              DropdownButton(
                value: selectcategory,
                items: Category.values.map((Category) => DropdownMenuItem(
                value:Category,
                child:Text(Category.name.toString()))).toList(), onChanged: (value){
                  if(value == null){
                    return;
                  }
                  setState(() {
                    selectcategory = value;
                  });
              }),
              Spacer(),
              SizedBox(height: 10,),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              ElevatedButton(onPressed: submitevalue, child: Text("save")),
            ],
          )
        ],
      ),
    );
  }
}
