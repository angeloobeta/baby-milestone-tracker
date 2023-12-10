// hive_setup.dart
import 'package:baby_milestones_tracker/model/models/mileStone.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

setupHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(MilestoneAdapter());

  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  await Hive.openBox<Category>('categories');
  await Hive.openBox<Milestone>('milestones');
  print("Hive has been initialise");
}
