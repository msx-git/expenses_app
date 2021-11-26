import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spentMoney;
  final double spentPctOfTotal;

  ChartBar(
    this.label,
    this.spentMoney,
    this.spentPctOfTotal,
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constrains) {
        return Column(
          children: [
            Container(
              height: constrains.maxHeight * 0.15,
              child:
                  FittedBox(child: Text('\$${spentMoney.toStringAsFixed(0)}')),
            ),
            SizedBox(height: constrains.maxHeight * 0.05),
            Container(
              height: constrains.maxHeight * 0.6,
              width: 10,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spentPctOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: constrains.maxHeight * 0.05),
            Container(
              height: constrains.maxHeight * 0.15,
              child: FittedBox(
                child: Text(
                  label,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
