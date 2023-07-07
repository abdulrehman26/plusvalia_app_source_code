import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plusvalia/core/theme/app_colors.dart';

import 'package:plusvalia/screens/propiedad_screen/models/month_summary_model.dart';

class RevenueSummaryCard extends StatelessWidget {
  const RevenueSummaryCard({
    super.key,
    required this.leadingText,
    required this.suffixText,
    required this.monthsSummary,
  });

  final String leadingText;
  final String suffixText;
  final List<RevenueSummaryModel> monthsSummary;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 15, left: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.whiteSolid,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                leadingText,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              Text(
                suffixText,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(thickness: 1),
          SizedBox(height: 10),
          ...monthsSummary
              .map(
                (monthSummary) => Padding(
                  padding: const EdgeInsets.only(bottom: 33.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat.yMMM().format(monthSummary.date),
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: AppColors.independence.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        "\$" +
                            (monthSummary.total > 1000000
                                ? NumberFormat.compactCurrency(name: '')
                                    .format(monthSummary.total)
                                : NumberFormat.currency(name: '')
                                    .format(monthSummary.total)),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: monthSummary.indicatorColor,
                        ),
                      )
                    ],
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
