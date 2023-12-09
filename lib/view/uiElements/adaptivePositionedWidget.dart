import '../../model/utilities/imports/generalImport.dart';

class AdaptivePositioned extends StatelessWidget {
  final double top;
  final double left;
  final double right;
  final Widget child;

  const AdaptivePositioned(this.child,
      {Key? key, this.left = 0, this.top = 0, this.right = 0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size dynamicSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Positioned(
        left: sS(context).cW(width: left),
        top: sS(context).cH(height: top),
        right: sS(context).cW(width: right),

        //  if the sizing is not correct, then i will add bottom to the adaptive widget to constraint the ui
        child: child);
  }
}
