import 'package:smartspace_client/core/api/api_client.dart';
import 'package:smartspace_client/core/api/api_response.dart';
import 'package:smartspace_client/features/notifications/models/notification_count_model.dart';
import 'package:smartspace_client/features/notifications/repositories/notification_repo.dart';

class NotificationRepoApi implements NotificationRepo {
  @override
  Future<ApiResponse<NotificationCountModel>> getUnreadCount() async {
    final response = await apiClient.get('/notifications/unread-count');
    return ApiResponse<NotificationCountModel>.fromJson(
      response.data,
      (json) => NotificationCountModel.fromJson(json),
    );
  }
}
