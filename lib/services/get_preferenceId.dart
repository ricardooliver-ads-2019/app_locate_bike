import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getPreferenceId({title, description, quantity, currency_id, unit_price, email}) async{
  var url = Uri.parse(
    'https://api.mercadopago.com/checkout/preferences?access_token=TEST-3530108625886757-091814-0df6a0936af44e754c053872b4fe8277-295676413'
  );

  Map<String, dynamic> corpoJson={
    "items": [
						 {
						 "title": title,
						 "description": description,
						 "quantity": quantity,
						 "currency_id": currency_id,
						 "unit_price": unit_price
						 }
				 ],
				 "payer": {
						 "email": email
				 }
  };

  String corpoString = jsonEncode(corpoJson);

  var response = await http.post(
    url, 
    body: corpoString
  );

  var finalResponseId = jsonDecode(response.body);
  var preferenceId = finalResponseId['id'];

  print('Status Response: ${response.statusCode}');
  print('Response body: ${response.body}');
  print('preferenceId: ${preferenceId}');

  return preferenceId;
}