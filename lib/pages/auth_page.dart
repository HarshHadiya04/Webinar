import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'login_or_register_page.dart';

class AuthPage extends StatelessWidget {
    const AuthPage({super.key});
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                    if(snapshot.hasData){
                        return HomePage(); // Replace with your home page widget
                    }
                    else{
                        return LoginOrRegisterPage(); // Replace with your login page widget
                    }

                },
            )
        );
    }
}