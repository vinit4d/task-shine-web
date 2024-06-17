import 'package:demo/domain/entity/products_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/remote_repository/firebase_auth_repo_imp.dart';
import '../../../../data/remote_repository/product_remote_repo_imp.dart';
import '../../../../data/remote_services/firebase_auth_services_imp.dart';
import '../../../../domain/enums/app_state_enum.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  List<ProductsEntity> products = [];
  ProductRemoteRepoImp service = ProductRemoteRepoImp();

  getProducts() async {

    emit(HomeLoadingState());
    try {
      products = await service.getProducts();
      emit(HomeSuccessState());
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
