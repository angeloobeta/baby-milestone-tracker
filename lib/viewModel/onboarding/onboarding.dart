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
  List<OnBoardingModel> onBoardSlide = [
    OnBoardingModel(
        image: "expecting",
        title: locale(context as BuildContext).title1,
        subtitle: locale(context as BuildContext).subtitle1),
    OnBoardingModel(
        image: "motherhood",
        title: locale(context as BuildContext).title2,
        subtitle: locale(context as BuildContext).subtitle2),
    OnBoardingModel(
        image: "quality_time",
        title: locale(context as BuildContext).title3,
        subtitle: locale(context as BuildContext).subtitle3),
    OnBoardingModel(
        image: "toy_car",
        title: locale(context as BuildContext).title3,
        subtitle: locale(context as BuildContext).subtitle3),
  ];
  // default index
  int index = 0;

  updateIndex(value) {
    index = value;
    notifyListeners();
  }
}
