import 'dart:async';
import 'dart:io';
import 'package:budget_recorder/widgets/dialogbox/custom_dialogbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirm_password_controller =
      new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late bool _passwordVisible = true;
  late File? _userImageFile = null;

  void _pickedImage(File image) {
    _userImageFile = image;
  }

  late bool _confirm_password_visible;
  void initState() {
    _passwordVisible = false;
    _confirm_password_visible = false;
  }

  void _signUpButtonPress(BuildContext ctx) {
    // print('Sign In BottonPress');
    // Navigator.of(ctx).pushReplacementNamed(
    //   '/login',
    //   arguments: {},
    // );
  }

  void _skipBottonPress(BuildContext ctx) {
    // print('Skip BottonPress');
    // Navigator.of(ctx).pushReplacementNamed(
    //   '/home',
    //   arguments: {},
    // );
  }

  // void _showErrorDialog(String message){
  //   _showErrorDialog(
  //     context:context,
  //     bilder:(ctx) => AlertDialog(
  //       title:Text("An Error occured"),
  //       content: Text(message),
  //       actions: <Widget>[
  //
  //       ],
  //     )
  //   )
  // }
  void showDialogBox(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
            title: "Error...!",
            descriptions: errormessage,
            text: "OK",
            route: '',
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                width: double.infinity,
                height: 700,
                decoration: const BoxDecoration(
                  color: Color(0xFF3F3F3F),
                ),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 35,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 40.0),
                      child: Text(
                        "BRIEFTASCHE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: 'Sen',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 40.0, top: 20, right: 20.0, bottom: 0.0),
                      child: Row(
                        children: const [
                          Text(
                            "Register",
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                    color: Colors.white, offset: Offset(0, -10))
                              ],
                              color: Colors.transparent,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              decorationThickness: 4,
                              decorationStyle: TextDecorationStyle.solid,
                              fontSize: 20,
                              fontFamily: 'Sen',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 0.0, right: 20.0, bottom: 0.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 5.0),
                              child: TextFormField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.person, color: Colors.white),
                                  hintText: 'Full Name',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  labelText: "Full Name",
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Usename cannot be empty';
                                  }
                                  return null;
                                },
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 5.0),
                              child: TextFormField(
                                controller: mobileController,
                                keyboardType: TextInputType.number,
                                inputFormatters: const <TextInputFormatter>[
                                  // ignore: deprecated_member_use
                                  // WhitelistingTextInputFormatter.digitsOnly,
                                ],
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.mobile_friendly,
                                      color: Colors.white),
                                  hintText: 'Mobile Number',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  labelText: "Mobile Number",
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Usename cannot be empty';
                                  }
                                  return null;
                                },
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 5.0),
                              child: TextFormField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.email, color: Colors.white),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  labelText: "Email",
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || !value.contains('@')) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 5.0),
                              child: TextFormField(
                                controller: passwordController,
                                keyboardType: TextInputType.text,
                                // controller: _userPasswordController,
                                obscureText:
                                    !_passwordVisible, //This will obscure text dynamically
                                decoration: InputDecoration(
                                  icon: const Icon(Icons.password,
                                      color: Colors.white),
                                  hintText: 'Password',
                                  hintStyle: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  labelText: "Password",
                                  labelStyle: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  border: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Password cannot be empty';
                                  } else if (value.length < 6) {
                                    return 'Password must be more than 6 characters';
                                  }
                                  return null;
                                },
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                //
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 5.0),
                              child: TextFormField(
                                controller: confirm_password_controller,
                                keyboardType: TextInputType.text,
                                // controller: _userPasswordController,
                                obscureText:
                                    !_confirm_password_visible, //This will obscure text dynamically
                                decoration: InputDecoration(
                                  icon: const Icon(Icons.password,
                                      color: Colors.white),
                                  hintText: 'Confirm Password',
                                  hintStyle: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  labelText: "Confirm Password",
                                  labelStyle: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _confirm_password_visible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        _confirm_password_visible =
                                            !_confirm_password_visible;
                                      });
                                    },
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  border: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Password cannot be empty';
                                  } else if (value.length < 6) {
                                    return 'Password must be more than 6 characters';
                                  }
                                  return null;
                                },
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                //
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -60.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Button(
                  //   onPressed: null,
                  //   child: Text('Button', style: TextStyle(
                  //       color: Colors.blue
                  //   )
                  //   ),
                  //   textColor: Colors.white,
                  //   shape: RoundedRectangleBorder(side: BorderSide(
                  //       color: Colors.blue,
                  //       width: 1,
                  //       style: BorderStyle.solid
                  //   ), borderRadius: BorderRadius.circular(50)),
                  // ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ElevatedButton(
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sen',
                        ),
                      ),
                      onPressed: () {
                        final String email = emailController.text.trim();
                        final String password = passwordController.text.trim();
                        final String confirmpassword =
                            confirm_password_controller.text.trim();
                        final String name = nameController.text.toString();
                        final String mobile = mobileController.text.trim();

                        // if (email.isEmpty) {
                        //   print("Email is Empty");
                        //   showDialogBox("Email is empty");
                        // } else {
                        //   if (password.isEmpty) {
                        //     print("Password is Empty");
                        //   } else {
                        //     context
                        //         .read<AuthService>()
                        //         .signUp(context, email, password, name, mobile)
                        //         .then((value) async {
                        //       User? user = FirebaseAuth.instance.currentUser;

                        //       final ref = FirebaseStorage.instance
                        //           .ref()
                        //           .child('user_image')
                        //           .child(user!.uid + '.jpg');

                        //       await ref.putFile(_userImageFile!);

                        //       final url = await ref.getDownloadURL();

                        //       await FirebaseFirestore.instance
                        //           .collection("users")
                        //           .doc(user!.uid)
                        //           .set({
                        //         'uid': user.uid,
                        //         'email': email,
                        //         'name': name,
                        //         'mobile': mobile,
                        //         'image_url': url,
                        //       });
                        //     });
                        //   }
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        primary: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child:
                        // Text Sign up
                        Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //sign up text
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () => _signUpButtonPress(context),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Sen',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Text(
                          "to Start Saving...",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Sen',
                          ),
                        ),
                      ],
                    ),
                    // RichText(
                    //   text: new TextSpan(
                    //     children: [
                    //       new TextSpan(
                    //         text: 'Already have an account? ',
                    //         style: new TextStyle(color: Colors.black),
                    //       ),
                    //       new TextSpan(
                    //         text: 'Log In',
                    //         style: new TextStyle(color: Colors.blue),
                    //         recognizer: new TapGestureRecognizer()
                    //           ..onTap = () {},
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = new Path();
    path.lineTo(0.0, size.height - 60);
    var ControlPoint = new Offset(size.width / 2.0, size.height);
    var EndPoint = new Offset(size.width, size.height - 60);
    path.quadraticBezierTo(
        ControlPoint.dx, ControlPoint.dy, EndPoint.dx, EndPoint.dy);
    path.lineTo(size.width, 0.0);
    path.close();

    // throw UnimplementedError();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    // throw UnimplementedError();
    return true;
  }
}
