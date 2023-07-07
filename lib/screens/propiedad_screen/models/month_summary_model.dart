import 'package:flutter/material.dart';

class RevenueSummaryModel {
  DateTime date;
  num total;
  Color indicatorColor;
  RevenueSummaryModel({
    required this.date,
    required this.total,
    required this.indicatorColor,
  });
}
