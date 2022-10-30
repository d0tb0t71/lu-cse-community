import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lu_cse_community/constant/constant.dart';
import 'package:lu_cse_community/provider/all_users_provider.dart';
import 'package:lu_cse_community/provider/authentication.dart';
import 'package:lu_cse_community/provider/chat_provider.dart';
import 'package:lu_cse_community/provider/contest_provider.dart';
import 'package:lu_cse_community/provider/notice_provider.dart';
import 'package:lu_cse_community/provider/notification_services.dart';
import 'package:lu_cse_community/provider/pdf_and_notification_provider.dart';
import 'package:lu_cse_community/provider/post_provider.dart';
import 'package:lu_cse_community/provider/profile_provider.dart';
import 'package:lu_cse_community/provider/search_provider.dart';
import 'package:lu_cse_community/provider/sign_up_provider.dart';
import 'package:lu_cse_community/view/bottom_nav_bar.dart';
import 'package:lu_cse_community/view/dashboard/AllUsers/all_users.dart';
import 'package:lu_cse_community/view/dashboard/Notices/notice.dart';
import 'package:lu_cse_community/view/dashboard/dashboard.dart';
import 'package:lu_cse_community/view/settings/edit_profile.dart';
import 'package:lu_cse_community/view/settings/favourite_post.dart';
import 'package:lu_cse_community/view/settings/privacy_policy.dart';
import 'package:lu_cse_community/view/settings/widgets/about_app/about_app.dart';
import 'package:lu_cse_community/view/settings/widgets/about_app/about_person.dart';
import 'package:lu_cse_community/view/sign_in_sign_up/onboarding.dart';
import 'package:lu_cse_community/view/sign_in_sign_up/reset_password.dart';
import 'package:lu_cse_community/view/sign_in_sign_up/sign_in.dart';
import 'package:lu_cse_community/view/sign_in_sign_up/sign_up.dart';
import 'package:lu_cse_community/view/sign_in_sign_up/terms_and_condition.dart';
import 'package:lu_cse_community/view/sign_in_sign_up/varification.dart';
import 'package:provider/provider.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
//import 'package:dcdg/dcdg.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  void initState() {
    super.initState();
    initOneSignalPlatform();
  }

  Future<void> initOneSignalPlatform() async {
    await OneSignal.shared.setAppId("d5efd16a-b9f5-4e92-a694-7212de8dae9e");
    await OneSignal.shared.getDeviceState().then((value) {
      print(
          "----------------------------One Signal Started----------------------------");
      print(value?.userId);
      print(
          "----------------------------One Signal Started----------------------------");
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_) => Authentication()),
        ChangeNotifierProvider(create: (_) => ContestProvider()),
        ChangeNotifierProvider(create: (_) => NotificationService()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => PostProvider()),
        ChangeNotifierProvider(create: (_) => AllUserProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => PDFAndNotificationProvider()),
        ChangeNotifierProvider(create: (_) => NoticeProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(414, 837),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'LU CSE Community',
          theme: ThemeData(
            textTheme: GoogleFonts.rubikTextTheme(
              Theme.of(context).textTheme,
            ),
            primarySwatch: Colors.teal,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: FutureBuilder(
            future: _initialization,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Exception(
                  massage: "Error",
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                return const MiddleOfHomeAndSignIn();
              }
              return const Exception(
                massage: "Loading",
              );
            },
          ),
          routes: {
            "SignIn": (ctx) => const SignIn(),
            "SignUp": (ctx) => const SignUp(),
            "OnBoarding": (ctx) => const OnBoarding(),
            "MiddleOfHomeAndSignIn": (ctx) => const MiddleOfHomeAndSignIn(),
            "ResetPassword": (ctx) => ResetPassword(),
            "AllUsers": (ctx) => const AllUsers(),
            "Dashboard": (ctx) => const Dashboard(),
            "EditProfile": (ctx) => const EditProfile(),
            "Notice": (ctx) => const Notice(),
            "PrivacyPolicy": (ctx) => const PrivacyPolicy(),
            "AboutApp": (ctx) => const AboutApp(),
            "FavouritePost": (ctx) => const FavouritePost(),
            "TermsAndCondition": (ctx) => const TermsAndCondition(),
          },
        ),
      ),
    );
  }
}

class Exception extends StatelessWidget {
  const Exception({Key? key, required this.massage}) : super(key: key);
  final String massage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: massage == "Error"
            ? const Text("An error occur")
            : const CircularProgressIndicator(),
      ),
    );
  }
}

class MiddleOfHomeAndSignIn extends StatefulWidget {
  const MiddleOfHomeAndSignIn({Key? key}) : super(key: key);

  @override
  _MiddleOfHomeAndSignInState createState() => _MiddleOfHomeAndSignInState();
}

class _MiddleOfHomeAndSignInState extends State<MiddleOfHomeAndSignIn> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream:
          Provider.of<Authentication>(context, listen: false).authStateChange,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: mainColor),
          );
        }
        if (snapshot.data != null && snapshot.data!.emailVerified) {
          return const CustomNavigationBar();
        }
        return snapshot.data == null
            ? const OnBoarding()
            : const VerificationAndHomeScreen();
      },
    );
  }
}
