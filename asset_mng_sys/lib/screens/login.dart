import 'package:asset_mng_sys/model/loginmodel.dart';
import 'package:asset_mng_sys/screens/home.dart';
import 'package:asset_mng_sys/screens/signup.dart';
import 'package:asset_mng_sys/services/loginservice.dart';
import 'package:flutter/material.dart';

//  const Color.fromARGB(255, 31, 39, 189)
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _login();
}

 class _login extends State<login> {
  late LoginModel data;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

bool _isLoading = false;
Loginservice service=Loginservice();
void _handleLogin(BuildContext context) async {
  String email=this._emailController.text;

  setState(() {
    _isLoading = true; 
  });

  LoginModel log = LoginModel(
    email: _emailController.text,
    password: _passwordController.text, 
  );

  bool isSuccess = await service.validateUser(log);

  setState(() {
    _isLoading = false;
  });

  if (isSuccess) {
    print(isSuccess);
    print(email);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home(mail: email,),));
  } else {
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Login Failed"),
          content: Text("Invalid Username or Password."),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); 
              },
            ),
          ],
        );
      },
    );
  }}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: const Color.fromARGB(255, 31, 39, 189),
                    ),
                  ),
                  Text("Asset Management System")
                ],
              ),
              Column(
                children: [
                  Card(
                    margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              validator: (value){
                                if(value==null || value.isEmpty){
                                  return "The field is required";
                                }

                                  return null;
                                
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.mail),
                                prefixIconColor:  Color.fromARGB(
                                  255,
                                  31,
                                  39,
                                  189,
                                ),
                                fillColor: const Color.fromARGB(
                                  255,
                                  31,
                                  39,
                                  189,
                                ),
                                border: OutlineInputBorder(
                                
                                  borderRadius: BorderRadius.circular(19),
                                  borderSide: BorderSide(color: Colors.blue),
                                  
                                ),
                                hintText: "Email",
                              ),
                            ),
                            SizedBox(height: 30),
                            TextFormField(
                              controller: _passwordController,
                              validator: (value){
                                if(value==null || value.isEmpty){
                                  return  "The field is required";
                                }if(value.length<6 || value.length>15){
                                  return "The max 15 character min 6 character";
                                }
                                return null;
                                
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.password),
                                prefixIconColor:  Color.fromARGB(
                                  255,
                                  31,
                                  39,
                                  189,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(19),
                                ),
                                hintText: "Password",
                              ),
                            ),
                            SizedBox(height: 30),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: const Color.fromARGB(255, 28, 25, 180)
                              ),
                              onPressed: () {
                                if(_formKey.currentState!.validate()){
                                 _handleLogin(context);
                                }
                              },
                              child: Text("Login"),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text("Don't have an account?"),
                                TextButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder:(context) => Signup(),));
                                }, child: Text("signup"))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  
 
}