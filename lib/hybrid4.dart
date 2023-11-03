import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse(
        'https://random-data-api.com/api/users/random_user?size=8-12'));
    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> users =
          List<Map<String, dynamic>>.from(json.decode(response.body));
      for (final user in users) {
        final uid = user['uid'];
        final firstName = user['first_name'];
        final lastName = user['last_name'];
        print('$uid $firstName $lastName');
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (e) {
    print('Error: $e');
  }
}
