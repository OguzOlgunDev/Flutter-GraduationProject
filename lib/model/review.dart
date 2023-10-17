class Review {
  String imgPath;
  String name;
  String city;
  String review;
  int star;
  Review(this.imgPath, this.name, this.city, this.review, this.star);

  static List<Review> generateReview() {
    return [
      Review(
          "assets/images/profile.png",
          "Tomris Kara",
          "Selçuklu/KONYA",
          "Lorem ipsum dolor sit amet consectetur. Mauris egestas morbi massa tristique condimentum pharetra.",
          5),
      Review(
          "assets/images/profile.png",
          "Aysenur Sucu",
          "Karatay/KONYA",
          "Lorem ipsum dolor sit amet consectetur. Mauris egestas morbi massa tristique condimentum pharetra.",
          4),
      Review(
          "assets/images/profile.png",
          "Oguz Olgun",
          "Çumra/KONYA",
          "Lorem ipsum dolor sit amet consectetur. Mauris egestas morbi massa tristique condimentum pharetra.",
          5),
      Review(
          "assets/images/profile.png",
          "Ali Veli",
          "Meram/KONYA",
          "Lorem ipsum dolor sit amet consectetur. Mauris egestas morbi massa tristique condimentum pharetra.",
          4),
      Review(
          "assets/images/profile.png",
          "Mehmet Kara",
          "Çumra/KONYA",
          "Lorem ipsum dolor sit amet consectetur. Mauris egestas morbi massa tristique condimentum pharetra.",
          3),
      Review(
          "assets/images/profile.png",
          "Mustafa Gül",
          "Çumra/KONYA",
          "Lorem ipsum dolor sit amet consectetur. Mauris egestas morbi massa tristique condimentum pharetra.",
          4),
      Review(
          "assets/images/profile.png",
          "Ayşe Kaya",
          "Selçuklu/KONYA",
          "Lorem ipsum dolor sit amet consectetur. Mauris egestas morbi massa tristique condimentum pharetra.",
          2),
      Review(
          "assets/images/profile.png",
          "Ali Veli",
          "Çumra/KONYA",
          "Lorem ipsum dolor sit amet consectetur. Mauris egestas morbi massa tristique condimentum pharetra.",
          4),
    ];
  }
}
