import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:core';
import 'package:get/get.dart';
import 'package:barcode_scan/ui/auth/auth.dart';
import 'package:barcode_scan/ui/components/components.dart';
import 'package:barcode_scan/helpers/helpers.dart';
import 'package:barcode_scan/controllers/controllers.dart';

class SignInUI extends StatelessWidget {
  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //stack overlaps widgets
          Opacity(
            //semi red clippath with more height and with 0.5 opacity
            opacity: 0.5,
            child: ClipPath(
              clipper: WaveClipper(), //set our custom wave clipper
              child: Container(
                color: const Color.fromARGB(255, 200, 153, 208),
                height: 500,
              ),
            ),
          ),
          ClipPath(
            //upper clippath with less height
            clipper: WaveClipper(), //set our custom wave clipper.
            child: Container(
              padding: const EdgeInsets.only(bottom: 50),
              color: Colors.deepPurple,
              height: 460,
              alignment: Alignment.center,
            ),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      // LogoGraphicHeader(),
                      const SizedBox(height: 48.0),
                      FormInputFieldWithIcon(
                        controller: authController.emailController,
                        iconPrefix: Icons.email,
                        labelText: 'auth.emailFormField'.tr,
                        validator: Validator().email,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) => null,
                        onSaved: (value) =>
                            authController.emailController.text = value!,
                      ),
                      FormVerticalSpace(),
                      FormInputFieldWithIcon(
                        controller: authController.passwordController,
                        iconPrefix: Icons.lock,
                        labelText: 'auth.passwordFormField'.tr,
                        validator: Validator().password,
                        obscureText: true,
                        onChanged: (value) => null,
                        onSaved: (value) =>
                            authController.passwordController.text = value!,
                        maxLines: 1,
                      ),
                      FormVerticalSpace(),
                      PrimaryButton(
                          labelText: 'auth.signInButton'.tr,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              authController
                                  .signInWithEmailAndPassword(context);
                            }
                          }),
                      FormVerticalSpace(),
                      LabelButton(
                        labelText: 'auth.resetPasswordLabelButton'.tr,
                        onPressed: () => Get.to(ResetPasswordUI()),
                      ),
                      LabelButton(
                        labelText: 'auth.signUpLabelButton'.tr,
                        onPressed: () => Get.to(SignUpUI()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class WaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(
//       0,
//       size.height,
//     ); //start path with this if you are making at bottom
//     var firstStart = Offset(
//       size.width / 5,
//       size.height,
//     ); //fist point of quadratic bezier curve
//     var firstEnd = Offset(
//       size.width / 2.25,
//       size.height - 50.0,
//     ); //second point of quadratic bezier curve
//     path.quadraticBezierTo(
//       firstStart.dx,
//       firstStart.dy,
//       firstEnd.dx,
//       firstEnd.dy,
//     );
//     var secondStart = Offset(
//       size.width - (size.width / 3.24),
//       size.height - 105,
//     ); //third point of quadratic bezier curve
//     var secondEnd = Offset(
//       size.width,
//       size.height - 10,
//     ); //fourth point of quadratic bezier curve
//     path.quadraticBezierTo(
//       secondStart.dx,
//       secondStart.dy,
//       secondEnd.dx,
//       secondEnd.dy,
//     );

//     path.lineTo(
//       size.width,
//       0,
//     ); //end with this path if you are making wave at bottom
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false; //if new instance have different instance than old instance
//     //then you must return true;
//   }
// }
