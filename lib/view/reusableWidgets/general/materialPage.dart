// material page function


import '../../../model/utilities/imports/generalImport.dart';

materialPage(settings, page) {
  return PageTransition(
      type: PageTransitionType.fade,
      settings: settings,
      child: page,
      duration: const Duration(milliseconds: 100));
}
