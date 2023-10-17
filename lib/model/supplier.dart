import 'package:harsatapp/model/product.dart';

class Supplier {
  String imgPath;
  String name;
  String province;
  String city;
  String desc;
  String star;
  List<Product> productsTohum;
  List<Product> productsGubre;
  List<Product> productsIlac; // List of products

  Supplier(this.imgPath, this.name, this.province, this.city, this.desc,
      this.star, this.productsTohum, this.productsGubre, this.productsIlac);

  static List<Supplier> generateSuppliers() {
    return [
      Supplier(
        "assets/images/bayi.jpg",
        "A bayisi",
        "Çumra",
        "KONYA",
        "Tarım Dostu A Bayisi, modern tarımın ihtiyaç duyduğu yenilikçi ürünler ve çözümlerle donatılmış bir bayidir."
            " Tarım sektöründeki müşterilerimize hızlı ve güvenilir bir hizmet sunarak, onların tarımsal faaliyetlerini daha verimli ve karlı hale getirmeyi hedefliyoruz.",
        "4.5",
        Product.generateTohumCategory(),
        Product.generateGubreCategory(),
        Product.generateIlacCategory(),
      ),
      Supplier(
        "assets/images/bayi.jpg",
        "B bayisi",
        "Selçuklu",
        "KONYA",
        "Tarım Dostu B Bayisi, modern tarımın ihtiyaç duyduğu yenilikçi ürünler ve çözümlerle donatılmış bir bayidir."
            " Tarım sektöründeki müşterilerimize hızlı ve güvenilir bir hizmet sunarak, onların tarımsal faaliyetlerini daha verimli ve karlı hale getirmeyi hedefliyoruz.",
        "4.5",
        Product.generateTohumCategory(),
        Product.generateGubreCategory(),
        Product.generateIlacCategory(),
      ),
      Supplier(
        "assets/images/bayi.jpg",
        "C bayisi",
        "Meram",
        "KONYA",
        "Tarım Dostu C Bayisi, modern tarımın ihtiyaç duyduğu yenilikçi ürünler ve çözümlerle donatılmış bir bayidir."
            " Tarım sektöründeki müşterilerimize hızlı ve güvenilir bir hizmet sunarak, onların tarımsal faaliyetlerini daha verimli ve karlı hale getirmeyi hedefliyoruz.",
        "4.5",
        Product.generateTohumCategory(),
        Product.generateGubreCategory(),
        Product.generateIlacCategory(),
      ),
      Supplier(
        "assets/images/bayi.jpg",
        "D bayisi",
        "Karatay",
        "KONYA",
        "Tarım Dostu C Bayisi, modern tarımın ihtiyaç duyduğu yenilikçi ürünler ve çözümlerle donatılmış bir bayidir."
            " Tarım sektöründeki müşterilerimize hızlı ve güvenilir bir hizmet sunarak, onların tarımsal faaliyetlerini daha verimli ve karlı hale getirmeyi hedefliyoruz.",
        "4.5",
        Product.generateTohumCategory(),
        Product.generateGubreCategory(),
        Product.generateIlacCategory(),
      ),
      Supplier(
        "assets/images/bayi.jpg",
        "E bayisi",
        "Selçuklu",
        "KONYA",
        "Tarım Dostu C Bayisi, modern tarımın ihtiyaç duyduğu yenilikçi ürünler ve çözümlerle donatılmış bir bayidir."
            " Tarım sektöründeki müşterilerimize hızlı ve güvenilir bir hizmet sunarak, onların tarımsal faaliyetlerini daha verimli ve karlı hale getirmeyi hedefliyoruz.",
        "4.5",
        Product.generateTohumCategory(),
        Product.generateGubreCategory(),
        Product.generateIlacCategory(),
      ),
      Supplier(
        "assets/images/bayi.jpg",
        "F bayisi",
        "Meram",
        "KONYA",
        "Tarım Dostu C Bayisi, modern tarımın ihtiyaç duyduğu yenilikçi ürünler ve çözümlerle donatılmış bir bayidir."
            " Tarım sektöründeki müşterilerimize hızlı ve güvenilir bir hizmet sunarak, onların tarımsal faaliyetlerini daha verimli ve karlı hale getirmeyi hedefliyoruz.",
        "4.5",
        Product.generateTohumCategory(),
        Product.generateGubreCategory(),
        Product.generateIlacCategory(),
      ),
    ];
  }
}
