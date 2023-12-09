// this is a general back button for the pages


import '../../../model/utilities/imports/generalImport.dart';

Widget backButton(BuildContext context,
    {double top = 60,
    double left = 16,
    Color? color,
    Color? arrowColor,
    double? size,
    String? navigateTo,
    Function? navigator}) {
  return AdaptivePositioned(
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (navigator != null)
              ? () {
                  navigator();
                }
              : (navigateTo != null)
                  ? () {
                      context.goNamed(navigateTo);
                    }
                  : () {
                      Navigator.pop(context);
                    },
          child: const Icon(
           LineIcons.angleLeft,
            size: 24,
            color: appBlack,
          ),
          // Container(
          //   height: sS(context).cH(height: size ?? 40),
          //   width: sS(context).cW(width: size ?? 40),
          //   decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: color ?? blue.withOpacity(0.1)),
          //   child: GeneralIconDisplay(
          //       LineIcons.arrowLeft, arrowColor ?? blue, UniqueKey(), 20),
          // ),
        ),
      ],
    ),
    top: top,
    left: left,
  );
}

Widget backButtonNoPositioned(BuildContext context,
    {
    Color? color,
    Color? arrowColor,
    double? size,
    String? navigateTo,
    Function? navigator}) {
  return 
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (navigator != null)
              ? () {
                  navigator();
                }
              : (navigateTo != null)
                  ? () {
                      context.goNamed(navigateTo);
                    }
                  : () {
                      Navigator.pop(context);
                    },
          child: const Icon(
           LineIcons.angleLeft,
            size: 24,
            color: appBlack,
          ),
          // Container(
          //   height: sS(context).cH(height: size ?? 40),
          //   width: sS(context).cW(width: size ?? 40),
          //   decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: color ?? blue.withOpacity(0.1)),
          //   child: GeneralIconDisplay(
          //       LineIcons.arrowLeft, arrowColor ?? blue, UniqueKey(), 20),
          // ),
        ),
      ],
    );
}
