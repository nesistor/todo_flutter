import 'package:firebase_auth/firebase_auth.dart';


void phoneAtuh() async {
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: '+44 7123 123 456',
    verificationCompleted: (PhoneAuthCredential credential) {},
    verificationFailed: (FirebaseAuthException e) {},
    codeSent: (String verificationId, int? resendToken) {},
    codeAutoRetrievalTimeout: (String verificationId) {},
  );

}