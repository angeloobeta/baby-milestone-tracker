// this is a constant for all the colors used int application
// general color scheme
import '../imports/generalImport.dart';

const white = Colors.white;
const black = Colors.black;
const grey = Colors.grey;
const red = Colors.red;
const transparent = Colors.transparent;
const yellow = Colors.yellow;
const green = Color.fromRGBO(13, 167, 94, 1);

// app color

const Color appBlack = Color.fromRGBO(27, 29, 30, 1);
const Color secondary50 = Color.fromRGBO(247, 244, 249, 1);
const Color secondary900 = Color.fromRGBO(74, 63, 84, 1);
const Color primary500 = Color.fromRGBO(76, 0, 132, 1);
const Color primary400 = Color.fromRGBO(112, 51, 157, 1);
const Color primary50 = Color.fromRGBO(237, 230, 243, 1);

const Color gray500 = Color.fromRGBO(116, 116, 116, 1);

const Color successColor = Color.fromRGBO(75, 181, 67, 1);
const Color dangerColor = Color.fromRGBO(240, 68, 56, 1);
const Color warningColor = Color.fromRGBO(233, 213, 2, 0.2);
const Color dangeColorLower = Color.fromRGBO(255, 14, 14, 0.2);

const darkGreen = Color.fromRGBO(2, 137, 75, 1);
const lightGreen = Color.fromRGBO(235, 246, 238, 1);
const Color blue = Color.fromRGBO(79, 82, 166, 1);
const Color gray1 = Color.fromRGBO(51, 51, 51, 1);
const Color gray2 = Color.fromRGBO(130, 130, 130, 1);
const Color gray3 = Color.fromRGBO(128, 128, 128, 1);
const Color gray4 = Color.fromRGBO(189, 189, 189, 1);
const Color gray5 = Color.fromRGBO(224, 224, 224, 1);
const Color gray6 = Color.fromRGBO(242, 242, 242, 1);
const Color gray7 = Color.fromRGBO(145, 145, 145, 1);
const Color orange = Color.fromRGBO(241, 135, 57, 1);
const Color brown = Color.fromRGBO(183, 92, 26, 1);
const Color lightBrown = Color.fromRGBO(241, 135, 57, 0.15);
const Color paleBlue = Color.fromRGBO(235, 246, 238, 1);
const Color deepBlue = Color.fromRGBO(0, 57, 142, 1);
const Color lightBlue = Color.fromRGBO(0, 57, 142, 0.1);
const Color lightPink = Color.fromRGBO(252, 221, 236, 0.35);
const Color pink = Color.fromRGBO(239, 93, 168, 1);
const Color purple = Color.fromRGBO(125, 8, 144, 1);
const Color lightPurple = Color.fromRGBO(125, 8, 144, 0.1);
const Color shadow = Color.fromRGBO(0, 0, 0, 0.1);

// transaction map
Map<String, List> transactionStatus = {
  '1': ["Failed", red],
  "2": ["Successful", green],
  '3': ['Declined', black],
  "4": ["Queued", yellow]
};
