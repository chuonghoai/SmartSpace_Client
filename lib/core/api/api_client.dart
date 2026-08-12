import 'package:dio/dio.dart';
import 'package:smartspace_client/core/api/api_response.dart';
import 'dio_client.dart';

class ApiClient {
  Future<ApiResponse<T>> get<T>(
    String url, {
    Options? options,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? decoder,
  }) async {
    final response = await dioInstance.get<Map<String, dynamic>>(
      url,
      options: options,
      queryParameters: queryParameters,
    );
    return ApiResponse.fromJson(
      response.data!,
      decoder ?? (json) => json as T,
    );
  }

  Future<ApiResponse<T>> post<T>(
    String url, {
    dynamic data,
    Options? options,
    T Function(dynamic)? decoder,
  }) async {
    final response = await dioInstance.post<Map<String, dynamic>>(
      url,
      data: data,
      options: options,
    );
    return ApiResponse.fromJson(
      response.data!,
      decoder ?? (json) => json as T,
    );
  }

  Future<ApiResponse<T>> put<T>(
    String url, {
    dynamic data,
    Options? options,
    T Function(dynamic)? decoder,
  }) async {
    final response = await dioInstance.put<Map<String, dynamic>>(
      url,
      data: data,
      options: options,
    );
    return ApiResponse.fromJson(
      response.data!,
      decoder ?? (json) => json as T,
    );
  }

  Future<ApiResponse<T>> patch<T>(
    String url, {
    dynamic data,
    Options? options,
    T Function(dynamic)? decoder,
  }) async {
    final response = await dioInstance.patch<Map<String, dynamic>>(
      url,
      data: data,
      options: options,
    );
    return ApiResponse.fromJson(
      response.data!,
      decoder ?? (json) => json as T,
    );
  }

  Future<ApiResponse<T>> delete<T>(
    String url, {
    Options? options,
    T Function(dynamic)? decoder,
  }) async {
    final response = await dioInstance.delete<Map<String, dynamic>>(
      url,
      options: options,
    );
    return ApiResponse.fromJson(
      response.data!,
      decoder ?? (json) => json as T,
    );
  }
}

final apiClient = ApiClient();
