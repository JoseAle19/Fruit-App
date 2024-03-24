import 'package:app/components/todo/ButtonLogin.dart';
import 'package:app/components/todo/LineWithText.dart';
import 'package:app/components/todo/SocialNetworks.dart';
import 'package:app/contants/Colors.dart';
import 'package:app/pages/Todo/initial_setup_screen.dart';
import 'package:app/themes/Colors.dart';
import 'package:flutter/material.dart';

class LoginTodo extends StatelessWidget {
  const LoginTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: primaryColorTodo,
                )),
          ),
          backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
          body: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      const InfoLogin(),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: const Text(
                          'Welcome back! Sign in using your social account or email to continue us',
                          style: TextStyle(
                            height: 2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  child: const Column(
                    children: [
                      SocialNetworks(),
                      SizedBox(height: 10),
                      LineWithText()
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: const Column(
                    children: [
                      InputCredentials(),
                      SizedBox(
                        height: 20,
                      ),
                      InputCredentials()
                    ],
                  ),
                ),
                Button(
                  title: 'Login',
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const InitialSetUpScreen()))
                  },
                ),
                // const Expanded(child:  BoxesDecorations())
              ],
            ),
          )),
    );
  }
}

class InfoLogin extends StatelessWidget {
  const InfoLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      child: Text(
        'Log in to HabitHUB',
        style: TextStyle(
            color: primaryColorTodo, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}

class BoxesDecorations extends StatelessWidget {
  const BoxesDecorations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.bottomCenter,
      width: double.infinity,
      // color: Colors.red,
      child: Stack(
        children: [
          Positioned(
              bottom: -100,
              left: -100,
              child: Container(
                decoration: BoxDecoration(
                    color: primaryColorTodo.withOpacity(.5),
                    borderRadius: BorderRadius.circular(300)),
                height: 300,
                width: 300,
              )),
          Positioned(
              top: 10,
              right: -100,
              child: Container(
                decoration: BoxDecoration(
                    color: taskFColorSecond.withOpacity(.3),
                    borderRadius: BorderRadius.circular(300)),
                height: 200,
                width: 200,
              ))
        ],
      ),
    );
  }
}

class InputCredentials extends StatelessWidget {
  const InputCredentials({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: TextFormField(
        decoration: const InputDecoration(labelText: 'Email'),
      ),
    );
  }
}
