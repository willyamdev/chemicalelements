import 'package:chemicalelements/helpers/color_helper.dart';
import 'package:chemicalelements/view/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

void main() {
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('pt', 'BR')],
        path: 'assets/langs', // <-- change patch to your
        fallbackLocale: Locale('en', 'US'),
        child: MyApp()),
  );

  // runApp(MaterialApp(
  //   theme: ThemeData(
  //     primaryColor: ColorHelper.secondaryColor,
  //   ),
  //   debugShowCheckedModeBanner: false,
  //   home: Home(),
  //   builder: (context, child) {
  //     return ScrollConfiguration(
  //       behavior: MyBehavior(),
  //       child: child,
  //     );
  //   },
  // ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: Home());
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
