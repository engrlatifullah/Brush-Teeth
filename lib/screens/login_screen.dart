import 'package:brush_teeth/colors.dart';
import 'package:brush_teeth/screens/bottom_nav_bar.dart';
import 'package:brush_teeth/screens/signup_screen.dart';
import 'package:brush_teeth/services/auth_services.dart';
import 'package:flutter/material.dart';

import '../utils/flutter_toast.dart';
import '../widget/reusable_button.dart';
import '../widget/reusable_textFormField.dart';
import '../widget/text_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isPass = true;
  bool isLoading = false;

  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();


  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const Text(
                      "Log In",
                      textAlign: TextAlign.center,
                      style: AppStyle.boldStyle,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 120,
                        width: 120,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: lightGreyColor),
                        child: const Icon(
                          Icons.person,
                          size: 100,
                          color: blueColor,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Spacer(),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          ReusableTextFormField(
                            hintText: "Email",
                            controller: emailC,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: const Icon(Icons.email_outlined),
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "badly formatted email";
                              } else if (!v!.contains("@") ||
                                  !v!.contains(".com")) {
                                return "badly formatted email";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ReusableTextFormField(
                            controller: passwordC,
                            hintText: "Password",
                            textInputAction: TextInputAction.done,
                            isPass: isPass,
                            suffixIcons: InkWell(
                                onTap: () {
                                  setState(() {
                                    isPass = !isPass;
                                  });
                                },
                                child: Icon(isPass
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: const Icon(Icons.password),
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "password should not be null";
                              } else {
                                return null;
                              }
                            },
                          ),

                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text("Forgot Password?",
                                style: TextStyle(color: blueColor),),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ReusableButton(
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                await AuthServices.loginUser(
                                    emailC.text, passwordC.text).then((value){
                                      if(value != null){
                                        setState(() {
                                          isLoading = false;
                                        });
                                        Utils.successToast("Login Successfully");
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (BuildContext context) {
                                                  return const BottomNavBar();
                                                }));
                                      }
                                      else{
                                        setState(() {
                                          isLoading = false;
                                        });
                                      }
                                });
                              }

                            },
                            title: 'LogIn',
                            filled: true,
                            isLoading: isLoading,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(
                      height: 10,
                    ),
                    ReusableButton(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return const SignUpScreen();
                            }));
                      },
                      title: 'Create an Account',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
