// constants of string
// screen sizing

import '../../utilities/imports/generalImport.dart';

// instantiate classes
ScreenSize sS(
  BuildContext context,
) =>
    ScreenSize(context: context);

// constant strings
const String tokenKey = 'token';
const String securityQuestionSet = 'securityQuestion';

String triggeredFromString() {
  if (kIsWeb) {
    return 'web';
  } else {
    return 'mobile';
  }
}

//
const String success = 'success';
const String failed = 'failed';
const String cardCharge = '5000';

// primary swatch color map
final Map<int, Color> primarySwatchColor = {
  50: green.withOpacity(0.1),
  100: green.withOpacity(0.2),
  200: green.withOpacity(0.3),
  300: green.withOpacity(0.4),
  400: green.withOpacity(0.5),
  500: green.withOpacity(0.6),
  600: green.withOpacity(0.7),
  700: green.withOpacity(0.8),
  800: green.withOpacity(0.9),
  900: green.withOpacity(1.0),
};

// constant sizes
const double hPadding = 16;
