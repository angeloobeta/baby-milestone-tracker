import 'package:baby_milestones_tracker/model/utilities/constants/localisation.dart';
import 'package:baby_milestones_tracker/model/utilities/imports/generalImport.dart';
import 'package:carousel_slider/carousel_controller.dart';

class DashBoardViewModel extends BaseModel with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    WidgetsBinding.instance.addObserver(this);
    print(state);
  }

  bool seeMore = false;
  PageController pageController = PageController();
  int defaultIndex = 0;

  updateCarouselPosition(context, index) {
    defaultIndex = index;
    notifyListeners();
  }

  CarouselController carouselController = CarouselController();
  triggerSeeMoreFood(context) {
    seeMore = !seeMore;
    notifyListeners();
  }

  List<String> carouselList = [
    'slider1.png',
    'slider2.png',
    'slider3.png',
    'slider4.png',
  ];

  Map<String, List<String>> milestoneCategories(context) => {
        locale(context).milestoneCategory1: [
          locale(context).physicalDevelopment1,
          locale(context).physicalDevelopment2,
          locale(context).physicalDevelopment3,
          locale(context).physicalDevelopment4,
          locale(context).physicalDevelopment5,
        ],
        locale(context).milestoneCategory2: [
          locale(context).cognitiveDevelopment1,
          locale(context).cognitiveDevelopment2,
          locale(context).cognitiveDevelopment3,
          locale(context).cognitiveDevelopment4,
          locale(context).cognitiveDevelopment5,
        ],
        locale(context).milestoneCategory3: [
          locale(context).socialAndEmotionalDevelopment1,
          locale(context).socialAndEmotionalDevelopment2,
          locale(context).socialAndEmotionalDevelopment3,
          locale(context).socialAndEmotionalDevelopment4
        ],
        locale(context).milestoneCategory4: [
          locale(context).feedingAndNutrition1,
          locale(context).feedingAndNutrition2,
          locale(context).feedingAndNutrition3,
          locale(context).feedingAndNutrition4,
          locale(context).feedingAndNutrition5,
        ],
        locale(context).milestoneCategory5: [
          locale(context).sleepingPattern1,
          locale(context).sleepingPattern2,
          locale(context).sleepingPattern3,
          locale(context).sleepingPattern4,
        ],
        locale(context).milestoneCategory6: [
          locale(context).healthAndWellness1,
          locale(context).healthAndWellness2,
          locale(context).healthAndWellness3,
          locale(context).healthAndWellness4,
          locale(context).healthAndWellness5,
        ],
        locale(context).milestoneCategory7: [
          locale(context).speechAndLanguage1,
          locale(context).speechAndLanguage2,
          locale(context).speechAndLanguage3,
          locale(context).speechAndLanguage4,
          locale(context).speechAndLanguage5,
        ],
        locale(context).milestoneCategory8: [
          locale(context).milestoneWithSiblingOrPets1,
          locale(context).milestoneWithSiblingOrPets2,
          locale(context).milestoneWithSiblingOrPets3,
        ],
        locale(context).milestoneCategory9: [
          locale(context).specialOccasions1,
          locale(context).specialOccasions2,
          locale(context).specialOccasions3,
          locale(context).specialOccasions4,
        ],
      };

  String getRandomImage() {
    Random random = Random();
    return carouselList[random.nextInt(carouselList.length)];
  }
}
