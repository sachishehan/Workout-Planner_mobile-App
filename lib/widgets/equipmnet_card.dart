import 'package:flutter/material.dart';
import 'package:workout_plan/constants/colors.dart';

class EquipmentCard extends StatelessWidget {
  final String equipmentName;
  final String equipmentDescription;
  final String equipmentImageUrl;
  final int noOfMinutes;
  final double noOfCalories;
  const EquipmentCard({
    super.key, 
    required this.equipmentName, 
    required this.equipmentDescription, 
    required this.equipmentImageUrl, 
    required this.noOfMinutes, 
    required this.noOfCalories});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kCardBgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              equipmentName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Image.asset(equipmentImageUrl,
                fit: BoxFit.cover,
                width: 100,
                ),
                SizedBox(
                  width: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${noOfMinutes.toString()} Of Workout.",
                    style: TextStyle(
                      color: kSubPinkColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("${noOfCalories.toString()} Calories Burned.",
                    style: TextStyle(
                      color: kSubPinkColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(equipmentDescription,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: kMainBlackColor,
            ),
            )
          ],
        ),
      ),
    );
  }
}