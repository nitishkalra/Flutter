import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'Yjg2MWIzNmIyYjc0NDc1OGIyMzQ5NzMzMWNhZTU3YmI';

class CoinData {
  //TODO: Create your getCoinData() method here.

  Future<Map<String,String>> getCoinData(String currency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      Map<String, String> headers = {"x-ba-key": apiKey};
      http.Response response = await http.get(
        'https://apiv2.bitcoinaverage.com/indices/global/ticker/$crypto$currency',
        headers: headers,
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        cryptoPrices[crypto] = data["last"].toString();
      } else {
        print(response.statusCode);
      }
    }
    print(cryptoPrices);
    return cryptoPrices;
  }
}
