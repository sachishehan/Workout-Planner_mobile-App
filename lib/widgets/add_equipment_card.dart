import 'package:flutter/material.dart';
import 'package:workout_plan/constants/colors.dart';
import 'package:workout_plan/constants/responsive.dart';

class AddEquipmentCard extends StatefulWidget {
  final String equipmentName;
  final String equipmentImageUrl;
  final String equipmentDescription;
  final int noOfMinutes;
  final double noOfCalories;
  const AddEquipmentCard({
    super.key, 
    required this.equipmentName, 
    required this.equipmentImageUrl, 
    required this.noOfMinutes, 
    required this.noOfCalories, 
    required this.equipmentDescription
    }
    );

  @override
  State<AddEquipmentCard> createState() => _AddEquipmentCardState();
}

class _AddEquipmentCardState extends State<AddEquipmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: kCardBgColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 2,
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding,horizontal: kDefaultPadding*2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.equipmentName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kMainBlackColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  widget.equipmentImageUrl,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.equipmentDescription,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: kSubtitleColor,
                      ),
                      ),
                      Text("Time: ${widget.noOfMinutes.toString()} min and ${widget.noOfCalories.toString()} Calories burned",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: kSubtitleColor,
                      ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kSubtitleColor.withOpacity(0.5),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                      },
                      icon: Icon(
                        Icons.add,
                        size: 30,
                        color: kMainDarkBlueColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kSubtitleColor.withOpacity(0.5),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                      },
                      icon: Icon(
                        Icons.favorite_border,
                        size: 30,
                        color: kMainPinkColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
          ],
        ),
      ),
    );
  }
}