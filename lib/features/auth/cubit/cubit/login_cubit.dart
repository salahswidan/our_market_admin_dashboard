import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:our_market_admin_dashboard/core/shared_pref.dart';

import '../../../../core/api_services.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final ApiServices _apiServices = ApiServices();

  Future<void> login(Map<String, dynamic> data) async {
    emit(LoginLoading());
    try {
      Response response = await _apiServices.login("token", data);
      if (response.statusCode == 200) {
        await SharedPref.saveToken(response.data["access_token"]);
        emit(LoginSuccess());
        // save the token in the local storage by shared prefs
      } else {
        emit(LoginError(msgError: response.data["msg"]));
      }
    } catch (e) {
      emit(LoginError(msgError: "Something went wrong , please try again"));
    }
  }
}
