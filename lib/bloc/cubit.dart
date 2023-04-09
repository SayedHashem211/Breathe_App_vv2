import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/components.dart';
import '../models/login_model.dart';
import '../network/local/cache_helper.dart';
import '../network/remote/dio_helper.dart';
import 'states.dart';

class LoginCubit extends Cubit<BreatheStates> {
  LoginCubit() : super(BreatheInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  int currentIndex = 3;


  void login({
    required String email,
    required String password,
    //dynamic token,
    //required BuildContext? context,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: 'login',
      data: {
        "email": email,
        "password": password,
        token: CacheHelper.getData(key: "token") ?? '',
      },
    ).then((value) {
      //print(value.data['message']);
      LoginModel loginModel = LoginModel.fromJson(value.data);
      //getUserData();
      LoginErrorState(loginModel);
      emit(LoginSuccessState(loginModel));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
      debugPrint('login error $error');
    });
  }
}
