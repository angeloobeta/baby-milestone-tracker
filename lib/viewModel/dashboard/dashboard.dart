import 'package:baby_milestones_tracker/model/utilities/imports/generalImport.dart';
import 'package:carousel_slider/carousel_controller.dart';

class DashBoardViewModel extends BaseModel {
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
    print("It was trigger now");
  }

  List<String> carouselList = [
    'slider1.png',
    'slider2.png',
    'slider3.png',
    'slider4.png',
  ];

  final Map<String, List<String>> milestoneCategories = {
    "Physical Development": [
      "Rolling Over",
      "Sitting Up",
      "Crawling",
      "Standing",
      "First Steps",
    ],
    "Cognitive Development": [
      "Grasping Objects",
      "Babbling",
      "First Words",
      "Recognizing Faces",
      "Problem Solving",
    ],
    "Social and Emotional Development": [
      "Smiling",
      "Laughter",
      "Expressing Emotions",
      "Playing Peek-a-Boo",
      "Forming Attachments",
    ],
    "Feeding and Nutrition": [
      "First Solid Food",
      "Self-Feeding",
      "Transition to Cups",
      "Introducing New Foods",
      "Weaning",
    ],
    "Sleep Patterns": [
      "Sleeping Through the Night",
      "Establishing a Bedtime Routine",
      "Transitioning to a Crib",
      "Dropping Naps",
    ],
    "Health and Wellness": [
      "Immunizations",
      "Teething",
      "First Illness",
      "Growth Spurts",
      "Motor Skills Development",
    ],
    "Speech and Language": [
      "Babbling",
      "First Words",
      "Vocabulary Expansion",
      "Sentence Formation",
      "Language Comprehension",
    ],
    "Milestones with Siblings/Pets": [
      "Sibling Interactions",
      "Bonding with Pets",
      "Family Dynamics",
    ],
    "Special Occasions": [
      "First Birthday",
      "First Christmas/Holiday",
      "Baptism or Naming Ceremony",
      "First Vacation",
    ],
  };

  String getRandomImage() {
    Random random = Random();
    return carouselList[random.nextInt(carouselList.length)];
  }
}
