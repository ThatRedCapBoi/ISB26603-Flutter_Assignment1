import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:mobile_assignment_1/model/order.dart';

class Sqlitedatabase {
  static Database? _db;
  static final Sqlitedatabase instance = Sqlitedatabase._constructor();

  final String tableName = 'orders';
  final String columnId = 'id';
  final String columnProductName = 'productName';
  final String columnProductPrice = 'productPrice';
  final String columnQuantity = 'quantity';
  final String columnImageUrl = 'imageUrl';

  Sqlitedatabase._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, 'orders.db');
    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $tableName (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnProductName TEXT NOT NULL,
            $columnProductPrice REAL NOT NULL,
            $columnQuantity INTEGER NOT NULL,
            $columnImageUrl TEXT NOT NULL
          )
        ''');
      },
    );
    return database;
  }

  void addOrder(Order order) async {
    final db = await database;
    await db.insert(
      tableName,
      {
        columnProductName: order.productName,
        columnProductPrice: order.productPrice,
        columnQuantity: order.quantity,
        columnImageUrl: order.imageUrl,
      },
      // conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Order>> getOrders() async {
    final db = await database;
    final data = await db.query(tableName);

    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(maps.length, (i) {
      return Order(
        id: maps[i][columnId],
        productName: maps[i][columnProductName],
        quantity: maps[i][columnQuantity],
        productPrice: maps[i][columnProductPrice],
        imageUrl: maps[i][columnImageUrl],
      );
    });
  }

  void updateOrder(Order order) async {
    final db = await database;
    await db.update(
      tableName,
      {
        columnProductName: order.productName,
        columnProductPrice: order.productPrice,
        columnQuantity: order.quantity,
        columnImageUrl: order.imageUrl,
      },
      where: '$columnId = ?',
      whereArgs: [order.id],
    );
  }

  void deleteOrder(int id) async {
    final db = await database;
    await db.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}
