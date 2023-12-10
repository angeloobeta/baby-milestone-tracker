import '../../../model/utilities/imports/generalImport.dart';

Widget header(BuildContext context, String text,
    {double? top, Widget? widget, MainAxisAlignment? mainAxisAlignment}) {
  return rowPositioned(
      child: S(
        h: 30,
        w: 400,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    print("We just pop it now");
                  },
                  child: const Icon(
                    LineIcons.angleLeft,
                    size: 24,
                    color: appBlack,
                  ),
                ),
                S(w: 10),
                S(
                  w: 350,
                  h: 25,
                  child: RalewayText(
                    text,
                    appBlack,
                    1,
                    18,
                    FontWeight.w600,
                    '',
                    letterSpacing: 0.18,
                  ),
                ),
              ],
            ),
            if (widget != null) ...[widget]
          ],
        ),
      ),
      top: top ?? 60,
      left: 15);
}

Widget subHeading(BuildContext context, String text) {
  return rowPositioned(
      top: 110,
      left: 15,
      child:
          RalewayText(text, secondary900, 2, 16, FontWeight.w600, 'subtitle'));
}

// tab page heading
class TabHeading extends StatelessWidget {
  final String title;
  const TabHeading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return rowPositioned(
      child: S(
        w: 400,
        h: 36,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // menu
            GestureDetector(
                onTap: () {
                  // get the path to were the navigation came from
                  Scaffold.of(context).openDrawer();
                },
                child:
                    GeneralIconDisplay(Icons.menu, appBlack, UniqueKey(), 24)),
            // title
            RalewayText(title, appBlack, 1, 18, FontWeight.w600, 'title'),
            // notification
            GestureDetector(
              onTap: () {
                context.goNamed("notificationPageRoute");
              },
              child: SvgPicture.asset(
                'assets/svg/notification-bing.svg',
                width: sS(context).cW(width: 36),
                height: sS(context).cH(height: 36),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      top: 50,
    );
  }
}
