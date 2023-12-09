import '../../../model/utilities/imports/generalImport.dart';

Widget customDialog(context, child,
    {Alignment? align,
    double? x,
    double? y,
    Color? color,
    double? borderRadius,
    double? padding,
    double? width,
    double? height}) {
  return Align(
    alignment: align ?? Alignment(x!, y!),
    // for y -1 to 1 (from top to bottom)
    // for x -1 to 1 (from left to right)
    child: S(
      h: height ?? 300,
      w: width ?? 300,
      child: Material(
        color: color ?? white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                sS(context).cH(height: borderRadius ?? 10))),
        child: Padding(padding: EdgeInsets.all(padding ?? 20.0), child: child),
      ),
    ),
  );
}

loadingNoScheduleDialog(BuildContext context,
    {required String text, Color? color, required Function? onWillPop}) async {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ViewModelBuilder<BaseModel>.reactive(
            viewModelBuilder: () => BaseModel(),
            onViewModelReady: (model) async {},
            disposeViewModel: false,
            builder: (context, model, child) => WillPopScope(
              onWillPop: () async {
                if (onWillPop == null) {
                  return true;
                } else {
                  return onWillPop();
                }
              },
              child: Center(
                child: customDialog(context, Center(child: loading()),
                    align: Alignment.center, height: 150, width: 150),
              ),
            ),
          ));
}

// loading dialog
loadingDialog(BuildContext context,
    {required String text,
    Color? color,
    Function? onWillPop,
    int? height,
    int? width}) async {
  return SchedulerBinding.instance.addPostFrameCallback(
    (_) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => ViewModelBuilder<BaseModel>.reactive(
              viewModelBuilder: () => BaseModel(),
              onViewModelReady: (model) async {},
              disposeViewModel: false,
              builder: (context, model, child) => WillPopScope(
                onWillPop: () async {
                  if (onWillPop == null) {
                    return true;
                  } else {
                    return onWillPop();
                  }
                },
                child: Center(
                  child: customDialog(context, Center(child: loading()),
                      align: Alignment.center,
                      height: 150,
                      width: 150,
                      color: color ?? Colors.white),
                ),
              ),
            )),
  );
}

// dialog with close
loaderWithClose(BuildContext context,
    {required String text,
    String? buttonText,
    IconData? icon,
    Function? onTap,
    Function? retry,
    String? title,
    Color? iconColor}) {
  return SchedulerBinding.instance.addPostFrameCallback(
    (_) => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Center(
        child: S(
          h: 245,
          w: 350,
          child: customDialog(
              context,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: sS(context).cH(height: 28),
                    backgroundColor: iconColor ?? red,
                    child: GeneralIconDisplay(
                        icon ?? Icons.close_rounded, white, UniqueKey(), 30),
                  ),
                  S(h: 16),
                  GeneralTextDisplay(
                    title == null ? "An error occured" : title,
                    black,
                    1,
                    20,
                    FontWeight.w500,
                    "",
                    textAlign: TextAlign.center,
                  ),
                  S(h: 8),
                  GeneralTextDisplay(
                    text,
                    gray3,
                    4,
                    14,
                    FontWeight.w500,
                    "",
                    textAlign: TextAlign.center,
                  ),
                  S(h: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (retry != null) const Spacer(),
                      // retry
                      if (retry != null)
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            retry();
                          },
                          child: GeneralTextDisplay(
                            buttonText ?? "Retry",
                            green.withOpacity(0.6),
                            1,
                            14.5,
                            FontWeight.w500,
                            "retry",
                          ),
                        ),
                      if (retry != null) const Spacer(),
                      // close

                      ButtonWidget(
                        () {
                          onTap == null
                              ? {
                                  Navigator.pop(context),
                                  if (retry != null) Navigator.pop(context)
                                }
                              : onTap();
                        },
                        gray6,
                        260,
                        48,
                        GeneralTextDisplay(
                            'Close', gray3, 1, 14, FontWeight.w500, 'Close'),
                        Alignment.center,
                        8,
                        noElevation: 0,
                        borderColor: white,
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     onTap == null
                      //         ? {
                      //             Navigator.pop(context),
                      //             if (retry != null) Navigator.pop(context)
                      //           }
                      //         : onTap();
                      //   },
                      //   child: GeneralTextDisplay(
                      //     buttonText ?? "close",
                      //     green.withOpacity(0.4),
                      //     3,
                      //     18,
                      //     FontWeight.w400,
                      //     "",
                      //   ),
                      // ),
                      if (retry != null) const Spacer(),
                    ],
                  )
                ],
              ),
              align: Alignment.center),
        ),
      ),
    ),
  );
}

// close dialog with no scheduler
loaderWithCloseNoScheduler(BuildContext context,
    {required String text,
    String? buttonText,
    IconData? icon,
    Function? onTap,
    Color? iconColor}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => Center(
      child: S(
        h: 220,
        w: 250,
        child: customDialog(
            context,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GeneralIconDisplay(
                    icon ?? Icons.error, iconColor ?? red, UniqueKey(), 50),
                S(h: 20),
                GeneralTextDisplay(
                  text,
                  green,
                  6,
                  14,
                  FontWeight.w500,
                  "",
                  textAlign: TextAlign.center,
                ),
                S(h: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        onTap == null ? Navigator.pop(context) : onTap();
                      },
                      child: GeneralTextDisplay(
                        buttonText ?? "close",
                        green.withOpacity(0.4),
                        3,
                        14,
                        FontWeight.w400,
                        "",
                      ),
                    ),
                  ],
                )
              ],
            ),
            align: Alignment.center),
      ),
    ),
  );
}

// loader with info
loaderWithInfo(BuildContext context,
    {required String text,
    required String title,
    IconData? icon,
    required Function onTap,
    Function? cancelTap,
    required String? cancelText,
    required String acceptText,
    Color? iconColor}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => Center(
      child: S(
        h: 320,
        w: 390,
        child: customDialog(
            context,
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                S(
                  h: 28,
                ),
                GeneralIconDisplay(icon ?? Icons.info_outline,
                    iconColor ?? darkGreen, UniqueKey(), 50),
                S(h: 28),
                GeneralTextDisplay(
                  title,
                  black,
                  1,
                  20,
                  FontWeight.w500,
                  title,
                  textAlign: TextAlign.center,
                ),
                S(h: 4),
                GeneralTextDisplay(
                  text,
                  gray3,
                  4,
                  14,
                  FontWeight.w400,
                  text,
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttonNoPositioned(context,
                        text: cancelText,
                        height: 48,
                        width: 130,
                        buttonColor: gray6,
                        textColor: gray2,
                        fontWeight: FontWeight.w500,
                        navigator: cancelTap ??
                            () {
                              Navigator.pop(context);
                            }),
                    S(w: 16),
                    buttonNoPositioned(context,
                        text: acceptText,
                        height: 48,
                        width: 130,
                        buttonColor: green,
                        textColor: white, navigator: () {
                      onTap();
                    }, fontWeight: FontWeight.w500),
                  ],
                )
              ],
            ),
            height: 390,
            width: 320,
            align: Alignment.center),
      ),
    ),
  );
}

// loading animation i was using before
// AnimatedContainer(
//                             width: sS(context).cW(width: (model.seconds * 50)),
//                             height: sS(context).cH(height: model.seconds * 50),
//                             child: SvgPicture.asset("assets/splash.svg",
//                                 semanticsLabel: 'Splash Screen'),
//                             duration: const Duration(seconds: 5))
