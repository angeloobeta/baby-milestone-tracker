import 'package:baby_milestones_tracker/model/utilities/imports/generalImport.dart';

import '../../model/models/onBoardingModel.dart';

class OnBoardingViewModel extends BaseModel {
  PageController pageController = PageController();

  bool startOnboarding = false;

  onStartOnboarding(context) {
    startOnboarding = true;
    notifyListeners();
  }

  OnBoardingModel? onBoardingModel;
  List<OnBoardingModel> onBoardSlide = [
    OnBoardingModel(
        image: "expecting",
        title: "Track Key Developmental Milestones",
        subtitle:
            "Stay Informed, Every Step of the Way. Record and Monitor Your Baby's Growth and Achievements effortlessly"),
    OnBoardingModel(
        image: "motherhood",
        title: "Personalized Insights Just for You",
        subtitle:
            "Tailored Guidance for Your Unique Baby. Receive Expert Tips and Advice Based on Your Baby's Developmental"),
    OnBoardingModel(
        image: "quality_time",
        title: "Memories That Last a Lifetime",
        subtitle:
            "Create a Time Capsule of Cherished Moments. Turn Every Baby Milestone into a Beautiful Memory to Treasure Forever"),
    OnBoardingModel(
        image: "toy_car",
        title: "Seamless and Intuitive Experience",
        subtitle:
            "Effortless Journey Through Parenthood. Enjoy an Intuitive Interface for Stress-Free Tracking and Joyful Parenting"),
  ];
  // default index
  int index = 0;

  updateIndex(value) {
    index = value;
    notifyListeners();
  }
}
