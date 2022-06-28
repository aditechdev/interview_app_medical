import 'package:flutter/material.dart';
import 'package:interview_app_medical/features/auth/component/custom_form_field.dart';
import 'package:interview_app_medical/features/auth/component/solid_button.dart';
import 'package:interview_app_medical/features/auth/services/auth_service.dart';
import 'package:interview_app_medical/global_color.dart';

enum Auth { register, signIn }

class AuthScreen extends StatefulWidget {
  static const routeName = "/auth";
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.register;
  final _signUpGlobalKey = GlobalKey<FormState>();
  final _signInGlobalKey = GlobalKey<FormState>();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  AuthService authServices = AuthService();

  @override
  void dispose() {
    super.dispose();
    emailTextController.dispose();
    nameTextController.dispose();
    passwordTextController.dispose();
  }

  void signUpUser() {
    authServices.signUpWithEmailAndPassword(
        emailTextController.text.trim(),
        passwordTextController.text.trim(),
        nameTextController.text.trim(),
        context);
    
  }

  void signInUser() {
    authServices.signInWithEmailAndPassword(
      emailTextController.text.trim(),
      passwordTextController.text.trim(),
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Welcome To the MediBuddy",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ListTile(
                tileColor: (_auth == Auth.register)
                    ? GlobalColor.activeColor
                    : GlobalColor.inActiveColor,
                title: const Text(
                  "Register",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                    activeColor: Theme.of(context).backgroundColor,
                    value: Auth.register,
                    groupValue: _auth,
                    onChanged: (Auth? value) {
                      setState(() {
                        _auth = value!;
                      });
                    }),
              ),
              (_auth == Auth.register)
                  ? Container(
                      padding: const EdgeInsets.all(8),
                      color: GlobalColor.activeColor,
                      child: Form(
                        child: Column(
                          children: [
                            CustomFormTextField(
                              controller: nameTextController,
                              label: "Name",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomFormTextField(
                              controller: emailTextController,
                              label: "Email",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomFormTextField(
                              controller: passwordTextController,
                              label: "Password",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomButton(
                                buttonText: "Sign Up",
                                onTap: () {
                                  if (_signUpGlobalKey.currentState!
                                      .validate()) {
                                    signUpUser();
                                  }
                                })
                          ],
                        ),
                        key: _signUpGlobalKey,
                      ),
                    )
                  : Container(),
              ListTile(
                tileColor: (_auth == Auth.signIn)
                    ? GlobalColor.activeColor
                    : GlobalColor.inActiveColor,
                title: const Text(
                  "Sign-In.",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  activeColor: GlobalColor.radioButtonActiveColors,
                  value: Auth.signIn,
                  groupValue: _auth,
                  onChanged: (Auth? value) {
                    setState(
                      () {
                        _auth = value!;
                      },
                    );
                  },
                ),
              ),
              (_auth == Auth.signIn)
                  ? Container(
                      padding: const EdgeInsets.all(8),
                      color: GlobalColor.activeColor,
                      child: Form(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            CustomFormTextField(
                              controller: emailTextController,
                              label: "Email",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomFormTextField(
                              controller: passwordTextController,
                              label: "Password",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomButton(
                                buttonText: "Sign-In",
                                onTap: () {
                                  if (_signInGlobalKey.currentState!
                                      .validate()) {
                                    signInUser();
                                  }
                                })
                          ],
                        ),
                        key: _signInGlobalKey,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
