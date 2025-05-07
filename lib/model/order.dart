import 'package:flutter/material.dart';
import 'package:mobile_assignment_1/model/product.dart';

class Order {
  int quantity = 0;
  double totalPrice = 0.0;
  String orderName = '';
  List<Order> items = [];

  Order(this.quantity, this.totalPrice, this.orderName);

  void addItem(Order item) {
    items.add(item);
  }

  void removeItem(Order item) {
    items.remove(item);
  }

  double calculateTotalPrice() {
    double total = 0.0;
    for (var item in items) {
      total += item.totalPrice;
    }
    return total;
  }
}
