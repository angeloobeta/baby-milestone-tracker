

import '../../model/utilities/imports/generalImport.dart';

class ButtonWidget extends StatelessWidget {
  final dynamic onPressed;
  final dynamic color;
  final double width;
  final double height;
  final Widget child;
  final Alignment align;
  final double radius;
  final FocusNode? focusNode;
  final double? noElevation;
  final Color? borderColor;

  ButtonWidget(this.onPressed, this.color, this.width, this.height, this.child,
      this.align, this.radius,
      {this.focusNode, this.noElevation, this.borderColor});

  @override
  Widget build(BuildContext context) {
    Size dynamicSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return ElevatedButton(
        focusNode: focusNode ?? FocusNode(),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            elevation: noElevation ?? 4.0,
            alignment: align,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: borderColor ?? color),
              borderRadius:

                  BorderRadius.circular(sS(context).cH(height: radius)),
            ),
            fixedSize: Size(
                orientation == Orientation.portrait
                    ? sS(context).cW(width: width)
                    :sS(context).cW(width: width),
                orientation == Orientation.landscape
                    ? sS(context).cH(height: height)
                    : sS(context).cH(height: height))),

        child: child);
  }
}
