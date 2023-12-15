import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uy_ishi_1123/add.dart';
import 'package:uy_ishi_1123/maxsulot.dart';
late Box<Maxsulot> maxsulotBox;
//salommmmmm

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MaxsulotAdapter());
  maxsulotBox = await Hive.openBox("maxsulotBox");
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false,));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maxsulotlar"),
      ),
      body: ListView.builder(
        itemCount: maxsulotBox.length,
          itemBuilder: (BuildContext context , int index){
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> AddApp(index: index,))).then((value){setState(() {
                  });});
                },
                child: Container(
                  margin: EdgeInsets.only(top: 5 , bottom: 5 , right: 10, left: 10),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(width: 3 , color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Nomi : ${maxsulotBox.getAt(index)?.nomi??""}",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Nomi : ${maxsulotBox.getAt(index)?.soni??""}",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15,),
                      MaterialButton(
                        onPressed: (){
                          setState(() {
                            maxsulotBox.deleteAt(index);
                          });
                        },
                        child: Icon(Icons.remove),
                      ),
                    ],
                  ),
                ),
              );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=> AddApp())).then((value){setState(() {

          });});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
