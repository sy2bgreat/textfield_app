import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textEditingController = TextEditingController();
  late String inputValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text("single text field"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Column(
                children: [
                  TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(labelText: "글자를 입력하시오"),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (textEditingController.text == '' ||
                            textEditingController.text.isEmpty) {
                          errorSnackBar(context);
                        } else {
                          inputValue = textEditingController.text;
                          showSnackBar(context, inputValue);
                        }
                      },
                      child: const Text("출력")) //화면에 그려주는 애..
                ],
              ),
            ),
          )),
    );
  }

  void errorSnackBar(BuildContext conetext) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("type it "),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }

  void showSnackBar(BuildContext conetext, String inputValue) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("u typed '$inputValue' "),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ));
  }
}
