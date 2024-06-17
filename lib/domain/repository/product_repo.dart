import 'package:demo/domain/entity/products_entity.dart';

abstract class ProductRepo {
  Future<List<ProductsEntity>> getProducts();
}
