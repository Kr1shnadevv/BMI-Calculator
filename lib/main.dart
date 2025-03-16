import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true, // Uses Material 3 design
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }

}
class MyHomeState extends State<MyHomePage>{
  var weight = TextEditingController();
  var feet = TextEditingController();
  var inch = TextEditingController();
  var result = "";
  var bgcolor;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI',style: TextStyle(
            color: Colors.white,fontWeight: FontWeight.w700),
        )
        ),
        backgroundColor: Colors.blue,

      ),
      body: Container(
        color: bgcolor,
        child: Center(

          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI Calculator',style: TextStyle(
                  fontSize: 31,
                  fontWeight: FontWeight.bold,
                  //
                ),),
                TextField(
                  controller: weight,
                  decoration: InputDecoration(
                      label: Text('Enter Weight (in Kgs)')
                  ),
                ),
                TextField(
                  controller: feet,
                  decoration: InputDecoration(
                      label: Text('Enter Height (in feet)')
                  ),
                ),
                TextField(
                  controller: inch,
                  decoration: InputDecoration(
                      label: Text('Enter Height (in inch)')
                  ),
                ),
                ElevatedButton(onPressed: (){
                  var w = weight.text.toString();
                  var f = feet.text.toString();
                  var i = inch.text.toString();
                  var msg ="";
                  if(w!="" && f !="" && i!= ""){
                    var w1 = int.parse(w);
                    var f1 = int.parse(f);
                    var i1 = int.parse(i);
                    i1 += f1*12;
                   double x = i1*0.0254;
                   var ans = w1/(x*x);
                   if(ans<18){
                     msg = "You are UnderWeight";
                     bgcolor = Colors.redAccent;
                   }
                   else if(ans>25){
                     msg = "You are OverWeight";
                     bgcolor = Colors.orange;
                   }
                   else{
                     msg = "You are Healthy";
                     bgcolor = Colors.greenAccent;
                   }

                  result = "$msg \n Your BMI = ${ans.toStringAsFixed(4)}";
                  }

                  else{
                    result = "Please Enter all the fields";
                  }
                  setState(() {

                  });
                },style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ), child: Text('Calculate',style: TextStyle(color: Colors.white,fontSize: 21),)
                ),
                Text(result),
              ],
            ),
          ),
        ),
      )
    );
  }

}