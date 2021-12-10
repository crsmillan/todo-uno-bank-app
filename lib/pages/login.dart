import 'package:bankapp/mobx/helper.dart';
import 'package:flutter/material.dart';

class SigIn extends StatelessWidget {
  const SigIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.60;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/imgs/l2.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              width: width,
              child: TextField(
                keyboardType: TextInputType.text,
                onChanged: (String? val) {
                  Store.global.setUser(val!);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'User',
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10.0)),
            SizedBox(
              width: width,
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.go,
                onChanged: (String? val) {
                  Store.global.setPassword(val!);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10.0)),
            SizedBox(
              width: width,
              height: 40.0,
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  if (Store.global.user == 'admin' && Store.global.password == 'admin123') {
                    Store.global.login();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
