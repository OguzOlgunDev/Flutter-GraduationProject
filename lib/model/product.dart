class ProductCategory {
  String imgPath;
  String name;
  ProductCategory(this.imgPath, this.name);

  static List<ProductCategory> generateProductCategory() {
    return [
      ProductCategory("assets/images/tohum.jpg", "TOHUM"),
      ProductCategory("assets/images/ilac.jpg", "İLAÇ"),
      ProductCategory("assets/images/gubre.jpg", "GÜBRE"),
      ProductCategory("assets/images/sulama.jpg", "SULAMA"),
    ];
  }
}

class Product {
  String imgPath;
  String name;
  String bayi;
  String province;
  String city;
  double star;
  int price;
  String unit;
  Product(this.imgPath, this.name, this.bayi, this.province, this.city,
      this.star, this.price, this.unit);

  static List<Product> generateTohumCategory() {
    return [
      Product("assets/images/product1.jpg", "A kalite tohum", "A bayisi",
          "Çumra", "KONYA", 4.5, 250, "ton"),
      Product("assets/images/product2.jpg", "B kalite tohum", "B bayisi",
          "Selçuklu", "KONYA", 4.5, 450, "ton"),
      Product("assets/images/product3.jpg", "C kalite tohum", "C bayisi",
          "Meram", "KONYA", 4.5, 150, "ton"),
      Product("assets/images/product4.jpg", "D kalite tohum", "D bayisi",
          "Karatay", "KONYA", 4.5, 250, "ton"),
      Product("assets/images/product5.jpg", "Çok İyi kalite tohum", "E bayisi",
          "Çumra", "KONYA", 4.5, 150, "ton"),
      Product("assets/images/product6.jpg", "İyi kalite tohum", "F bayisi",
          "Selçuklu", "KONYA", 4.5, 150, "ton"),
      Product(
        "assets/images/product7.jpg",
        "Orta kalite tohum",
        "A bayisi",
        "Çumra",
        "KONYA",
        4.5,
        100,
        "ton",
      ),
    ];
  }

  static List<Product> generateGubreCategory() {
    return [
      Product("assets/images/product1.jpg", "A kalite gübre", "A bayisi",
          "Çumra", "KONYA", 4.5, 150, "ton"),
      Product("assets/images/product2.jpg", "B kalite gübre", "B bayisi",
          "Selçuklu", "KONYA", 4.5, 150, "ton"),
      Product("assets/images/product3.jpg", "C kalite gübre", "C bayisi",
          "Meram", "KONYA", 4.5, 150, "ton"),
      Product("assets/images/product4.jpg", "D kalite gübre", "D bayisi",
          "Karatay", "KONYA", 4.5, 150, "ton"),
      Product("assets/images/product5.jpg", "Çok İyi kalite gübre", "E bayisi",
          "Selçuklu", "KONYA", 4.5, 150, "ton"),
      Product("assets/images/product6.jpg", "İyi kalite gübre", "F bayisi",
          "Meram", "KONYA", 4.5, 150, "ton"),
      Product("assets/images/product7.jpg", "Orta kalite gübre", "A bayisi",
          "Çumra", "KONYA", 4.5, 150, "ton"),
    ];
  }

  static List<Product> generateIlacCategory() {
    return [
      Product("assets/images/product1.jpg", "A kalite ilaç", "A bayisi",
          "Çumra", "KONYA", 4.5, 150, "ton"),
      Product("assets/images/product2.jpg", "B kalite ilaç", "B bayisi",
          "Selçuklu", "KONYA", 4.5, 150, "ton"),
      Product("assets/images/product3.jpg", "C kalite ilaç", "C bayisi",
          "Meram", "KONYA", 4.5, 150, "ton"),
      Product("assets/images/product4.jpg", "D kalite ilaç", "D bayisi",
          "Karatay", "KONYA", 4.5, 150, "ton"),
      Product("assets/images/product5.jpg", "Çok İyi kalite ilaç", "E bayisi",
          "Selçuklu", "KONYA", 4.5, 150, "ton"),
      Product("assets/images/product6.jpg", "İyi kalite ilaç", "F bayisi",
          "Meram", "KONYA", 4.5, 150, "ton"),
      Product("assets/images/product7.jpg", "Orta kalite ilaç", "A bayisi",
          "Çumra", "KONYA", 4.5, 150, "ton"),
    ];
  }

  static List<Product> generateSulamaCategory() {
    return [
      Product("assets/images/product1.jpg", "A kalite sistemi", "A bayisi",
          "Çumra", "KONYA", 4.5, 150, "metre"),
      Product("assets/images/product2.jpg", "B kalite sistemi", "B bayisi",
          "Selçuklu", "KONYA", 4.5, 150, "metre"),
      Product("assets/images/product3.jpg", "C kalite sistem", "C bayisi",
          "Meram", "KONYA", 4.5, 150, "metre"),
      Product("assets/images/product4.jpg", "D kalite sistem", "A bayisi",
          "Karatay", "KONYA", 4.5, 150, "metre"),
      Product("assets/images/product5.jpg", "Çok İyi kalite sistem", "B bayisi",
          "Çumra", "KONYA", 4.5, 150, "metre"),
      Product("assets/images/product6.jpg", "İyi kalite sistem", "C bayisi",
          "Selçuklu", "KONYA", 4.5, 150, "metre"),
      Product("assets/images/product7.jpg", "Orta kalite sistem", "A bayisi",
          "Meram", "KONYA", 4.5, 150, "metre"),
    ];
  }
}
