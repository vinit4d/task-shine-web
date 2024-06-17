import 'package:demo/data/dto/products_dto.dart';
import 'package:demo/data/remote_services/product_remote_services.dart';
import 'package:demo/domain/entity/products_entity.dart';

import '../../domain/repository/product_repo.dart';

class ProductRemoteRepoImp extends ProductRepo {
  ProductRemoteServices services = ProductRemoteServices();

  @override
  Future<List<ProductsEntity>> getProducts() async {
    List<ProductsEntity> list = [];
    try {
      var json = await services.getProducts();

      list.clear();

      for (var product in json!) {
        list.add(ProductsEntity.fromJson(product));
      }


      //   list.add(SurveyLiveEntity(
      //       id: survey.id.toString(),
      //       createdAt: survey.createdAt,
      //       customerEmail: survey.customerDetail!.customerEmail,
      //       customerLogo: survey.customerDetail!.customerLogo,
      //       customerName: survey.customerDetail!.customerName,
      //       address: survey.surveyLocationDetail!.address,
      //       city: survey.surveyLocationDetail!.city,
      //       country:  survey.surveyLocationDetail!.country,
      //       locationName:  survey.surveyLocationDetail!.locationName,
      //       postalCode:  survey.surveyLocationDetail!.postalCode,
      //       state:  survey.surveyLocationDetail!.state,
      //       surveyItemLogs: survey.surveyItemLogs,
      //       surveyName: survey.surveyName,
      //       surveyStatus: survey.surveyStatus,
      //       itemDetails: survey.itemDetails,
      //       locationId:  survey.surveyLocationDetail!.id.toString(),
      //       userName: survey.userDetail!.userName!,
      //       logs: survey.surveyItemLogs,
      //       customerId: survey.customerID.toString()));
      // }

      return list;
    } catch (e) {
      print(e);
      return list;
    }
  }
}
