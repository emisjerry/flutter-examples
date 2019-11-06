import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: MyEditText(),
  ));
}

class MyEditText extends StatefulWidget {
  @override
  MyEditTextState createState() => MyEditTextState();
}

class MyEditTextState extends State<MyEditText> {
  String results = "";

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      print('input ${controller.text}');
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Using EditText"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text("輸入帳號："),
              Theme(
                data:
                    ThemeData(primaryColor: Colors.red, hintColor: Colors.blue),
                child: TextField(
                  maxLength: 20,
                  decoration: InputDecoration(
                    hintText: "Enter text here...",
                    //errorText: "Error!",
                    fillColor: Colors.lime,
                    filled: true,
                    prefixIcon: Icon(Icons.local_airport),
                    suffixText: "最大長度：20",
//                    border: InputBorder.none,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onSubmitted: (String str) {
                    setState(() {
                      results = results + "\n" + str;
                      controller.text = "";
                    });
                  },
                  controller: controller,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              Text("輸入密碼："),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter password...",
                  //fillColor: Colors.tealAccent,
                  //filled: true,
                  prefixIcon: Icon(Icons.place),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.yellowAccent),
                  ),
                ),
                keyboardType: TextInputType.text,
                controller: controller,
                obscureText: true,
              ),
              Text(results)
            ],
          ),
        ),
      ),
    );
  }
}
