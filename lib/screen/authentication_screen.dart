import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool _isLogin = true;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 90, 88, 79),
      appBar: AppBar(title: Text('Authenticate Yourself')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
              width: 200,
              child: Image.asset('assets/images/chat.png'),
            ),

            Card(
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: _emailTEController,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          validator: (value){
                            if(value == null || value.trim().isEmpty || !value.contains('@')){
                              return 'Please enter a valid email address.';
                            }
                            return null;
                          },
                        ),

                        TextFormField(
                          controller: _passwordTEController,
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          validator: (value){
                            if(value == null || value.trim().length < 6){
                              return 'Password must be at least 6 characters long.';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 12),

                        ElevatedButton(
                          onPressed: () {_submit();},
                          child: Text(_isLogin ? 'Login' : 'Sign Up'),
                        ),

                        SizedBox(height: 6),

                        TextButton(
                          onPressed: () {
                            setState(() {
                              
                            });
                            _isLogin = !_isLogin;
                          },
                          child: Text(
                            _isLogin
                                ? 'Create an account'
                                : 'I already have an account',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _submit(){
    if(_formKey.currentState!.validate()){
      final enteredEmail = _emailTEController.text.trim();
      final enteredPassword = _passwordTEController.text.trim();

    }
  }
}
