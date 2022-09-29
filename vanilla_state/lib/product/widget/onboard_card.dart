import 'package:flutter/material.dart';
import 'package:provider_deneme/future/onboard/onboard_model.dart';

class OnBoardCard extends StatelessWidget {
  const OnBoardCard({Key? key, required this.model}) : super(key: key);
  final OnBoardModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          model.title,
          style: Theme.of(context).textTheme.headline4,
        ),
        Text(
          model.description,
          style: Theme.of(context).textTheme.headline6,
        ),
        Image.asset(
          model.imageWithPath,
          width: 650,
          height: 650,
        )
      ],
    );
    
  }
}
