import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/cubit/page_cubit.dart';
import 'package:flutter_application_motionhack/model/transaction_model.dart';
import 'package:flutter_application_motionhack/model/user_hr_model.dart';
import 'package:flutter_application_motionhack/model/user_model.dart';
import 'package:flutter_application_motionhack/pages/detail_interview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ListHr extends StatelessWidget {
  final UserHrModel userHr;

  const ListHr(this.userHr, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      height: 164,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 16, left: 16),
            child: Row(
              children: [
                Image.asset(
                  'assets/profile1.png',
                ),
                SizedBox(
                  width: 9,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userHr.name,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Human Resource',
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Color(0xff9F9F9F)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 3,
            width: double.infinity,
            color: Color(0xffEBEBEB),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, left: 16, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Rp100.000 ',
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '/session',
                          style: GoogleFonts.poppins(
                              fontSize: 10, color: Color(0xff9F9F9F)),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 88,
                  height: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff68A5FF),
                  ),
                  child: Center(
                      child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailInterviewer(userHr)));
                    },
                    child: Text(
                      'Apply',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
