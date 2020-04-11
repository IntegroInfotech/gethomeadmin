import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gethomeadmin/screens/admin_screen.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  FirebaseAuth _auth = FirebaseAuth.instance;

  bool _firstRun = false;

  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    _auth.signOut();
    _firstRun = true;
    _emailController = TextEditingController(text: 'levin.d.d.souza@gmail.com');
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    initNavigator();
    super.didChangeDependencies();
  }

  initNavigator() async {
    if (_firstRun) {
      FirebaseUser user = await _auth.currentUser();
      if (user != null) {
        Navigator.of(context).pushReplacementNamed(AdminScreen.routeName);
      }
      _firstRun = false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Get Home Admin',
              style: Theme.of(context).textTheme.body1,
            ),
            TextFormField(
              enabled: false,
              controller: _emailController,
              style: Theme.of(context).textTheme.title,
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                hintStyle: Theme.of(context).textTheme.caption,
                labelStyle: Theme.of(context).textTheme.caption,
                hintText: 'Provide your email',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: _passwordController,
              style: Theme.of(context).textTheme.title,
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                hintStyle: Theme.of(context).textTheme.caption,
                labelStyle: Theme.of(context).textTheme.caption,
                hintText: 'Admin\'s password goes here',
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.done_outline,
          color: Colors.deepOrangeAccent,
        ),
        onPressed: () async {
          try {
            await _auth.signInWithEmailAndPassword(
              email: _emailController.text,
              password: _passwordController.text,
            );
            _emailController.clear();
            _passwordController.clear();
            Navigator.of(context).pushReplacementNamed(AdminScreen.routeName);
          } catch (exception) {
            _scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text(
                  'Your credentails are incorrect.',
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
