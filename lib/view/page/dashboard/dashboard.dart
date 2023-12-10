import 'package:baby_milestones_tracker/model/utilities/imports/generalImport.dart';
import 'package:baby_milestones_tracker/viewModel/dashboard/dashboard.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../mileStone/mileStoneDetail.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashBoardViewModel>.reactive(
        viewModelBuilder: () => DashBoardViewModel(),
        builder: (context, model, child) =>
            BaseUi(safeBottom: false, children: [
              const TabHeading(title: "DashBoard"),
              rowPositioned(
                  top: 105,
                  left: 10,
                  child: const GeneralTextDisplay(
                      "Hi Welcome to Baby Milestone Tracker",
                      pink,
                      1,
                      20,
                      FontWeight.w800,
                      'welcome')),
              Positioned(
                  top: sS(context).cH(height: 150),
                  left: 0,
                  right: 0,
                  bottom: sS(context).cH(height: 50),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: S(
                      h: 900,
                      w: 430,
                      child: Stack(
                        children: [
                          rowPositioned(
                            top: 150 - 150,
                            left: 10,
                            right: 10,
                            child: S(
                              h: 250,
                              w: 410,
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
                                        viewportFraction:
                                            sS(context).cH(height: 1),

                                        onPageChanged: (index, reason) =>
                                            model.updateCarouselPosition(
                                                context, index),
                                      ),
                                      items: model.carouselList.map((i) {
                                        return Builder(
                                          builder: (BuildContext context) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          sS(context)
                                                              .cH(height: 10)),
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(sS(context)
                                                    .cH(height: 20)))),
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                              sS(context).cH(height: 8.0)),
                                          child: AnimatedSmoothIndicator(
                                            count: model.carouselList.length,
                                            effect: WormEffect(
                                              dotHeight:
                                                  sS(context).cH(height: 3),
                                              dotWidth:
                                                  sS(context).cW(width: 6),
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
                          rowPositioned(
                            top: 460 - 150,
                            child: Container(
                              height: sS(context).cH(height: 390),
                              width: sS(context).cW(width: 410),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GridView.builder(
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing:
                                          sS(context).cH(height: 8.0),
                                      mainAxisSpacing:
                                          sS(context).cH(height: 8.0),
                                    ),
                                    itemCount:
                                        model.milestoneCategories.length - 3,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      String category = model
                                          .milestoneCategories.keys
                                          .elementAt(index);
                                      List<String> options =
                                          model.milestoneCategories[category]!;
                                      String backgroundImage =
                                          model.getRandomImage();

                                      return GestureDetector(
                                        onTap: () {
                                          // Add your onTap logic here
                                          print("Selected Category: $category");
                                          print("Options: $options");
                                          backButtonRedirectBucket =
                                              dashboardPageRoute;
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MileStoneDetailPage(
                                                        title: category,
                                                        milesOption: options,
                                                      )));
                                          // router.goNamed('');
                                        },
                                        child: Card(
                                          elevation: 2.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/png/dashboard/$backgroundImage"),
                                                colorFilter: ColorFilter.mode(
                                                  Colors.black.withOpacity(
                                                      0.15), // Adjust opacity as needed
                                                  BlendMode.dstATop,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Center(
                                                child: GeneralTextDisplay(
                                              category,
                                              black,
                                              3,
                                              16,
                                              FontWeight.w600,
                                              '',
                                              textAlign: TextAlign.center,
                                            )),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  S(
                                    h: 30,
                                    w: 100,
                                    child: GestureDetector(
                                      onTap: () {
                                        router.goNamed(mileStonePageRoute);
                                      },
                                      child: const GeneralTextDisplay(
                                          "See More",
                                          black,
                                          1,
                                          18,
                                          FontWeight.w600,
                                          ""),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          rowPositioned(
                              top: 420 - 150,
                              left: 10,
                              child: const GeneralTextDisplay(
                                  "Milestone Category",
                                  black,
                                  1,
                                  20,
                                  FontWeight.w700,
                                  'welcome'))
                        ],
                      ),
                    ),
                  )),
              pageTab(context, tabEnum: TabEnum.dashboard)
            ]));
  }
}
