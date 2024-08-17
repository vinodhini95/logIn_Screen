import 'package:flutter/material.dart';
import 'package:login/localStorage_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController firstNameContrl = TextEditingController();
  TextEditingController lastNameContrl = TextEditingController();
  TextEditingController userNameContrl = TextEditingController();
  TextEditingController passWordContrl = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Create an Account",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: firstNameContrl,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "First Name is required";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "First Name",
                    hintText: "First Name"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: lastNameContrl,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Last Name is required";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Last Name",
                    hintText: "Last Name"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: userNameContrl,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "User Name is required";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "User ID",
                    hintText: "User ID"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passWordContrl,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Password is required";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    hintText: "Password"),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      LocalStorageService().setValue("user_field", {
                        "first_name": firstNameContrl.text,
                        "last_name": lastNameContrl.text,
                        "user_Id": userNameContrl.text,
                        "password": passWordContrl.text
                      });

                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Submit")),
            ],
          ),
        ),
      ),
    );
  }
}
