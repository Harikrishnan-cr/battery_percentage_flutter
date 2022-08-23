import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const batteryChannel = MethodChannel('battery');
  String batteryLevel = 'waiting..';

   
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  getBatteryLevel();
  }
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$batteryLevel%',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Color.fromARGB(255, 255, 1, 1))),
            const SizedBox(height: 25,),
            ElevatedButton(
              onPressed: getBatteryLevel,
              child: Text('Click',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.amber),),
            ),
          ],
        ),
      ),
    ));
  }

  Future getBatteryLevel() async {
    final int newBatteryLevel =
        await batteryChannel.invokeMethod("getBatteryLevel");
    setState(() {
      batteryLevel = '$newBatteryLevel';
    });
  }
}
