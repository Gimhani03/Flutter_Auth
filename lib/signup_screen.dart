import 'package:flutter/material.dart';
import 'firebase_auth_service.dart'; // The service file for Firebase authentication

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void registerUser() async {
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Passwords do not match")));
      return;
    }

    String? result = await AuthService().signUpUser(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );

    if (result == "Success") {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("User Registered Successfully!")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(result ?? "Error occurred")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 70.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Your Account",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "First Name",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              SizedBox(height: 7),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                    //labelText: 'Full Name',
                    hintText: 'First Name',
                    hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 142, 141, 141),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(92, 194, 192, 192),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.all(12),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Last Name",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              SizedBox(height: 7),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                    //labelText: 'Full Name',
                    hintText: 'Last Name',
                    hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 142, 141, 141),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(92, 194, 192, 192),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.all(12),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              SizedBox(height: 7),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    //labelText: 'Email',
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 142, 141, 141),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(92, 194, 192, 192),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.all(12),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              SizedBox(height: 7),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    //labelText: 'Email',
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 142, 141, 141),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(92, 194, 192, 192),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.all(12),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Confirm Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              SizedBox(height: 7),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: confirmPasswordController,
                  obscureText: !_isConfirmPasswordVisible,
                  decoration: InputDecoration(
                    //labelText: 'Email',
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 142, 141, 141),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(92, 194, 192, 192),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.all(12),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible =
                              !_isConfirmPasswordVisible;
                        });
                      },
                      icon: Icon(
                        _isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: registerUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 202, 228, 250),
                    foregroundColor: const Color.fromARGB(255, 0, 29, 80),
                    padding: EdgeInsets.all(13.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  child: Text('Sign Up'),
                ),
              ),
              SizedBox(height: 5),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 0, 29, 80),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
