import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kj_flutter_app_2/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await initializeFirebaseOnce();
    runApp(MyApp());
  } catch (e) {
    print("Error initializing Firebase: $e");
  }
}

bool _initialized = false;

Future<void> initializeFirebaseOnce() async {
  if (!_initialized) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyAZa5Kl8QsyzxHJidVEgI18NEy0avIMMlA",
        databaseURL: "https://kj-web-app-new-1-default-rtdb.asia-southeast1.firebasedatabase.app",
        projectId: "kj-web-app-new-1",
        messagingSenderId: "728404599173",
        appId: "1:728404599173:web:4bbc64ef6612339a54a4ec",
        measurementId: "G-0SZHN15XXM",
      ),
    );
    print("Firebase initialized");
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Welcome!!!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AuthScreen()),
            );
          },
          child: Text('Click here to Proceed'),
        ),
      ),
    );
  }
}
