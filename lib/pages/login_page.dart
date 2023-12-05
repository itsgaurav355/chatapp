import 'package:chatapp/components/mybutton.dart';
import 'package:chatapp/components/textfield.dart';
import 'package:chatapp/services/auth/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //creating controller
  final emailConroller = TextEditingController();
  final passwordController = TextEditingController();

//sign in method
  void signIn() async {
    //get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailPassword(
          emailConroller.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
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
                  height: 50,
                ),
                //welcome back msg
                const Text(
                  "Welcome Back Chief !",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                //email textfield
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
                  hintText: "Password",
                  obsecureText: true,
                ),
                const SizedBox(
                  height: 25,
                ),
                //signin button
                MyButton(onTap: signIn, text: "Sign In"),
                const SizedBox(
                  height: 25,
                ),
                //not a member ? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account register ?",
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Register Now",
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
    );
  }
}
