import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../../../core/api_services.dart';

part 'add_admin_state.dart';

class AddAdminCubit extends Cubit<AddAdminState> {
  AddAdminCubit() : super(AddAdminInitial());

  final ApiServices _apiServices = ApiServices();

  Future<void> createAnAccount(Map<String, dynamic> data) async {
    emit(AddAdminLoading());
    try {
      emit(AddAdminLoading());
      Response response = await _apiServices.createAnAccount("signup", data);
      if (response.statusCode == 200) {
        emit(AddAdminSuccess());
      } else {
        emit(AddAdminError(masError: response.data["msg"]));
      }
    } catch (e) {
      print(e.toString());
      emit(AddAdminError(masError: "Something went wrong , please try again"));
    }
  }
}
