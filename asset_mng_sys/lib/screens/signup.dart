import 'package:asset_mng_sys/model/user.dart';
import 'package:asset_mng_sys/services/userservice.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
   final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _roleController= TextEditingController();
   final _formKey = GlobalKey<FormState>();
   void saveUser() async {
    if (_nameController.text.isEmpty || _emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill the required fields")),
      );
      return;
    }

    UserService userService=UserService();
    bool _isLoading=false;

    setState(() => _isLoading = true);
    User newUser = User(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );

    try {
      await userService.addUser(newUser);

      _nameController.clear();
      _emailController.clear();
      _passwordController.clear();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Sign Up success")),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Sign Up Success")),

        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }
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
                    "Sign Up",
                    style: TextStyle(
                       fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: const Color.fromARGB(255, 31, 39, 189),
                    ),
                  ),
                  Text("Create Your Account Here")
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
                              controller: this._nameController,
                          validator: (value){
                                if(value==null || value.isEmpty){
                                  return "The field is required";
                                }

                                  return null;
                                
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
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
                                hintText: "User Name",
                              ),
                            ),
                            SizedBox(height: 20,),
                            TextFormField(
                               controller: this._emailController,
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
                            SizedBox(height: 20),
                            TextFormField(
                               controller: this._passwordController,
                               validator: (value){
                                if(value==null || value.isEmpty){
                                  return  "The field is required";
                                }if(value.length<6 || value.length>10){
                                  return "The max 10 character min 6 character";
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
                            SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: const Color.fromARGB(255, 28, 25, 180)
                              ),
                              onPressed: () {
                                if(_formKey.currentState!.validate()){
                                    saveUser();
                                     Navigator.pop(context);
                                }
                               
                              },
                              child: Text("Sign Up"),
                            ),
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