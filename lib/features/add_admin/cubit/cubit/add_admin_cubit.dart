import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:our_market_admin_dashboard/core/api_services.dart';

part 'add_admin_state.dart';

class AddAdminCubit extends Cubit<AddAdminState> {
  AddAdminCubit() : super(AddAdminInitial());

  ApiServices _apiServices = ApiServices();
  Future<void> createAnAccount(Map<String, dynamic> data) async {
    emit(AddAdminLoading());
    try {
      emit(AddAdminLoading());
    Response response = await _apiServices.createAnAccount('signup', data);
    if (response.statusCode == 200) {
      emit(AddAdminSuccess());
    } else {
      emit(AddAdminError(masError: response.data['msg']));
    }
    } catch (e) {
      emit(AddAdminError(masError: "Something went wrong please try again"));
    }
  }
}
