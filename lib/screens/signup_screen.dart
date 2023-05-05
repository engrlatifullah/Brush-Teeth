import 'package:brush_teeth/screens/home_screen.dart';
import 'package:brush_teeth/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/flutter_toast.dart';
import '../widget/reusable_button.dart';
import '../widget/reusable_textFormField.dart';
import '../widget/text_style.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  bool isPass = true;
  bool isLoading = false;
  bool isConfirmPass = true;

  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final TextEditingController confirmPasswordC = TextEditingController();



  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    confirmPasswordC.dispose();
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
                    const FittedBox(
                      child: Text(
                        "Register your Account",
                        textAlign: TextAlign.center,
                        style: AppStyle.boldStyle,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Spacer(),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          ReusableTextFormField(
                            controller: emailC,
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
                            hintText: "Email",
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: const Icon(Icons.email_outlined),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ReusableTextFormField(
                            controller: passwordC,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "password should not be null";
                              } else {
                                return null;
                              }
                            },
                            hintText: "Password",
                            textInputAction: TextInputAction.next,
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
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ReusableTextFormField(
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "password should not be null";
                              } else if (v != passwordC.text) {
                                return "password not match";
                              } else {
                                return null;
                              }
                            },
                            isPass: isConfirmPass,
                            textInputAction: TextInputAction.done,
                            hintText: "Confirm Password",
                            suffixIcons: InkWell(
                                onTap: () {
                                  setState(() {
                                    isConfirmPass = !isConfirmPass;
                                  });
                                },
                                child: Icon(isConfirmPass
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ReusableButton(
                            title: 'Create an Account',
                            filled: true,
                            isLoading: isLoading,
                            onTap: () async{

                              if(formKey.currentState!.validate()){
                                setState(() {
                                  isLoading = true;
                                });
                                await AuthServices.createAccount(emailC.text, passwordC.text).then((value){
                                  if(value != null){
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Utils.successToast("Successfully Signup");
                                    Navigator.push(context, MaterialPageRoute(builder: (_){
                                      return const HomeScreen();
                                    },),);
                                  }
                                  else {
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                });


                              }
                            },

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
                        Navigator.pop(context);
                      },
                      title: 'Back to logIn',
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
