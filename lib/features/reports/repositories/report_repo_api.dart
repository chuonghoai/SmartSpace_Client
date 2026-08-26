import 'package:smartspace_client/core/api/api_client.dart';
import 'package:smartspace_client/core/api/api_response.dart';
import 'package:smartspace_client/features/reports/models/report_model.dart';
import 'package:smartspace_client/features/reports/repositories/report_repo.dart';

class ReportRepoApi implements ReportRepo {
  @override
  Future<ApiResponse<List<ReportModel>>> getDangerousReports() async {
    final response = await apiClient.get('/reports/dangerous');
    return ApiResponse<List<ReportModel>>.fromJson(response.data, (json) {
      if (json is List) {
        return json
            .map((e) => ReportModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    });
  }

  @override
  Future<ApiResponse<List<ReportModel>>> getRecentReports() async {
    final response = await apiClient.get('/reports/recent');
    return ApiResponse<List<ReportModel>>.fromJson(response.data, (json) {
      if (json is List) {
        return json
            .map((e) => ReportModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    });
  }
}
