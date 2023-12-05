import 'package:chatapp/services/auth/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/mybutton.dart';
import '../components/textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailConroller = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  void signUp() async {
    if (passwordController.text != confirmpasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password is not matched try again!!"),
        ),
      );
      return;
    }
    try {
      final authService = Provider.of<AuthService>(context, listen: false);

      await authService.signUpUserWithCredentials(
        emailConroller.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  //logo
                  Icon(
                    Icons.message,
                    size: 80,
                    color: Colors.grey[800],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //welcome back msg
                  const Text(
                    "Welcome to Message App !",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  MyTextField(
                    controller: emailConroller,
                    hintText: "Email",
                    obsecureText: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //password textfiled
                  MyTextField(
                    controller: passwordController,
                    hintText: "Enter Password",
                    obsecureText: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    controller: confirmpasswordController,
                    hintText: "Confirm Password",
                    obsecureText: true,
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  //signin button
                  MyButton(onTap: signUp, text: "Sign Up"),
                  const SizedBox(
                    height: 25,
                  ),

                  //not a member ? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Alredy have an account register ?",
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Login Now",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
