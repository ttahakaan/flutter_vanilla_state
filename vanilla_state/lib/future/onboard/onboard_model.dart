class OnBoardModel {
  final String title;
  final String description;
  final String imageName;

  OnBoardModel(this.title, this.description, this.imageName);
  String get imageWithPath => "assets/images/$imageName.png";
}

class OnBoardModels {
  static final List<OnBoardModel> onBoardItems = [
    OnBoardModel("Order Your Food", "Now you can order food any time right from your mobile.", "it_chef"),
    OnBoardModel("Order Your Food", "Now you can order food any time right from your mobile.", "it_delivery"),
    OnBoardModel("Order Your Food", "Now you can order food any time right from your mobile.", "it_order"),
  ];
}
