import 'package:flutter/material.dart';
import 'package:smartspace_client/core/auth/user_storage_service.dart';
import 'package:smartspace_client/features/profile/models/user_model.dart';

// Note: A real implementation would move this to a domain/model layer
class MockReport {
  final String id;
  final String title;
  final String status;
  final DateTime date;
  final String category;

  MockReport({
    required this.id,
    required this.title,
    required this.status,
    required this.date,
    required this.category,
  });
}

class HomeController extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<MockReport> _recentReports = [];
  List<MockReport> get recentReports => _recentReports;

  final int _unreadNotifications = 3;
  int get unreadNotifications => _unreadNotifications;

  UserModel? _user;
  UserModel? get user => _user;

  HomeController() {
    _init();
  }

  Future<void> _init() async {
    _isLoading = true;
    notifyListeners();

    await _loadUser();
    await _loadMockData();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> _loadUser() async {
    final u = await userStorageService.getUser();
    if (u != null) {
      _user = u;
    }
  }

  Future<void> _loadMockData() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    _recentReports = [
      MockReport(
        id: '1',
        title: 'Hố tử thần trên đường A',
        status: 'pending',
        date: DateTime.now().subtract(const Duration(hours: 2)),
        category: 'Hạ tầng',
      ),
      MockReport(
        id: '2',
        title: 'Xả rác trộm tại hẻm B',
        status: 'resolved',
        date: DateTime.now().subtract(const Duration(days: 1)),
        category: 'Môi trường',
      ),
      MockReport(
        id: '3',
        title: 'Đèn đường hỏng ở khu C',
        status: 'in_progress',
        date: DateTime.now().subtract(const Duration(days: 2)),
        category: 'Hạ tầng',
      ),
    ];
  }

  void onCreateReportTap(BuildContext context) {
    // TODO: Navigate to create report flow
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tạo phản ánh clicked (Mock)')),
    );
  }

  void onMyReportsTap(BuildContext context) {
    // TODO: Navigate to my reports
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Phản ánh của tôi clicked (Mock)')),
    );
  }
}
