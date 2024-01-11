import 'package:baby_milestones_tracker/model/utilities/imports/generalImport.dart';

import '../../model/models/onBoardingModel.dart';
import '../../model/utilities/constants/localisation.dart';

class OnBoardingViewModel extends BaseModel {
  PageController pageController = PageController();

  bool startOnboarding = false;

  onStartOnboarding(context) {
    startOnboarding = true;
    notifyListeners();
  }

  OnBoardingModel? onBoardingModel;
  List<OnBoardingModel> onBoardSlide(context) {
    return [
      OnBoardingModel(
          image: "expecting",
          title: locale(context).title1,
          subtitle: locale(context).subtitle1),
      OnBoardingModel(
          image: "motherhood",
          title: locale(context).title2,
          subtitle: locale(context).subtitle2),
      OnBoardingModel(
          image: "quality_time",
          title: locale(context).title3,
          subtitle: locale(context).subtitle3),
      OnBoardingModel(
          image: "toy_car",
          title: locale(context).title3,
          subtitle: locale(context).subtitle3),
    ];
  }

  // default index
  int index = 0;

  updateIndex(value) {
    index = value;
    notifyListeners();
  }
}
