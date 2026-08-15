import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:smartspace_client/core/auth/refresh_token_service.dart';
import 'package:smartspace_client/core/auth/access_token_service.dart';
import 'package:smartspace_client/features/auth/services/auth_service.dart';
import 'package:smartspace_client/routes/router_path.dart';
import '../../routes/app_router.dart';

class ErrorInterceptor extends Interceptor {
  static final StreamController<String> unauthenticatedStream =
      StreamController<String>.broadcast();

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final status = err.response?.statusCode;
    final requestUrl = err.requestOptions.path;

    if (status == 401 &&
        !requestUrl.contains('/auth/login') &&
        !requestUrl.contains('/auth/refresh-token') &&
        err.requestOptions.extra['isRetry'] != true) {
      final refreshToken = await refreshTokenService.getRefreshToken();
      String reason = 'unauthorized';

      if (refreshToken != null) {
        bool refreshTokenSuccess = await authService.refreshToken(refreshToken);

        if (refreshTokenSuccess) {
          try {
            final newAccessToken = await accessTokenService.getAccessToken();
            err.requestOptions.headers['Authorization'] =
                'Bearer $newAccessToken';
            err.requestOptions.extra['isRetry'] = true;
            final dio = Dio();
            final response = await dio.fetch(err.requestOptions);
            return handler.resolve(response);
          } on DioException catch (retryErr) {
            return handler.next(retryErr);
          } catch (e) {
            return handler.next(err);
          }
        }

        reason = 'expired';
      }

      await authService.logout();
      unauthenticatedStream.add(reason);
      appRouter.go(RouterPath.login);
      return handler.next(err);
    }

    if (status == 403) {
      log('Forbidden');
      // TODO: add toast to notif error
    }

    if (status == 500) {
      log('Server error');
      // TODO: add toast to notif error
    }

    super.onError(err, handler);
  }
}
