import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uy_ishi_1123/main.dart';
import 'package:uy_ishi_1123/maxsulot.dart';

class AddApp extends StatefulWidget {
  final int? index;
  const AddApp({super.key, this.index});

  @override
  State<AddApp> createState() => _AddAppState();
}

class _AddAppState extends State<AddApp> {
  TextEditingController nomitxt = TextEditingController();
  TextEditingController sonitxt = TextEditingController();
  @override
  void initState() {
    super.initState();
    if(widget.index != null){
      nomitxt = TextEditingController(
        text: maxsulotBox.getAt(widget.index!)?.nomi??""
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Maxsulot qo'shish"),),
      body: Column(
        children: [
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 5),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 3, color: Colors.green)
            ),
            child: TextField(
              controller: nomitxt,
              style: TextStyle(
                fontSize: 25,
              ),
              decoration: InputDecoration(hintText: "Maxsulot nomi"),
            ),
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 5),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3, color: Colors.green)
            ),
            child: TextField(
              controller: sonitxt,
              style: TextStyle(
                fontSize: 25,
              ),
              decoration: InputDecoration(hintText: "Maxsulot soni"),
            ),
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 5),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3, color: Colors.green)
            ),
            child: MaterialButton(
              onPressed: (){
                if(widget.index != null){
                  int maxsulotSoni = maxsulotBox.getAt(widget.index!)?.soni?? 0;
                  maxsulotSoni = maxsulotSoni + int.parse(sonitxt.text);
                  Maxsulot maxsulot = Maxsulot(nomitxt.text, maxsulotSoni);
                  maxsulotBox.putAt(widget.index!, maxsulot);
                } else {
                  Maxsulot maxsulot = Maxsulot(nomitxt.text, int.parse(sonitxt.text));
                  maxsulotBox.add(maxsulot);
                }
                Navigator.pop(context);
              },
              child: Text("Qo'shishi",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );

  }
}
