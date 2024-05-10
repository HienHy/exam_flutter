import 'package:uuid/uuid.dart';


import '../constants.dart';
import '../model/order_model.dart';

enum Currency{
  USD,
  EUR,
  VND
}
// List.from(json['roles']).map((e) => Roles.fromJson(e)).toList();
class OrderService {

  static Future<List<Order>> getOrders() async {
    // Fetch orders from the server
    Future.delayed(Duration(seconds: 2));
    return getOrderList;
  }

  static Future<Order> createOrder(Order order) async {
    // Create order on the server
    Future.delayed(Duration(seconds: 2));
    var uuid = Uuid();
    order.item = uuid.v4();
    getOrderList.add(order);
    return order;
  }

  static Future<List<Order>> searchOrder(String name) async{
    Future.delayed(Duration(seconds: 2));
    return getOrderList.where((e) => e.itemName.contains(name)).toList();
  }

  static List<Order> get getOrderList => Constants.orderJson.map((e) => Order.fromJson(e)).toList();
}