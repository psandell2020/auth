import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:auth/screen/landing.dart';

class loginscr extends StatefulWidget {
  const loginscr({Key? key}) : super(key: key);

  @override
  _loginscrState createState() => _loginscrState();
}

class _loginscrState extends State<loginscr> {
  final myController_email = TextEditingController();
  final myController_pwd = TextEditingController();
  var textmsg = '';
  final FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential? userCredential;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController_email.dispose();
    myController_pwd.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    if (userCredential != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const landing()),
      );
    }
  }

  Future<UserCredential> logingf() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: "p_sandell@yahoo.com", password: "Psks!234");
    return userCredential;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 48.0,
              ),
              TextField(
                controller: myController_email,
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.amber,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: myController_pwd,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.amber,
                      style: BorderStyle.solid,
                    ),
                  ),
                  hintText: 'Enter your password',
                ),
                autofocus: false,
                obscureText: true,
              ),
              SizedBox(
                height: 8.0,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.red,
                    textStyle: const TextStyle(fontSize: 20)),
                onPressed: () async {
                  print(myController_email.text);
                  print(myController_pwd.text);

                  try {
                    print("i am here");
                    textmsg = 'Logging in';

                    userCredential = await auth.signInWithEmailAndPassword(
                        email: myController_email.text,
                        password: myController_pwd.text);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('No user found for that email.');
                      userCredential = null;
                      setState(() {
                        textmsg = 'No user found for this email';
                        print('set state ki ma');
                      });
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                      userCredential = null;
                      setState(() {
                        textmsg = 'Wrong password provided for this user';
                        print('set state ki bapp');
                      });
                    }
                  } catch (e) {
                    setState(() {
                      textmsg = 'Something is wrong! Try again';
                      print('set state ki wrong');
                    });
                  } finally {
                    if (userCredential != null) {
                      textmsg = '';
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const landing()),
                      );
                    } else {
                      // sign in unsuccessful
                      // ex: prompt the user to try again
/*
                       Navigator.pop(context); */
                    }
                  }
                  print("f me");

                  print("f d");
/*
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const landing()),
                    ); */

                  print("f you");

/*
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                        email: myController_email.text,
                        password: myController_pwd.text).catchError((err) => print(err)); */
                },
                child: Text('Submit'),
              ),
              SizedBox(
                height: 24.0,
              ),
              Text(
                textmsg.toString(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}

/*
TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
            child: TextField(
               decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Password Here',
                ),
                autofocus: false,
                obscureText: true,
                  )

                  try {
      user = await _auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } catch (e) {
      print(e.toString());
    } finally {
      if (user != null) {
        // sign in successful!
        // ex: bring the user to the home page
      } else {
        // sign in unsuccessful
        // ex: prompt the user to try again
      }


Text(
  'Hello, $_name! How are you?',
  textAlign: TextAlign.center,
  overflow: TextOverflow.ellipsis,
  style: const TextStyle(fontWeight: FontWeight.bold),
)
 */

// todo stream - copy and try with new one
// todo pretty - login button,
// todo clean up & modularise, routes
// todo integrate
// todo git
// todo release anddroid
// todo registration page
