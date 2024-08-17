
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:login/homeScreen.dart';
import 'package:login/localStorage_service.dart';
import 'package:login/local_provider.dart';
import 'package:login/registerScreen.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LocalProvider>(
          create: (context) => LocalProvider()),],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Login Screen'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController userNameContrl = TextEditingController();
  TextEditingController passWordContrl = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void _incrementCounter() {}

  @override
  void initState() {
  
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<LocalProvider>().getquicQuestion();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Login Using user id and password",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(
                height: 10,
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
                       var value = await LocalStorageService().getItem("user_field");
                       if(value.isNotEmpty){
   if (value["user_Id"] == userNameContrl.text &&
                          value["password"] == passWordContrl.text) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ));
                      } else {
                        await AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'Error Message',
                          desc: userNameContrl.text != value["user_Id"] &&
                                  passWordContrl.text == value["password"]
                              ? "Incorrect User Name"
                              : userNameContrl.text == value["user_Id"] &&
                                      passWordContrl.text != value["password"]
                                  ? "Incorrect Password"
                                  : "Both the user Name and Password is in correct",
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {},
                        ).show();
                      }
                       }else{
                        await AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'Error Message',
                          desc: "User Details not there create account",
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {},
                        ).show();
                       }
                   
                    }
                  },
                  child: const Text("Log-In")),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("If You are new user",style: TextStyle(fontSize: 15),),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ));
                  },
                  child: Text("Sign Up",style: TextStyle(decoration: TextDecoration.underline,color: Colors.blue),))
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
