import 'package:flutter/material.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  // final userData = user;
  // final allExercises = ExerciseData().ExerciseList;
  // final allEquipments = EquipmentData().equipmentList;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Center(
              child: Text("Add New Page"),
            ),
          ),
      ),
    );
  }
}