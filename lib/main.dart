import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercrudapi/user_model.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


Future<UserModel> createUser(String name, String age, String color) async{

 var response = await http.post(Uri.https('crudcrud.com', 'api/2a52dee293ed4ffcbf5f6b351265a009/abc'),body:{
      "name":name,
      "age":age,
      "colour":color
  });
var data = response.body;
print(data);
final String responseString = response.body;
userModelFromJson(responseString);



}

class _MyHomePageState extends State<MyHomePage> {
  
    UserModel _user;
    final TextEditingController nameController = TextEditingController();
    final TextEditingController ageController = TextEditingController();
    final TextEditingController colorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [

            TextField(
              controller: nameController,
            ),

            TextField(
              controller: ageController,
            ),

            TextField(
              controller: colorController,
            ),
            SizedBox(height: 32,),
            
           //  _user == null ? Container() :
           // //     Text("The user${_user.name}, ${_user.id} is created successfully at time ${_user.createdAt.toIso8601String()}")
           //  Text("The user ${_user.name} is created successfully "),

            ElevatedButton(onPressed: () async{

              String name = nameController.text;
              String age = ageController.text;
              String color = colorController.text;
              UserModel user = await createUser(name, age, color);
              setState(() {
                _user = user;
              });
            }, child: Text("Post"))
          ],
        ),
      ),
    );
  }
}
