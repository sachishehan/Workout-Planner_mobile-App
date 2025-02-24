import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:workout_plan/constants/colors.dart';
import 'package:workout_plan/constants/responsive.dart';
import 'package:workout_plan/data/user_data.dart';
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
                ],
              ),
            ),
          ),
        ),
    );
  }
}