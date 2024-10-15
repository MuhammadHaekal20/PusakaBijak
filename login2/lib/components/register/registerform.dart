import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login2/components/custom_surfix_icon.dart';
import 'package:login2/components/default_button_custome_color.dart';
import 'package:login2/screens/login/loginscreens.dart';
import 'package:login2/size_config.dart';
import 'package:login2/utils/constants.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});
  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final _formkey = GlobalKey<FormState>();
  String? namalengkap;
  String? username;
  String? email;
  String? password;
  bool _isObscure = true;

  TextEditingController txtNamaLengkap = TextEditingController(),
      txtUsername = TextEditingController(),
      txtEmail = TextEditingController(),
      txtPassword = TextEditingController();

  FocusNode focusNode = FocusNode();

  Future<void> registerUser() async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();

      var bytes = utf8.encode(txtPassword.text); // Konversi password ke bytes
      var digest = sha256.convert(bytes); // Hash password dengan SHA-256

      try {
        // Register user with Firebase Authentication
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: txtEmail.text,
          password: txtPassword.text,
        );

        User? user = userCredential.user;

        // Save user data to Firestore
        if (user != null) {
          // Save user data to Firestore
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set({
            'namalengkap': txtNamaLengkap.text,
            'username': txtUsername.text,
            'email': txtEmail.text,
            'password': digest.toString(), // Simpan password yang sudah di-hash
          });

          // Show success Snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registration Successful!'),
              backgroundColor: Colors.green,
            ),
          );

          // Navigate to login screen
          Navigator.pushNamed(context, LogInScreen.routeName);
        }
      } on FirebaseAuthException catch (e) {
        // Handle Firebase registration errors
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Registration Error"),
            content: Text("Error: ${e.message}"),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      } catch (e) {
        // Handle other errors
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Error"),
            content: Text("An unexpected error occurred: $e"),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          buildNamaLengkap(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildUserName(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmail(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPassword(),
          SizedBox(height: getProportionateScreenHeight(30)),
          GestureDetector(
            onTap: registerUser,
            child: const SizedBox(
              width: 150,
              height: 50, // Atur panjang sesuai kebutuhan Anda
              child: DefaultButtonCustomeColor(
                color: kPrimaryColor,
                text: 'Register',
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, LogInScreen.routeName);
            },
            child: const Text(
              "Sudah Punya Akun? Masuk Disini",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildNamaLengkap() {
    return TextFormField(
      controller: txtNamaLengkap,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: 'Nama Lengkap',
          hintText: 'Masukkan Nama Lengkap',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mTitleColor : kSecondaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const CustomSurffixIcon(
            svgIcon: "assets/icons/User.svg",
          )),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan Nama Lengkap Anda';
        }
        return null;
      },
    );
  }

  TextFormField buildUserName() {
    return TextFormField(
      controller: txtUsername,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: 'Username',
          hintText: 'Masukkan Username',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mTitleColor : kSecondaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const CustomSurffixIcon(
            svgIcon: "assets/icons/User.svg",
          )),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan username Anda';
        }
        return null;
      },
    );
  }

  TextFormField buildEmail() {
    return TextFormField(
      controller: txtEmail,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Masukkan Email',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mTitleColor : kSecondaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const CustomSurffixIcon(
            svgIcon: "assets/icons/Mail.svg",
          )),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan email Anda';
        }
        return null;
      },
    );
  }

  TextFormField buildPassword() {
    return TextFormField(
      controller: txtPassword,
      obscureText: _isObscure,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Masukkan Password',
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? mSubtitleColor : kSecondaryColor,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan Password Anda';
        }
        return null;
      },
    );
  }
}
