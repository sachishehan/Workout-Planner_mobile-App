import 'package:flutter/material.dart';
import 'package:workout_plan/constants/colors.dart';
import 'package:workout_plan/constants/responsive.dart';
import 'package:workout_plan/data/exercise_data.dart';
import 'package:workout_plan/data/user_data.dart';
import 'package:workout_plan/models/exercise_model.dart';
import 'package:workout_plan/widgets/add_exercise_card.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {

  //import the user data
  final userData = user;
  //exerciseList
  final ExerciseList = ExerciseData().ExerciseList;
  // final allEquipments = EquipmentData().equipmentList;
  @override
  Widget build(BuildContext context) {
    var userData2 = userData;
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, ${userData2.fullName}",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: kMainBlackColor,
                    ),
                    ),
                    SizedBox(
                      height:15,
                    ),
                    Text(
                    "Lets Add Some Workouts and Equipment for today!",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: kMainColor,
                    ),
                  ),
                  SizedBox(
                      height:15,
                    ),
                    Text(
                    "All Exercise",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: kMainBlackColor,
                    ),
                  ),
                  SizedBox(
                      height:15,
                    ),

                    //list view to String Horizontally
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.37,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ExerciseList.length,
                        itemBuilder: (context,index){
                          Exercise exercise = ExerciseList[index];
                          return AddExerciseCard(
                            exerciseTitle: exercise.exerciseName, 
                            noOfMinutes: exercise.noOfMinutes, 
                            exerciseImageUrl: exercise.exerciseImageUrl,
                            isadded: userData.exerciseList.contains(exercise), 
                            isFavourtied: userData.favExerciseList.contains(exercise),
                            toggleAddExercise: () {
                              setState(() {
                                if(userData.exerciseList.contains(exercise)){
                                  userData.removeExercise(exercise);
                                  print(userData.exerciseList.length);
                                }else{
                                  userData.addExercise(exercise);
                                  print(userData.exerciseList.length);
                                }
                              });
                              
                             }, 
                             toggleAddFavExercise: () {
                              setState(() {
                                if(userData.favExerciseList.contains(exercise)){
                                  userData.removeFavExercise(exercise);
                                  print(userData.favExerciseList.length);
                                }else{
                                  userData.addFavExercise(exercise);
                                  print(userData.favExerciseList.length);
                                }
                              });
                             },   
                            );
                        }),
                    )
                ],
              ),
            ),
          ),
      ),
    );
  }
}