```dart
class ApiError implements Exception {
  final String message;
  ApiError(this.message);
  @override
  String toString() => 'API Error: $message';
}

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Process JSON data
    } else {
      throw ApiError('Request failed with status: ${response.statusCode}');
    }
  } on ApiError catch (e) {
    // Handle specific API errors
    print('API Error: ${e.message}');
    //Take some action
  } catch (e) {
    // Handle other exceptions
    print('An unexpected error occurred: $e');
    //Take some action
  }
}
```