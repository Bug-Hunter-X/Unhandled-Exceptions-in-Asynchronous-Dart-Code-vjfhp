```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://example.com/data'));
    if (response.statusCode == 200) {
      // Success, process the JSON response
      final jsonData = jsonDecode(response.body);
      // Access data using jsonData['key']
      print(jsonData); 
    } else {
      // Handle error
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exception, e.g., network error
    print('Error: $e');
    rethrow; // Re-throw to allow caller to handle the exception
  }
}
```