import 'package:flutter/material.dart';
void main()=> runApp(MyApp()); 
  
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hello You",
      home: Material(
        child: helloyou(),
      ),
    );
  }
}
class helloyou extends StatefulWidget {
  @override
  _helloyouState createState() => _helloyouState();
}

class _helloyouState extends State<helloyou> {
  @override
  String result='';
  final curs=['INR','USD','GBP'];
  String curency='dollar';
  TextEditingController distControl =new TextEditingController();
TextEditingController pricecontrol =new TextEditingController();
TextEditingController distancepercontrol =new TextEditingController();
final double formdist=5.0;

  Widget build(BuildContext context) {
    

    TextStyle style1 =Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Fuel Cost calculator"),)),
    body: Container(
      padding: EdgeInsets.all(20.0),
      child: Column( children: <Widget>[
        
      Text(result),

       Padding(
         padding: EdgeInsets.only(top: formdist, bottom: formdist),
         child: TextField(
        controller: distControl,
          decoration: InputDecoration(hintText: "Eg 1234",labelText: 'Distance',labelStyle: style1
          , border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          
          keyboardType: TextInputType.number,
          
         
        ), ),
Padding(
         padding: EdgeInsets.only(top: formdist, bottom: formdist),
         child:TextField(
         decoration: InputDecoration(hintText: "Eg 124",labelText: 'Distance per Unit',labelStyle: style1
          , border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          controller: distancepercontrol,
          keyboardType: TextInputType.number,
          )),
Padding(
         padding: EdgeInsets.only(top: formdist, bottom: formdist),
         child:
Row(children: <Widget>[

         Expanded(child: TextField(
          decoration: InputDecoration(hintText: "Eg 1.4",labelText: 'Price',labelStyle: style1
          , border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          controller: pricecontrol,
          keyboardType: TextInputType.number,
         )),
Container(width: 5*formdist,),
       Expanded(child: DropdownButton<String>(value: curency,
        items: curs.map((String val){
          return DropdownMenuItem<String>(
            value: val,
            child: Text(val),
          );
        }).toList(), 
        onChanged: (String val) {
          setState(() {
           curency=val;
          });
        },
     )),
],)),

Row(children: <Widget>[
Expanded(child:  RaisedButton(
  color: Theme.of(context).primaryColorDark,
  textColor: Theme.of(context).primaryColorLight,
  child: Text('Submit'),
  onPressed: (){
    setState(() {
     result=_calc(); 
    });
  }
)),
Expanded(child:  RaisedButton(
  color: Theme.of(context).primaryColorLight,
  textColor: Theme.of(context).primaryColorDark,
  child: Text('Reset'),
  onPressed: (){
    setState(() {
     _reset(); 
    });
  }
)),

],)


      
      ],),
    ),
    );
  }
String _calc(){
double dist=double.parse(distControl.text);
double price=double.parse(pricecontrol.text);
double dpu=double.parse(distancepercontrol.text);
double tc=dist*price/dpu;
String _result='Total Cost of your trip is '+tc.toStringAsFixed(2)+' '+curency;
return _result;
}
void _reset()
{
  distControl.text='';
  distancepercontrol.text='';
  pricecontrol.text='';
  setState(() {
     result='';
  });
 
}
}