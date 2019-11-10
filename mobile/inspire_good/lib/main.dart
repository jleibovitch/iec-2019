import 'package:flutter/material.dart';
import 'package:inspire_good/data_bundle.dart';
import 'package:inspire_good/pages/pages.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DataBundle dataBundle = DataBundle();
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        final arguments = settings.arguments;
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => launchPage(context, dataBundle));
            break;
          case '/log_or_sign':
            return MaterialPageRoute(builder: (context) => logOrSign(context, arguments));
            break;          
          case '/log_in':
            return MaterialPageRoute(builder: (context) => logIn(context, arguments));
            break;
          case '/business_sign_up':
            return MaterialPageRoute(builder: (context) => businessSignUp(context, arguments));
            break;
          case '/supporter_sign_up':
            return MaterialPageRoute(builder: (context) => supporterSignUp(context, arguments));
            break;
          case '/view_all_jobs':
            return MaterialPageRoute(builder: (context) => viewAllJobs(context, arguments));
            break;
          default:
            return null;
        }
      },
    );
  }
}

void main() {
  runApp(App());
}
