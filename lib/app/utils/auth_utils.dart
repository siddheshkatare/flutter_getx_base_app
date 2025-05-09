import 'package:get_storage/get_storage.dart';

/// This class will use GetStorage to read and write auth data
class AuthUtils {
  static const String authDataKey = 'authData';
  static const String accessTokenKey = 'accessToken';
  static const String refreshTokenKey = 'refreshToken';

  static void setAuthData(Map<String, dynamic> authData) {
    GetStorage().write(authDataKey, authData);
  }

  static Map<String, dynamic> getAuthData() {
    return GetStorage().read(authDataKey) ?? {};
  }

  static void removeAuthData() {
    GetStorage().remove(authDataKey);
  }

  static void setAccessToken(String accessToken) {
    GetStorage().write(accessTokenKey, accessToken);
  }

  static String getAccessToken() {
    return GetStorage().read(accessTokenKey) ?? '';
  }

  static void removeAccessToken() {
    GetStorage().remove(accessTokenKey);
  }

  static void setRefreshToken(String refreshToken) {
    GetStorage().write(refreshTokenKey, refreshToken);
  }

  static String getRefreshToken() {
    return GetStorage().read(refreshTokenKey) ?? '';
  }

  static void removeRefreshToken() {
    GetStorage().remove(refreshTokenKey);
  }

  static bool isAuth() {
    return getAccessToken().isNotEmpty;
  }

  static void logout() {
    removeAuthData();
    removeAccessToken();
    removeRefreshToken();
  }

  static void login(
    Map<String, dynamic> authData,
    String accessToken,
    String refreshToken,
  ) {
    setAuthData(authData);
    setAccessToken(accessToken);
    setRefreshToken(refreshToken);
  }
}
