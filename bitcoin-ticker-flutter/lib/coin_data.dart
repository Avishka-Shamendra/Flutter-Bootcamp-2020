import 'dart:convert';

import 'package:bitcoin_ticker/utilities/constants.dart';
import 'package:http/http.dart' as HTTP;

const List<String> currenciesList = [
  'AUD',
  'LKR',
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

class CoinData {
  CoinData({this.APIurl});
  final APIurl;

  Future<Map> getCoinData(String currency) async {
    Map resultMap = {};
    for (String cryptoCurrency in cryptoList) {
      HTTP.Response response =
          await HTTP.get('$APIurl/$cryptoCurrency/$currency?apikey=$kAPIkey');
      if (!(response.statusCode == 200)) {
        print('Error');
      } else {
        Map<String, dynamic> result = jsonDecode(response.body);
        resultMap[cryptoCurrency] = result['rate'].toStringAsFixed(2);
      }
    }
    return resultMap;
  }
}
