import 'package:baby_milestones_tracker/model/utilities/imports/generalImport.dart';

import '../../model/models/onBoardingModel.dart';

class OnBoardingViewModel extends BaseModel {
  PageController pageController = PageController();

  bool Start = false;

  onStartOnboarding(context) {
    Start = true;
    notifyListeners();
  }

  OnBoardingModel? onBoardingModel;
  List<OnBoardingModel> onBoardSlide = [
    OnBoardingModel(
        image: "expecting",
        title: "Effortless Ordering",
        subtitle:
            "Order your favorite meals with a few taps, anytime, anywhere"),
    OnBoardingModel(
        image: "motherhood",
        title: "Effortless Ordering",
        subtitle:
            "Order your favorite meals with a few taps, anytime, anywhere"),
    OnBoardingModel(
        image: "quality_time",
        title: "Effortless Ordering",
        subtitle:
            "Order your favorite meals with a few taps, anytime, anywhere"),
    OnBoardingModel(
        image: "toy_car",
        title: "Effortless Ordering",
        subtitle:
            "Order your favorite meals with a few taps, anytime, anywhere"),
  ];
  // default index
  int index = 0;

  updateIndex(value) {
    index = value;
    print("The  length of onBoardingServices is ======>" + "");
    notifyListeners();
  }
}
