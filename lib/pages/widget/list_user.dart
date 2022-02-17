import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/cubit/page_cubit.dart';
import 'package:flutter_application_motionhack/model/transaction_model.dart';
import 'package:flutter_application_motionhack/model/user_hr_model.dart';
import 'package:flutter_application_motionhack/model/user_model.dart';
import 'package:flutter_application_motionhack/pages/detail_interview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListUser extends StatelessWidget {
  final TransactionModel userHr;

  const ListUser(this.userHr, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => DetailInterviewer(userHr)));
      },
      child: Container(
        margin: EdgeInsets.all(20),
        width: double.infinity,
        color: Colors.amber,
        child: Column(
          children: [
            Text(userHr.nameUser),
          ],
        ),
      ),
    );
  }
}
