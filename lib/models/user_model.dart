import 'package:workout_plan/models/equipmnet_model.dart';
import 'package:workout_plan/models/exercise_model.dart';

class User{
  final String userId;
  final String fullName;
  final String genders;
  final String address;
  final int age;
  final String description;
  int totalExerciseCompleted = 0;
  int totalequipmentsHandOvered = 0;

  final List<Exercise>exerciseList;
  final List<Equipment>equipmentList;

  final List<Exercise> favExerciseList;
  final List<Equipment>favEquipmentList;

  User({
    required this.userId, 
    required this.fullName, 
    required this.genders, 
    required this.address, 
    required this.age, 
    required this.description, 
    required this.exerciseList, 
    required this.equipmentList, 
    required this.favExerciseList, 
    required this.favEquipmentList
  }

  );
}