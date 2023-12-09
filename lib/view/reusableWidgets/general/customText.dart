import '../../../../model/utilities/imports/generalImport.dart';

Widget customText(BuildContext context, {required String text}) {
  return Column(
    children: [
      S(
        h: 14,
        w: 401,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //  create linear gradient container left
            Container(
              width: sS(context).cW(width: 157),
              height: sS(context).cH(height: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.2194, 1],
                    colors: [
                      Color.fromRGBO(116, 116, 116, 0),
                      Color(0xFF747474),
                    ],
                  )),
            ),
            // date
            RalewayText(
              text,
              appBlack,
              1,
              11,
              FontWeight.w500,
              '',
              letterSpacing: 0.1,
            ),

            //  create linear gradient container right
            Container(
              width: sS(context).cW(width: 157),
              height: sS(context).cH(height: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0, 0.7806],
                  colors: [
                    Color(0xFF747474),
                    Color.fromRGBO(116, 116, 116, 0),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}
