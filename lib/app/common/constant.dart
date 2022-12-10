// Theme of context global variable
// ThemeData textTheme = Theme.of(context).textTheme;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zanpakuto_ichigo/app/modules/auth/controllers/auth_controller.dart';

import '../../firebase_options.dart';

AuthController authController = AuthController.instance;

FirebaseAuth auth = FirebaseAuth.instance;

final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
