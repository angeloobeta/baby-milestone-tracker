import 'package:baby_milestones_tracker/model/utilities/constants/localisation.dart';
import 'package:baby_milestones_tracker/model/utilities/imports/generalImport.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnBoardingViewModel>.reactive(
        viewModelBuilder: () => OnBoardingViewModel(),
        disposeViewModel: false,
        builder: (context, model, child) =>
            BaseUi(allowBackButton: false, safeTop: true, children: [
              // image
              Visibility(
                  child: (model.startOnboarding == true)
                      ? rowPositioned(
                          top: 70,
                          child: S(
                            w: 410,
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
                                          // left: 10,
                                          // right: 10,
                                          child: Container(
                                              height:
                                                  sS(context).cH(height: 360),
                                              width: sS(context).cW(width: 350),
                                              child: SvgPicture.asset(
                                                  "assets/svg/onboarding/${model.onBoardSlide.elementAt(index).image}.svg")

                                              // SvgImage(
                                              //   path:
                                              //       "onboarding/${model.onBoardSlide.elementAt(index).image}",
                                              //   height: 360,
                                              //   width: 250,
                                              // ),
                                              ),
                                        ),
                                        S(h: 22),
                                        rowPositioned(
                                          top: 410,
                                          child: S(
                                            h: 150,
                                            w: 300,
                                            child: GeneralTextDisplay(
                                              model.onBoardSlide
                                                  .elementAt(index)
                                                  .title!,
                                              hexColor("010F07"),
                                              2,
                                              24,
                                              FontWeight.w700,
                                              "onboarding",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        rowPositioned(
                                          top: 456 + 50,
                                          child: S(
                                            h: 120,
                                            w: 330,
                                            child: GeneralTextDisplay(
                                              model.onBoardSlide
                                                  .elementAt(index)
                                                  .subtitle!,
                                              hexColor("767676"),
                                              6,
                                              16,
                                              FontWeight.normal,
                                              "onboarding",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        S(h: 87),
                                        rowPositioned(
                                          top: 579 + 30,
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
                                                    fontSize: 16,
                                                    text: "Next",
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
                                                : (model.onBoardSlide.length -
                                                            1 ==
                                                        index)
                                                    ? buttonNoPositioned(context,
                                                        width: 340,
                                                        height: 58,
                                                        text: "Done",
                                                        fontSize: 16,
                                                        navigator: () {
                                                        router.goNamed(
                                                            dashboardPageRoute);
                                                      },
                                                        buttonColor: pink,
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
                            w: 410,
                            child: Stack(
                              children: [
                                S(
                                    w: 400,
                                    h: 415,
                                    child: SvgPicture.asset(
                                      "assets/svg/onboarding/baby.svg",
                                    )),

                                rowPositioned(
                                  top: 415,
                                  child: S(
                                    h: 328,
                                    w: 400,
                                    child: Container(
                                      color: white,
                                      child: Stack(
                                        children: [
                                          rowPositioned(
                                            top: sS(context).cH(height: 61),
                                            child: S(
                                              w: 390,
                                              h: 100,
                                              child: GeneralTextDisplay(
                                                locale(context).welcomeMessage,
                                                hexColor("010F07"),
                                                2,
                                                24,
                                                FontWeight.w700,
                                                "onboarding",
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          rowPositioned(
                                            top: 140,
                                            child: S(
                                              h: 120,
                                              w: 320,
                                              child: GeneralTextDisplay(
                                                locale(context).generalMessage,
                                                hexColor("767676"),
                                                5,
                                                16,
                                                FontWeight.normal,
                                                "onboarding",
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          button(context,
                                              width: 340,
                                              height: 58,
                                              buttonColor: pink,
                                              text: locale(context).getStarted,
                                              navigator: () {
                                            model.onStartOnboarding(context);
                                          }, top: 265)
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
