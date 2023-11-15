import 'package:eden_assessment/screens/signup_screen.dart';
import 'package:eden_assessment/utils/components/colors.dart';
import 'package:eden_assessment/utils/components/extensions.dart';
import 'package:eden_assessment/utils/widgets/asset_icon.dart';
import 'package:eden_assessment/utils/widgets/custom_button.dart';
import 'package:eden_assessment/utils/widgets/custom_sigin_button.dart';
import 'package:eden_assessment/utils/widgets/custom_textfield.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.width(.06), vertical: context.width(.15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(context.width(.02)),
              decoration: BoxDecoration(
                  color: AppColors.primary100,
                  borderRadius: BorderRadius.circular(20)),
              child: AssetIcon(
                icon: "wave",
                type: "png",
                size: context.width(.13),
              ),
            ),
            SizedBox(height: context.width(.08)),
            Text(
              "Sign In",
              style: TextStyle(
                  color: AppColors.primary600,
                  fontWeight: FontWeight.w600,
                  fontSize: context.width(.06)),
            ),
            SizedBox(height: context.width(.15)),
            CustomTextFormField(
              controller: emailController,
              hintText: "Email",
            ),
            SizedBox(height: context.width(.05)),
            CustomTextFormField(
              controller: passwordController,
              hintText: "Password",
              obscureText: obscure,
              suffix: IconButton(
                  onPressed: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                  icon: Icon(
                    !obscure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.grey800,
                    size: context.width(.06),
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: context.width(.07)),
              child: Row(
                children: [
                  const Expanded(
                    child: Divider(),
                  ),
                  Text(
                    "  Or  ",
                    style: TextStyle(
                        color: AppColors.grey900,
                        fontSize: context.width(.035)),
                  ),
                  const Expanded(
                    child: Divider(),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                CustomSignInButton(
                  onTap: () {},
                  title: "Google",
                ),
                SizedBox(
                  width: context.width(.03),
                ),
                CustomSignInButton(
                  onTap: () {},
                  title: "Github",
                  iconType: "png",
                )
              ],
            ),
            SizedBox(height: context.width(.15)),
            CustomContinueButton(
              onPressed: () async {
                // try {
                //   final credential = await FirebaseAuth.instance
                //       .signInWithEmailAndPassword(
                //           email: emailController.text.trim(),
                //           password: passwordController.text.trim());
                // } on FirebaseAuthException catch (e) {
                //   if (e.code == 'user-not-found') {
                //     print('No user found for that email.');
                //   } else if (e.code == 'wrong-password') {
                //     print('Wrong password provided for that user.');
                //   }
                // }
              },
              title: "Log In",
            ),
            SizedBox(height: context.width(.02)),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupScreen(),
                    ));
              },
              child: Text.rich(TextSpan(
                  text: "Don’t have account?",
                  style: TextStyle(
                      color: AppColors.grey800, fontSize: context.width(.04)),
                  children: [
                    TextSpan(
                        text: " Sign Up",
                        style: TextStyle(color: AppColors.primary500))
                  ])),
            )
          ],
        ),
      )),
    );
  }
}
