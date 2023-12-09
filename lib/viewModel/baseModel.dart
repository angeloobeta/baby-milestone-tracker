import 'package:baby_milestones_tracker/model/utilities/imports/flutterImport.dart';
import 'package:carousel_slider/carousel_controller.dart';

class BaseModel extends ChangeNotifier {
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
}
