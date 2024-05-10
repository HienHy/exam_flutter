import 'dart:convert';

import 'package:flutter/material.dart';

import 'model/order_model.dart';

void main() {
  runApp(const MyApp());
}

List<Map> jsonString = [
  {
    "Item": "A1000",
    "ItemName": "Iphone 15",
    "Price": 1200,
    "Currency": "USD",
    "Quantity": 1
  },
  {
    "Item": "A1001",
    "ItemName": "Iphone 16",
    "Price": 1500,
    "Currency": "USD",
    "Quantity": 1
  }
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const DataTableExample(),
      ),
    );
  }
}

class DataTableExample extends StatelessWidget {
  const DataTableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('List Order'),
      ),
      body: ListView(
        children: [_createDataTable()],
      ),
    ));
  }
}

DataTable _createDataTable() {
  return DataTable(columns: _createColumns(), rows: _createRows());
}

List<DataColumn> _createColumns() {
  return [
    DataColumn(label: Text('Item')),
    DataColumn(label: Text('ItemName')),
    DataColumn(label: Text('Price')),
    DataColumn(label: Text('Currency')),
    DataColumn(label: Text('Quantity')),
  ];
}

List<DataRow> _createRows() {
  return jsonString
      .map((order) => DataRow(cells: [
            DataCell(Text('#' + order['Item'].toString())),
            DataCell(Text(order['ItemName'])),
            DataCell(Text(order['Price'].toString())),
            DataCell(Text(order['Currency'])),
            DataCell(Text(order['Quantity'].toString())),
          ]))
      .toList();
}
