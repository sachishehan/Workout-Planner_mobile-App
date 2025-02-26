import 'package:flutter/material.dart';
import 'package:workout_plan/constants/colors.dart';

class AddEquipmentCard extends StatefulWidget {
  const AddEquipmentCard({super.key});

  @override
  State<AddEquipmentCard> createState() => _AddEquipmentCardState();
}

class _AddEquipmentCardState extends State<AddEquipmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: kCardBgColor,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}