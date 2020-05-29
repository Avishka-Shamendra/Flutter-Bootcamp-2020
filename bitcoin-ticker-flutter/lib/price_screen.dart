import 'package:bitcoin_ticker/widgets/displayCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  PriceScreen(this.coinData);
  CoinData coinData;
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  List<String> currencyList = currenciesList;
  var coinValues = {};
  bool isWaiting = false;

  DropdownButton androidDropDown(List<String> currencyList) {
    List<DropdownMenuItem> items = [];
    for (String currency in currencyList) {
      items.add(
        DropdownMenuItem(
          child: Text(currency),
          value: currency,
        ),
      );
    }
    return DropdownButton(
        value: selectedCurrency,
        items: items,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value;
            getData(); //pass the selected new currency
          });
        });
  }

  CupertinoPicker iosPicker(List<String> currencyList) {
    List<Text> items = [];
    for (String currency in currencyList) {
      items.add(
        Text(currency),
      );
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currencyList[selectedIndex];
          getData();
        });
      },
      children: items,
    );
  }

  void getData() async {
    isWaiting = true;
    try {
      var data = await widget.coinData.getCoinData(selectedCurrency);
      isWaiting = false;
      print(data);
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListView.builder(
                  itemCount: cryptoList.length,
                  itemBuilder: (context, index) {
                    return DisplayCard(
                        cryptoCurrency: cryptoList[index],
                        rate:
                            (isWaiting) ? null : coinValues[cryptoList[index]],
                        selectedCurrency: selectedCurrency);
                  }),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS
                ? iosPicker(currencyList)
                : androidDropDown(currencyList),
          ),
        ],
      ),
    );
  }
}
