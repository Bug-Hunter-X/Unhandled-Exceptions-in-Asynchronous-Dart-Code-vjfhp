```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        return jsonData; 
      } catch (e) {
        print('Error decoding JSON: $e');
        return null; // Or throw a custom exception
      }
    } else {
      print('HTTP error: ${response.statusCode}');
      return null; // Or throw a custom exception 
    }
  } on Exception catch (e) {
    print('Network or other exception: $e');
    return null; // Or throw a custom exception 
  } catch (e) {
    print('Unexpected Error: $e');
    return null; 
  }
}

void main() async {
  final data = await fetchData();
  if (data != null) {
    print('Data fetched successfully: $data');
  } else {
    print('Failed to fetch data.');
  }
}
```