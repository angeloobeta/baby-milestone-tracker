// adding row to adaption Positioned widget

import '../../../model/utilities/imports/generalImport.dart';

Widget rowPositioned(
    {required double top, required Widget child, double? left, double? right}) {
  return AdaptivePositioned(
      Row(
        mainAxisAlignment: left == null && right != null
            ? MainAxisAlignment.end
            : left != null && right == null
                ? MainAxisAlignment.start
                : left == null && right == null
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
        children: [child],
      ),
      left: left ?? 0,
      right: right ?? 0,
      top: top);
}
