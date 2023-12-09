import 'package:baby_milestones_tracker/model/utilities/imports/generalImport.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseModel>.reactive(
        viewModelBuilder: () => BaseModel(),
        builder: (context, model, child) =>
            BaseUi(safeBottom: false, children: [
              TabHeading(title: "DashBoard", navigationPath: "navigationPath"),
              rowPositioned(
                top: 100,
                left: 10,
                right: 10,
                child: S(
                  h: 250,
                  w: sS(context).cW(width: 410),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            // height: sS(context).cH(height: 160.0),
                            enlargeCenterPage: true,
                            autoPlay: false,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            // autoPlayAnimationDuration:
                            //     const Duration(milliseconds: 800),
                            viewportFraction: sS(context).cH(height: 1),

                            onPageChanged: (index, reason) =>
                                model.updateCarouselPosition(context, index),
                          ),
                          items: model.carouselList.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          sS(context).cH(height: 10)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/png/dashboard/$i"),
                                          fit: BoxFit.fill)),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      Positioned(
                          right: sS(context).cW(width: 29),
                          top: sS(context).cH(height: 208),
                          child: Container(
                            decoration: BoxDecoration(
                                color: white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.all(Radius.circular(
                                    sS(context).cH(height: 20)))),
                            child: Padding(
                              padding:
                                  EdgeInsets.all(sS(context).cH(height: 8.0)),
                              child: AnimatedSmoothIndicator(
                                count: model.carouselList.length,
                                effect: WormEffect(
                                  dotHeight: sS(context).cH(height: 3),
                                  dotWidth: sS(context).cW(width: 6),
                                  dotColor: gray5,
                                  activeDotColor: pink,
                                ),
                                activeIndex: model.defaultIndex,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              pageTab(context, tabEnum: TabEnum.dashboard)
            ]));
  }
}
