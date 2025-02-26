import 'package:flutter/material.dart';
import 'package:workout_plan/constants/colors.dart';
import 'package:workout_plan/constants/responsive.dart';

class AddExerciseCard extends StatefulWidget {

  final String exerciseTitle;
  final String exerciseImageUrl;
  final int noOfMinutes;
  final bool isadded;
  final bool isFavourtied;
  final void Function() toggleAddExercise;
  final void Function() toggleAddFavExercise;
  const AddExerciseCard({
    super.key, 
    required this.exerciseTitle,  
    required this.noOfMinutes, 
    required this.exerciseImageUrl, 
    required this.toggleAddExercise, 
    required this.isadded, 
    required this.toggleAddFavExercise,
    required this.isFavourtied, 
    });

  @override
  State<AddExerciseCard> createState() => _AddExerciseCardState();
}

class _AddExerciseCardState extends State<AddExerciseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: kCardBgColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 2,
          ),
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.exerciseTitle,
              style: TextStyle(
                fontSize: 18,
                fontWeight:FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset(
              widget.exerciseImageUrl,
            width: 100,
            fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${widget.noOfMinutes.toString()} Minuites",
              style: TextStyle(
                fontSize: 16,
                color: kSubtitleColor,
              ),
            ),
            SizedBox(
            height: 10,
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
                        widget.toggleAddExercise();
                      },
                      icon: Icon(
                        widget.isadded ? Icons.remove : Icons.add,
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
                        widget.toggleAddFavExercise();
                      },
                      icon: Icon(
                        widget.isFavourtied ? Icons.favorite : Icons.favorite_border,
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