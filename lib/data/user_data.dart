import 'package:workout_plan/models/equipmnet_model.dart';
import 'package:workout_plan/models/exercise_model.dart';
import 'package:workout_plan/models/user_model.dart';

User user = User(
  userId: "123456", 
  fullName: "John Doe", 
  genders: "Male", 
  address: "123 Mian St,City,Country", 
  age: 23, 
  description: "Fitness enthusiast", 
  exerciseList: [
    Exercise(
      id: 0, 
      exerciseName: "Push-Ups", 
      exerciseImageUrl: "assests/images/exercises/cobra.png", 
      noOfMinutes: 15, 
      completed: false,
    ),
    Exercise(
      id: 1, 
      exerciseName: "Squats", 
      exerciseImageUrl: "assests/images/exercises/donward_facing.png", 
      noOfMinutes: 20, 
      completed: false,
    ),
  ], 
  equipmentList: [
    Equipment(
      id: 0, 
      equipmentName: "Dumbells", 
      equipmentDescription: "A pair of dumbbells for strength training exercises.", 
      equipmentImageUrl: "assests/images/equipments/dumbbell.png", 
      noOfMinutes: 30, 
      noOfCalories: 2, 
      handOvered: false,
      ),
      Equipment(
      id: 1, 
      equipmentName: "Resistance Bands", 
      equipmentDescription: "Elastic bands used for resistance exercises.", 
      equipmentImageUrl: "assests/images/equipments/checklist.png", 
      noOfMinutes: 20, 
      noOfCalories: 15, 
      handOvered: false,
      ),
  ], 
  favExerciseList: [
     Exercise(
      id: 1, 
      exerciseName: "Squats", 
      exerciseImageUrl: "assests/images/exercises/donward_facing.png", 
      noOfMinutes: 20, 
      completed: false,
    ),
  ], 
  favEquipmentList: [
    Equipment(
      id: 1, 
      equipmentName: "Resistance Bands", 
      equipmentDescription: "Elastic bands used for resistance exercises.", 
      equipmentImageUrl: "assests/images/equipments/checklist.png", 
      noOfMinutes: 20, 
      noOfCalories: 15, 
      handOvered: false,
      ),
    ],
  );