import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login UI',
      theme: ThemeData(
          primaryColor: Colors.white, accentColor: Colors.blue),
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/signup': (context) => SignUp(),
      },
    );
  }
}

class Login extends StatefulWidget {

   static String id = 'loginSceen';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'MyApp',
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.red,
                fontWeight: FontWeight.bold),
            
          ),
          
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).primaryColor,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Padding(
                   padding: const EdgeInsets.only(top:50),
                   child: Image.asset(
                                        'images/GDSC.png',
                                        width: 600.0,
                                        height: 150.0,
                                        fit: BoxFit.cover,
                                      ),
                 ),
                const Text('Login',
                    style:TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
                const SizedBox(height: 60.0),
                loginPage(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginPage(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          
          children: [
            Container(
              
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                
               
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 2.0),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (!value!.contains('@') || value.isEmpty) {
                        return 'Email required!';
                      }
                      return null;
                    },
                   
                  ),
                  SizedBox(height: 25.0),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 2.0),
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password required!';
                      }
                      return null;
                    },
                   
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    width: MediaQuery.of(context).size.width * .7,
                    height: 50.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      color: Colors.blue,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _scaffoldKey.currentState!.showSnackBar(const SnackBar(
                            content: Text('Welcome'),
                          ));
                        }
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Forgot Password?',
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 17.0),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        children: <TextSpan>[
                          TextSpan(text: '\n'),
                          TextSpan(text: '\n'),
                          TextSpan(
                            text: 'Don\'t have an account?',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 17.0),
                          ),
                          TextSpan(
                              text: ' Sign Up',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 16.0,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, '/signup');
                                })
                        ],
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
