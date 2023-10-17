import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ym_blood_app/features/auth/data/models/login_response_model.dart';
part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.loggedIn(LoginResponseModel loginReponseModel) =
      _LoggedIn;
  const factory AuthState.loggedOut() = _LoggedOut;
  const factory AuthState.loading() = _Loading;
}