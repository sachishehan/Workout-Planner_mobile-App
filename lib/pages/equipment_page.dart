import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_plan/constants/colors.dart';
import 'package:workout_plan/constants/responsive.dart';
import 'package:workout_plan/models/equipmnet_model.dart';
import 'package:workout_plan/widgets/equipmnet_card.dart';

class EquipmentDetailsPage extends StatefulWidget {
  final String equipmentTitle;
  final String quipmentDescription;
  final List<Equipment> equipmentList;

  const EquipmentDetailsPage({
    super.key, 
    required this.equipmentTitle, 
    required this.quipmentDescription, 
    required this.equipmentList});

  @override
  State<EquipmentDetailsPage> createState() => _EquipmentDetailsPageState();
}

class _EquipmentDetailsPageState extends State<EquipmentDetailsPage> {
   //date and time formatters
  final DateFormat formetter = DateFormat('EEEE , MMMM');
  final DateFormat dayFormat = DateFormat('dd');
  
  @override
  Widget build(BuildContext context) {
    DateTime now =DateTime.now();
    String formattedDate = formetter.format(now);
    String fomattedDay = dayFormat.format(now);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(" $formattedDate  $fomattedDay",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color :kSubtitleColor,
                    ),
                  ),
                  Text(
                  widget.equipmentTitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color :kMainBlackColor,
                    ),
                  ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              Text(
                widget.quipmentDescription,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: kMainBlackColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //grid
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing:kDefaultPadding,
                  mainAxisSpacing: kDefaultPadding,
                  childAspectRatio: 8/6,
                ), 
                itemCount: widget.equipmentList.length,
                itemBuilder: (context, index){
                  Equipment equipment = widget.equipmentList[index];
                  return AddEquipmentCard(
                    equipmentName: equipment.equipmentName, 
                    equipmentDescription: equipment.equipmentDescription, 
                    equipmentImageUrl: equipment.equipmentImageUrl, 
                    noOfMinutes: equipment.noOfMinutes, 
                    noOfCalories: equipment.noOfCalories,
                    );
                }
                ),
            ],
          ),
        ),
      ),
    );
  }
}