// this is the type of button used across the application



import '../../../model/utilities/imports/generalImport.dart';

// is to be used in stack widget
Widget button(context,
    {required String text,
    required double top,
    String? navigateTo,
    double? radius,
    Color? buttonColor,
    Color? textColor,
    Function? navigator,
    double? width,
    FontWeight? fontWeight,
    double? right,
    Widget? widget,
    double? height}) {
  return Stack(
    children: [
      rowPositioned(
        child: ButtonWidget(
            navigator ??
                () {
                  // know your customer page
                  Navigator.pushNamed(context, navigateTo ?? '');
                },
            buttonColor ?? green,
            width ?? 297,
            height ?? 52,
            widget ??
                RalewayText(text, textColor ?? white, 1, 16,
                    fontWeight ?? FontWeight.w700, text),
            Alignment.center,
            radius ?? 8),
        top: top,
      )
    ],
  );
}

// is to be used in column, rows and other grid element
Widget buttonNoPositioned(BuildContext context,
    { String? text='No text',
    String? navigateTo,
    double? radius,
    Color? buttonColor,
    Color? textColor,Color?  borderColor,
    Function? navigator,
    double? width,
    FontWeight? fontWeight,
    double? fontSize,
    Widget? widget,
    double? height}) {
  return ButtonWidget(
    navigator??
        () {
          // know your customer page
          if (navigateTo != null) {
            // set the back button route
            backButtonRedirectBucket=navigateTo;
            context.goNamed(navigateTo);
          }
        },
        
    buttonColor ?? primary400,
    width ?? 400,
    height ?? 47,
    widget ??
        RalewayText(text!, textColor ?? white, 1, fontSize??14,
            fontWeight ?? FontWeight.w400, text),
    Alignment.center,
    radius ?? 6,
    noElevation: 0,
    borderColor: borderColor,
    
  );
}
