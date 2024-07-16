import 'package:flutter/material.dart';

class PasswordValidate extends StatefulWidget {
  const PasswordValidate({super.key});

  @override
  State<PasswordValidate> createState() => _PasswordValidateState();
}

class _PasswordValidateState extends State<PasswordValidate> {
  bool _isVisible = false;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;
  bool _hasUpperCase = false;
  bool _hasLowerCase = false;

  onPasswordChanged(String password) {
    setState(() {
      final numeric = RegExp(r'[0-9]');
      final lowcase = RegExp(r'[a-z]');
      final uppercase = RegExp(r'[A-Z]');
      _isPasswordEightCharacters = false;
      _hasPasswordOneNumber = false;
      _hasUpperCase = false;
      _hasLowerCase = false;

      if (password.length >= 8) {
        _isPasswordEightCharacters = true;
      }
      if (numeric.hasMatch(password)) {
        _hasPasswordOneNumber = true;
      }
      if (uppercase.hasMatch(password)) {
        _hasUpperCase = true;
      }
      if (lowcase.hasMatch(password)) {
        _hasLowerCase = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Your Account',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Set a Password',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Please create a secure password including the following criteria below.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              onChanged: (password) => onPasswordChanged(password),
              obscureText: !_isVisible,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  icon: _isVisible
                      ? Icon(
                          Icons.visibility,
                          color: Colors.black,
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        ),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black)),
                hintText: 'Password',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            validation_checkList(
              text: 'Contains at least 8 characters',
              isValid: _isPasswordEightCharacters,
            ),
            SizedBox(
              height: 10,
            ),
            validation_checkList(
              text: 'Contains at least 1 number',
              isValid: _hasPasswordOneNumber,
            ),
            SizedBox(
              height: 10,
            ),
            validation_checkList(
              text: 'Contains at least 1 lowercase letter',
              isValid: _hasUpperCase,
            ),
            SizedBox(
              height: 10,
            ),
            validation_checkList(
              text: 'Contains at least 1 lowercase letter',
              isValid: _hasLowerCase,
            ),
            SizedBox(
              height: 50,
            ),
            MaterialButton(
              height: 40,
              minWidth: double.infinity,
              onPressed: () {},
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'CREATE ACCOUNT',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class validation_checkList extends StatelessWidget {
  const validation_checkList({
    super.key,
    required this.text,
    required this.isValid,
  });

  final bool isValid;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: isValid ? Colors.green : Colors.red,
            border: isValid
                ? Border.all(color: Colors.transparent)
                : Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Icon(
              isValid ? Icons.check : Icons.close,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(text),
      ],
    );
  }
}