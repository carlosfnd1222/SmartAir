import 'package:flutter/material.dart';

class Item {
  Item({
    @required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Estaciones',
    );
  });
}

final List<Item> _data = generateItems(1);

bool _todasValue = true,
    _cicataValue = false,
    _refugioValue = false,
    _utsjrValue = false,
    _sjrValue = false;

void _condicionTodas() {
  if (_cicataValue == true &&
      _refugioValue == true &&
      _utsjrValue == true &&
      _sjrValue == true) {
    _todasValue = true;
    _cicataValue = false;
    _refugioValue = false;
    _utsjrValue = false;
    _sjrValue = false;
  }
}

Widget buildPanelEstaciones() {
  return ExpansionPanelList(
    expansionCallback: (int index, bool isExpanded) {
      setState(() {
        _data[index].isExpanded = !isExpanded;
      });
    },
    elevation: 3,
    children: _data.map<ExpansionPanel>((Item item) {
      return ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return ListTile(
            title: Center(
              child: Text(
                item.headerValue,
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
        body: Column(
          children: <Widget>[
            Row(
              children: [
                Column(
                  children: [
                    Checkbox(
                        value: _todasValue,
                        onChanged: (bool value) {
                          print(value);

                          setState(() {
                            _todasValue = value;
                            if (value) {
                              _cicataValue = false;
                              _refugioValue = false;
                              _utsjrValue = false;
                              _sjrValue = false;
                            }
                          });
                        }),
                  ],
                ),
                Text('Todas'),
                SizedBox(
                  width: 50.0,
                ),
                Column(
                  children: [
                    Checkbox(
                        value: _cicataValue,
                        onChanged: (bool value) {
                          print(value);
                          setState(() {
                            _cicataValue = value;
                            _todasValue = false;
                            _condicionTodas();
                          });
                        })
                  ],
                ),
                Text('CICATA')
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Checkbox(
                        value: _refugioValue,
                        onChanged: (bool value) {
                          print(value);

                          setState(() {
                            _refugioValue = value;
                            _todasValue = false;
                            _condicionTodas();
                          });
                        }),
                  ],
                ),
                Text('El Refigio'),
                SizedBox(
                  width: 30.0,
                ),
                Column(
                  children: [
                    Checkbox(
                        value: _utsjrValue,
                        onChanged: (bool value) {
                          print(value);

                          setState(() {
                            _utsjrValue = value;
                            _todasValue = false;
                            _condicionTodas();
                          });
                        }),
                  ],
                ),
                Text('UTSJR'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    value: _sjrValue,
                    onChanged: (bool value) {
                      print(value);
                      setState(() {
                        _sjrValue = value;
                        _todasValue = false;
                        _condicionTodas();
                      });
                    }),
                Text('Centro SJR1'),
              ],
            ),
          ],
        ),
        isExpanded: item.isExpanded,
      );
    }).toList(),
  );
}

void setState(Null Function() param0) {}
