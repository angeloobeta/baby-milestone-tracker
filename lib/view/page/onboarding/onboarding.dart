import 'package:baby_milestones_tracker/model/utilities/imports/generalImport.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnBoardingViewModel>.reactive(
        viewModelBuilder: () => OnBoardingViewModel(),
        disposeViewModel: false,
        builder: (context, model, child) =>
            BaseUi(allowBackButton: false, safeTop: false, children: [
              // image
              Visibility(
                  child: (model.Start == true)
                      ? rowPositioned(
                          top: 70,
                          child: S(
                            w: 360,
                            h: sS(context).h,
                            child: PageView.builder(
                                scrollDirection: Axis.horizontal,
                                // onPageChanged: model.updateIndex,
                                controller: model.pageController,
                                itemCount: model.onBoardSlide.length,
                                itemBuilder: (context, index) => Stack(
                                      children: [
                                        rowPositioned(
                                          top: 10,
                                          child: Expanded(
                                            child: FittedBox(
                                              child: SvgImage(
                                                path:
                                                    "onboarding/${model.onBoardSlide.elementAt(index).image}",
                                                height: 380,
                                                width: 300,
                                              ),
                                            ),
                                          ),
                                        ),
                                        S(h: 22),
                                        rowPositioned(
                                          top: 410,
                                          child: S(
                                            h: 38,
                                            w: 276,
                                            child: GeneralTextDisplay(
                                              model.onBoardSlide
                                                  .elementAt(index)
                                                  .title!,
                                              hexColor("010F07"),
                                              1,
                                              24,
                                              FontWeight.w700,
                                              "onboarding",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        S(h: 37),
                                        rowPositioned(
                                          top: 456 + 10,
                                          child: S(
                                            h: 52,
                                            w: 331,
                                            child: GeneralTextDisplay(
                                              model.onBoardSlide
                                                  .elementAt(index)
                                                  .subtitle!,
                                              hexColor("767676"),
                                              2,
                                              16,
                                              FontWeight.normal,
                                              "onboarding",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        S(h: 87),
                                        rowPositioned(
                                          top: 579,
                                          child: Center(
                                            child: SmoothPageIndicator(
                                                controller:
                                                    model.pageController,
                                                count:
                                                    model.onBoardSlide.length,
                                                effect: WormEffect(
                                                  dotHeight:
                                                      sS(context).cH(height: 8),
                                                  dotWidth:
                                                      sS(context).cW(width: 8),
                                                  dotColor: gray5,
                                                  activeDotColor: pink,
                                                )),
                                          ),
                                        ),
                                        rowPositioned(
                                            top: 684,
                                            child: (index <
                                                    model.onBoardSlide.length -
                                                        1)
                                                ? buttonNoPositioned(context,
                                                    width: 340,
                                                    height: 58,
                                                    text: "Continue",
                                                    navigator: () => model
                                                        .pageController
                                                        .nextPage(
                                                            duration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            curve: Curves
                                                                .easeInOut),
                                                    buttonColor: pink,
                                                    textColor: white)
                                                : (model.onBoardSlide.length - 1 ==
                                                        index)
                                                    ? buttonNoPositioned(context,
                                                        width: 340,
                                                        height: 58,
                                                        text: "Continue",
                                                        navigator: () {
                                                        router.goNamed(
                                                            dashboardPageRoute);
                                                      },
                                                        buttonColor:
                                                            hexColor("FF5733"),
                                                        textColor: white)
                                                    : S())
                                      ],
                                    )),
                          ),
                        )
                      : rowPositioned(
                          top: 50,
                          child: S(
                            h: 743,
                            w: 360,
                            child: Stack(
                              children: [
                                S(
                                    w: 359,
                                    h: 415,
                                    child: SvgPicture.asset(
                                      "assets/svg/onboarding/baby.svg",
                                    )),

                                rowPositioned(
                                  top: 415,
                                  child: S(
                                    h: 328,
                                    w: 359,
                                    child: Container(
                                      color: white,
                                      child: Stack(
                                        children: [
                                          rowPositioned(
                                            top: sS(context).cH(height: 61),
                                            child: GeneralTextDisplay(
                                              "Welcome",
                                              hexColor("010F07"),
                                              1,
                                              24,
                                              FontWeight.w700,
                                              "onboarding",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          rowPositioned(
                                            top: 117,
                                            child: GeneralTextDisplay(
                                              "Discover a world of culinary delights \nright at your fingertips.",
                                              hexColor("767676"),
                                              2,
                                              16,
                                              FontWeight.normal,
                                              "onboarding",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          button(context,
                                              width: 340,
                                              height: 58,
                                              buttonColor: pink,
                                              text: "Get started",
                                              navigator: () {
                                            model.onStartOnboarding(context);
                                          }, top: 255)
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                                // )
                              ],
                            ),
                          ),
                        ))
            ]));
  }
}
