// milestone_model.dart
import 'package:hive/hive.dart';

part 'mileStone.g.dart';

@HiveType(typeId: 0)
class Milestone {
  @HiveField(0)
  late String category;
  @HiveField(1)
  late String typeOfMilestone;
  @HiveField(2)
  late String title;
  @HiveField(3)
  late String description;
  @HiveField(4)
  late String dateOfCreate;

  Milestone({
    required this.category,
    required this.typeOfMilestone,
    required this.title,
    required this.description,
    required this.dateOfCreate,
  });
}

@HiveType(typeId: 1)
class Category {
  @HiveField(0)
  late String name;

  Category({required this.name});
}
