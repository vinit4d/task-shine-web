import 'package:demo/data/dto/products_dto.dart';

import '../../domain/services/products_repo.dart';
import '../../domain/utlis/network_utlis.dart';
import '../../domain/utlis/remote_keys.dart';
import '../exception/exception_handler.dart';

class ProductRemoteServices extends ProductsService {
  @override
  Future<dynamic> getProducts() async {
    try {


      final url = Uri.https(
          // RemoteKey.tokenURL1
          RemoteKey.baseURL,
          "/products");
      var json = await NetworkUtils.get(url);


      return json;
    } on NotFoundException {
      throw NotFoundException("Data Not Found");
    } catch (err) {
      print("erorrr--->> ${err}");
      throw ApiNotRespondingException(err.toString());
    }
    // throw UnimplementedError();
  }
}
