

import '../../model/utilities/imports/generalImport.dart';

snackBarWidget(BuildContext context, {required String text,Color? color}) {
  SnackBar snackBar = SnackBar(
    content: GeneralTextDisplay(
      text,
      color??blue,
      3,
      10,
      FontWeight.w400,
      'snack bar text',
      textAlign: TextAlign.center,
    ),
    backgroundColor: white,
  );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
