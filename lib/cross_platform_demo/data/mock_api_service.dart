import '../models/location.dart';

/// This service simulates a real backend API call.
/// In a real application, this is where you would use the `http` or `dio` package
/// to make GET/POST requests to your server.
class MockApiService {
  Future<List<Location>> fetchLocations() async {
    // Simulate network delay to show loading states in UI
    await Future.delayed(const Duration(seconds: 1));

    // Return mock data
    return [
      Location(
        id: '1',
        name: 'Main Building',
        description: 'Administrative offices and main lecture halls.',
        imageUrl: 'https://images.unsplash.com/photo-1541339907198-e08756dedf3f?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
      ),
      Location(
        id: '2',
        name: 'Central Library',
        description: 'A quiet place for study with over 100k books.',
        imageUrl: 'https://images.unsplash.com/photo-1548048026-5a1a941d93d3?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
      ),
      Location(
        id: '3',
        name: 'Science Laboratory',
        description: 'Equipped with the latest research instruments.',
        imageUrl: 'https://images.unsplash.com/photo-1581093458791-9f3c3900df4b?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
      ),
      Location(
        id: '4',
        name: 'Student Canteen',
        description: 'Food, drinks, and a place to hang out.',
        imageUrl: 'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
      ),
      Location(
        id: '5',
        name: 'Parking Lot A',
        description: 'Main parking area for students and staff.',
        imageUrl: 'https://images.unsplash.com/photo-1506521781263-d8422e82f27a?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
      ),
    ];
  }
}
