import 'package:eden_assessment/providers/auth_provider.dart';
import 'package:eden_assessment/screens/home_screen.dart';
import 'package:eden_assessment/screens/login_screen.dart';
import 'package:eden_assessment/utils/components/colors.dart';
import 'package:eden_assessment/utils/components/extensions.dart';
import 'package:eden_assessment/utils/widgets/asset_icon.dart';
import 'package:eden_assessment/utils/widgets/custom_button.dart';
import 'package:eden_assessment/utils/widgets/custom_sigin_button.dart';
import 'package:eden_assessment/utils/widgets/custom_textfield.dart';
import 'package:eden_assessment/utils/widgets/snackbar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.width(.06), vertical: context.width(.15)),
          child: Consumer(builder: (context, ref, child) {
            final data = ref.watch(authProvider);
            final reader = ref.read(authProvider.notifier);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(context.width(.02)),
                  decoration: BoxDecoration(
                      color: AppColors.primary100,
                      borderRadius: BorderRadius.circular(20)),
                  child: AssetIcon(
                    icon: "claps",
                    type: "png",
                    size: context.width(.13),
                  ),
                ),
                SizedBox(height: context.width(.08)),
                Text(
                  "Sign Up",
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
                      onTap: () {
                        reader.signInWithGoogle(
                          onSuccess: (p0) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(p0),
                                ));
                          },
                          onError: (p0) => CustomSnackbar.showErrorSnackBar(
                              context,
                              message: p0),
                        );
                      },
                      title: "Google",
                    ),
                    SizedBox(
                      width: context.width(.03),
                    ),
                    CustomSignInButton(
                      onTap: () {
                        reader.signInWithGithub(
                          onSuccess: (p0) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(p0),
                                ));
                          },
                          onError: (p0) => CustomSnackbar.showErrorSnackBar(
                              context,
                              message: p0),
                        );
                      },
                      title: "Github",
                      iconType: "png",
                    )
                  ],
                ),
                SizedBox(height: context.width(.15)),
                CustomContinueButton(
                  onPressed: () {
                    reader.signInWithEmail(
                      emailController.text.trim(),
                      emailController.text.trim(),
                      onSuccess: (p0) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(p0),
                            ));
                      },
                      onError: (p0) => CustomSnackbar.showErrorSnackBar(context,
                          message: p0),
                    );
                  },
                  title: "Create Account",
                  isActive: data != StateEnum.loading,
                ),
                SizedBox(height: context.width(.02)),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                  },
                  child: Text.rich(TextSpan(
                      text: "Already have an account?",
                      style: TextStyle(
                          color: AppColors.grey800,
                          fontSize: context.width(.04)),
                      children: const [
                        TextSpan(
                            text: " Sign In",
                            style: TextStyle(color: AppColors.primary500))
                      ])),
                )
              ],
            );
          }),
        ),
      )),
    );
  }
}
