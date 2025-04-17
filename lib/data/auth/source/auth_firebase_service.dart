import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/auth/models/new_user_request.dart';
import 'package:ecommerce_app/data/auth/models/user_signin_request.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(NewUserRequest newuser);
  Future<Either> getAges();
  Future<Either> signIn(UserSignInRequest user);
  Future<Either> sendPasswordResetEmail(String email);
}

class AuthFirebaseServiceImplementation extends AuthFirebaseService {
  @override
  Future<Either> signUp(NewUserRequest newuser) async {
    try {
      var returnedData = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: newuser.email, password: newuser.password);

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(returnedData.user!.uid)
          .set({
        'name': newuser.name,
        'email': newuser.email,
        'gender': newuser.gender,
        'age': newuser.age,
        'address': newuser.address,
        'phonenumber': newuser.phonenumber,
        'image': returnedData.user!.photoURL,
        'userId': returnedData.user!.uid
      });

      return const Right('Sign up was successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance.collection('Ages').get();
      return Right(returnedData.docs);
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> signIn(UserSignInRequest user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      return const Right('SignIn successful');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'invalid-email') {
        message = 'No user found for this email';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for this user';
      }
      return Left(message);
    }
  }


  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right(
        'Password reset email is sent'
      );
    } catch (e){
      return const Left(
        'Please try again'
      );
    }
  }

  // @override
  // Future<bool> isLoggedIn() async {
  //   if (FirebaseAuth.instance.currentUser != null) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // @override
  // Future<Either> getUser() async {
  //   try {
  //   var currentUser = FirebaseAuth.instance.currentUser;
  //   var userData = await FirebaseFirestore.instance.collection('Users').doc(
  //     currentUser?.uid
  //   ).get().then((value) => value.data());
  //   return Right(
  //     userData
  //   );
  //   } catch(e) {
  //     return const Left(
  //       'Please try again'
  //     );
  //   }
  // }
}
