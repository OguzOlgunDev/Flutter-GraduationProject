import 'package:get/get.dart';
import 'package:harsatapp/model/product.dart';

class CartController extends GetxController {
  var _products = {}.obs;

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }
    Get.snackbar(
      "Ürün sepete eklenmiştir",
      "${product.name} ürün",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  void removeProducts(Product product) {
    _products[product] -= 1;
  }

  void removeProductPerminantly(Product product) {
    _products.removeWhere((key, value) => key == product);
  }

  get products => _products;

  get productsSubTotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total => _products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toString();
}
