import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

class Database {
  Future<void> connectToDatabase() async {
    try {
      final conn = PostgreSQLConnection(
        '192.168.163.2',
        5432,
        'boatdb',
        username: 'postgres',
        password: '123',
      );
      await conn.open();
      if (!conn.isClosed) { // Check if the connection is open
        print('Connected to PostgreSQL database');

        // Run the query to select all columns from the members table
        final results = await conn.query('SELECT * FROM members');

        // Print the results
        print('Members:');
        for (final row in results) {
          print('ID: ${row[0]}, Name: ${row[1]}, Email: ${row[2]}');
        }

        // Close the connection
        await conn.close();
        print('Connection closed');

      } else {
        print('Failed to connect to PostgreSQL database');
      }
    } catch (e) {
      print('Error connecting to PostgreSQL database: $e');
    }
  }
}