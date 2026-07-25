import '../models/location.dart';
import 'mock_api_service.dart';

/// The Repository acts as a mediator between the Data source (API Service)
/// and the Presentation layer (UI). 
///
/// Both Web and Mobile UI will use this same repository.
/// When you are ready to use a real API, you just change the implementation
/// inside this repository (or inject a different ApiService), and the UI 
/// remains untouched!
class LocationRepository {
  final MockApiService _apiService;

  LocationRepository({MockApiService? apiService}) : _apiService = apiService ?? MockApiService();

  Future<List<Location>> getLocations() async {
    try {
      // In a real app, you might also add local database caching here.
      return await _apiService.fetchLocations();
    } catch (e) {
      // Handle errors (e.g., return empty list or rethrow)
      throw Exception('Failed to load locations: $e');
    }
  }
}
