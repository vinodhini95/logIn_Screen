import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController lisValueContrl = TextEditingController();
  int selectedOption = -1;
  List<String> selectedValue = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quice App"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            " 1. Whats your Name",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50, top: 10, left: 10),
            child: TextFormField(
              controller: lisValueContrl,
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return "Password is required";
                }
                return null;
              },
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 0),
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  hintText: "Password"),
            ),
          ),
          const Text(
            " 1. Do you have reading habit",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

buildValues(
    BuildContext context, dynamic field, TextEditingController listContrl) {
  int selectedIndex = -1;
  if (field["field"] == "Input") {
    return Padding(
      padding: const EdgeInsets.only(right: 50, top: 10, left: 10),
      child: TextFormField(
        controller: listContrl,
        validator: (value) {
          if (value != null && value.isEmpty) {
            return "${listContrl.text} is required";
          }
          return null;
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 0),
            border: OutlineInputBorder(),
            labelText: listContrl.text,
            hintText: listContrl.text),
      ),
    );
  } else if (field["field"] == "radio") {
    return Row(children: [
      Flexible(
        child: Radio<String>(
          value: field["option"].toString(),
          groupValue: field["option"][selectedIndex],
          onChanged: (value) {},
        ),
      ),
    ]);
  } else {}
}
