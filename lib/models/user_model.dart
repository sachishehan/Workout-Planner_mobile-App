import 'package:workout_plan/models/equipmnet_model.dart';
import 'package:workout_plan/models/exercise_model.dart';

class User {
  final String userId;
  final String fullName;
  final int age;
  final String gender;
  final String address;
  final String description;
  int totlaExercisesCompleted;
  int totlaEquipmentHandedOver;
  final List<Exercise> exerciseList;
  final List<Exercise> favExerciseList;
  final List<Equipment> equipmentList;
  final List<Equipment> favEquipmentList;

  User({
    required this.totlaExercisesCompleted,
    required this.totlaEquipmentHandedOver,
    required this.userId,
    required this.fullName,
    required this.age,
    required this.gender,
    required this.address,
    required this.description,
    required this.exerciseList,
    required this.equipmentList,
    required this.favExerciseList,
    required this.favEquipmentList,
  });

  // Method to add a new exercise to the user's exercise list
  void addExercise(Exercise exercise) {
    exerciseList.add(exercise);
  }

  // Method to add a new equipment to the user's equipment list
  void addEquipment(Equipment equipment) {
    equipmentList.add(equipment);
  }

  //add exercise to fav list
  void addFavExercise(Exercise exercise) {
    favExerciseList.add(exercise);
  }

  //remove exercise from  list
  void removeExercise(Exercise exercise) {
    exerciseList.remove(exercise);
  }

  //remove equipment from  list
  void removeEquipment(Equipment equipment) {
    equipmentList.remove(equipment);
  }

  //add equipment to fav list
  void addFavEquipment(Equipment equipment) {
    favEquipmentList.add(equipment);
  }

  //remove exercise from fav list
  void removeFavExercise(Exercise exercise) {
    favExerciseList.remove(exercise);
  }

  //remove equipment from fav list
  void removeFavEquipment(Equipment equipment) {
    favEquipmentList.remove(equipment);
  }

  // Method to mark an exercise as completed
  void markExerciseAsCompleted(int exerciseId) {
    final exercise =
        exerciseList.firstWhere((exercise) => exercise.id == exerciseId);
    exercise.completed = true;
    //remove exercise from list
    removeExercise(exercise);
    //increase total exercise completed
    totlaExercisesCompleted++;
  }

  // Method to mark an equipment as handed over
  void markEquipmentAsHandedOver(int equipmentId) {
    final equipment =
        equipmentList.firstWhere((equipment) => equipment.id == equipmentId);
    equipment.handOvered = true;
    //remove equipment from list
    removeEquipment(equipment);
    //increase total equipment handed over
    totlaEquipmentHandedOver++;
  }

  // Method to calculate the total number of calories burned by the user
  double calculateTotalCaloriesBurned() {
    double totalCaloriesBurned = 0;
    for (var exercise in exerciseList) {
      totalCaloriesBurned += exercise.noOfMinuites * 0.005;
    }
    for (var equipment in equipmentList) {
      totalCaloriesBurned += equipment.noOfMinuites * 0.005;
    }
    return totalCaloriesBurned;
  }

  // Method to calculate the total number of minutes spent by the user
  int calculateTotalMinutesSpent() {
    int totalMinutesSpent = 0;
    for (var exercise in exerciseList) {
      totalMinutesSpent += exercise.noOfMinuites;
    }
    for (var equipment in equipmentList) {
      totalMinutesSpent += equipment.noOfMinuites;
    }
    return totalMinutesSpent;
  }

  // Method to calculate the total number of exercises completed by the user
  int calculateTotalExercisesCompleted() {
    int totalExercisesCompleted = 0;
    for (var exercise in exerciseList) {
      if (exercise.completed) {
        totalExercisesCompleted++;
      }
    }
    return totalExercisesCompleted;
  }

  // Method to calculate the total number of equipment handed over by the user
  int calculateTotalEquipmentHandedOver() {
    int totalEquipmentHandedOver = 0;
    for (var equipment in equipmentList) {
      if (equipment.handOvered) {
        totalEquipmentHandedOver++;
      }
    }
    return totalEquipmentHandedOver;
  }
}
