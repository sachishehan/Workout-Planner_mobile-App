import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:workout_plan/constants/colors.dart';
import 'package:workout_plan/constants/responsive.dart';
import 'package:workout_plan/data/equipment_data.dart';
import 'package:workout_plan/data/exercise_data.dart';
import 'package:workout_plan/data/user_data.dart';
import 'package:workout_plan/pages/exercise_details_page.dart';
import 'package:workout_plan/widgets/exercise_card.dart';
import 'package:workout_plan/widgets/pogress_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //date and time formatters
  final DateFormat formetter = DateFormat('EEEE , MMMM');
  final DateFormat dayFormat = DateFormat('dd');

  //user data
  final userDate = user;

  //exercise and equipment data
  final exerciseList =ExerciseData().ExerciseList;
  final equipmentList =EquipmentData().equipmentList;


  @override
  Widget build(BuildContext context) {
    DateTime now =DateTime.now();
    String formattedDate = formetter.format(now);
    String fomattedDay = dayFormat.format(now);

    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
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
                  "${userDate.fullName}.",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color :kMainBlackColor,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ProgressCard(
                    progressValue: 0.6,
                    total: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Today's Activity",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                   SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context, MaterialPageRoute(builder: (context) =>
                            ExerciseDetailsPage(
                              exerciseTitle: "Warmup", 
                              exerciseDescription: "Warmup is a method of preparing the body for exercise or sports by increasing the heart rate and warming the muscles. It is a simple exercise that helps to increase the blood flow to the muscles and prepare them for physical activity.", 
                              exerciseList: exerciseList),
                              ),
                            );
                        },
                        child: ExerciseCard(
                          description: "See more..",
                          imageUrl: "assests/images/exercises/cobra.png",
                          title: "Warmup",
                        ),
                      ),
                      ExerciseCard(
                        description: "See more..",
                        imageUrl: "assests/images/equipments/dumbbells2.png",
                        title: "Equipments",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ExerciseDetailsPage(exerciseTitle: "Exercise", exerciseDescription: "Warmup is a method of preparing the body for exercise or sports by increasing the heart rate and warming the muscles. It is a simple exercise that helps to increase the blood flow to the muscles and prepare them for physical activity.", exerciseList: exerciseList),),);
                        },
                        child: ExerciseCard(
                          description: "See more..",
                          imageUrl: "assests/images/exercises/triangle.png",
                          title: "Exercise",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ExerciseDetailsPage(exerciseTitle: "Streching", exerciseDescription: "Warmup is a method of preparing the body for exercise or sports by increasing the heart rate and warming the muscles. It is a simple exercise that helps to increase the blood flow to the muscles and prepare them for physical activity.", exerciseList: exerciseList)));
                        },
                        child: ExerciseCard(
                          description: "See more..",
                          imageUrl: "assests/images/exercises/yoga.png",
                          title: "Stretching",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}