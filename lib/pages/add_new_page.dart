import 'package:flutter/material.dart';
import 'package:workout_plan/constants/colors.dart';
import 'package:workout_plan/constants/responsive.dart';
import 'package:workout_plan/data/equipment_data.dart';
import 'package:workout_plan/data/exercise_data.dart';
import 'package:workout_plan/data/user_data.dart';
import 'package:workout_plan/models/equipmnet_model.dart';
import 'package:workout_plan/models/exercise_model.dart';
import 'package:workout_plan/widgets/add_equipment_card.dart';
import 'package:workout_plan/widgets/add_exercise_card.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({Key? key}) : super(key: key);

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  final userData = user;
  final allExercises = ExerciseData().exerciseList;
  final allEquipments = EquipmentData().equipmentList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, ${userData.fullName}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: kMainColor,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Let's Add Some Workouts and Equipment for today!",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: kGradientTopColor,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "All Exercises",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: kMainColor,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 270,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: allExercises.length,
                  itemBuilder: (context, index) {
                    Exercise exercise = allExercises[index];
                    return AddExerciseCard(
                      title: exercise.exerciseName,
                      image: exercise.exerciseImageUrl,
                      noOfMinutes: exercise.noOfMinuites.toString(),
                      showMore: false,
                      isAdded: userData.exerciseList.contains(exercise),
                      isFavorite: userData.favExerciseList.contains(exercise),
                      toggleAddExercise: () {
                        setState(() {
                          if (userData.exerciseList.contains(exercise)) {
                            userData.removeExercise(exercise);
                          } else {
                            userData.addExercise(exercise);
                          }
                          print(userData.exerciseList.length);
                        });
                      },
                      toggleAddFavoriteExercise: () {
                        setState(() {
                          if (userData.favExerciseList.contains(exercise)) {
                            userData.removeFavExercise(exercise);
                          } else {
                            userData.addFavExercise(exercise);
                          }
                          print(userData.favExerciseList.length);
                        });
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "All Equipments",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: kMainColor,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: allEquipments.length,
                  itemBuilder: (context, index) {
                    Equipment equipment = allEquipments[index];
                    return AddEquipments(
                      equipmentName: equipment.equipmentName,
                      equipmentImageUrl: equipment.equipmentImageUrl,
                      equipmentDescription: equipment.equipmentDescription,
                      noOfMinuites: equipment.noOfMinuites,
                      noOfCalories: equipment.noOfCalories,
                      isAdded: userData.equipmentList.contains(equipment),
                      isFavorite: userData.favEquipmentList.contains(equipment),
                      toggleAddEquipment: () {
                        setState(() {
                          if (userData.equipmentList.contains(equipment)) {
                            userData.removeEquipment(equipment);
                          } else {
                            userData.addEquipment(equipment);
                          }
                          print(userData.equipmentList.length);
                        });
                      },
                      toggleAddFavoriteEquipment: () {
                        setState(() {
                          if (userData.favEquipmentList.contains(equipment)) {
                            userData.removeFavEquipment(equipment);
                          } else {
                            userData.addFavEquipment(equipment);
                          }
                          print(userData.favEquipmentList.length);
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
