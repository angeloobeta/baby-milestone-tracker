class OnBoardingModel {
  String? image;
  String? title;
  String? subtitle;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  factory OnBoardingModel.fromJson(Map<String, dynamic> json) =>
      OnBoardingModel(
          image: json['image'],
          title: json['title'],
          subtitle: json['subtitle']);
}
