import 'package:baby_milestones_tracker/model/utilities/imports/generalImport.dart';
import 'package:baby_milestones_tracker/viewModel/mileStone/mileStone.dart';

import 'mileStoneDetail.dart';

class AllMileStonePage extends StatelessWidget {
  AllMileStonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MileStoneViewModel>.reactive(
        viewModelBuilder: () => MileStoneViewModel(),
        builder: (context, model, child) =>
            BaseUi(safeBottom: false, children: [
              const TabHeading(title: "Mile Stone Category"),
              rowPositioned(
                  top: 50,
                  child: S(
                    w: 400,
                    h: 800,
                    child: ListView.builder(
                        itemCount: model.milestoneCategories.length,
                        itemBuilder: (context, index) {
                          String category =
                              model.milestoneCategories.keys.elementAt(index);
                          List<String> options =
                              model.milestoneCategories[category]!;
                          String backgroundImage = model.getRandomImage();
                          String mileStoneInDetail = '';
                          for (String mileStone in options) {
                            mileStoneInDetail =
                                mileStoneInDetail + "* $mileStone\n";
                          }
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MileStoneDetailPage(
                                            title: category,
                                            milesOption: options,
                                          )));
                            },
                            child: ListTile(
                              title: GeneralTextDisplay(
                                  category, black, 1, 18, FontWeight.w500, ''),
                              subtitle: GeneralTextDisplay(mileStoneInDetail,
                                  black, 6, 14, FontWeight.w500, ''),
                              trailing: GeneralIconDisplay(
                                  Icons.arrow_forward_ios_sharp,
                                  black,
                                  UniqueKey(),
                                  20),
                            ),
                          );
                        }),
                  )),
              pageTab(context, tabEnum: TabEnum.milestone)
            ]));
  }
}
