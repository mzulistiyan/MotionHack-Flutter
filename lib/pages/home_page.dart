import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/cubit/auth_cubit.dart';
import 'package:flutter_application_motionhack/cubit/coba_cubit.dart';
import 'package:flutter_application_motionhack/cubit/humanresources_cubit.dart';
import 'package:flutter_application_motionhack/cubit/transaction_cubit.dart';
import 'package:flutter_application_motionhack/model/transaction_model.dart';
import 'package:flutter_application_motionhack/model/user_hr_model.dart';
import 'package:flutter_application_motionhack/model/user_model.dart';
import 'package:flutter_application_motionhack/pages/widget/list_hr_card.dart';
import 'package:flutter_application_motionhack/pages/widget/list_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    // TODO: implement initState

    context.read<HumanresourcesCubit>().fetchHumanResources();
    context.read<TransactionCubit>().fetchTransaction();
    context.read<CobaCubit>().fetchCoba();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget listHR(List<UserHrModel> userHr) {
      final List<UserHrModel> user;
      return Container(
          child: Column(
        children: userHr.map((
          UserHrModel userHr,
        ) {
          return ListHr(userHr);
        }).toList(),
      ));
    }

    Widget listTransaction(List<TransactionModel> userId) {
      final List<TransactionModel> user;
      return Container(
          child: Column(
        children: userId.map((
          TransactionModel userId,
        ) {
          return ListUser(userId);
        }).toList(),
      ));
    }

    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocConsumer<HumanresourcesCubit, HumanresourcesState>(
                      listener: (context, state) {
                        // TODO: implement listener
                        if (state is HumanresourcesFailed) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(state.error),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is HumanresourcesSuccess) {
                          return Column(
                            children: [
                              listHR(state.humanresources),
                            ],
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        // TODO: implement listener
                        if (state is AuthFailed) {
                          print('Hallos');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(state.error),
                            ),
                          );
                        } else if (state is AuthInitial) {
                          print('Hallos');
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/sign-in', (route) => false);
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Container(
                          child: TextButton(
                            onPressed: () {
                              context.read<AuthCubit>().signOut();
                            },
                            child: Text('LOGOUT'),
                          ),
                        );
                      },
                    ),
                    BlocConsumer<CobaCubit, CobaState>(
                      listener: (context, state) {
                        // TODO: implement listener
                        if (state is CobaFailed) {
                          print('error');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(state.error),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is CobaSuccess) {
                          return Column(
                            children: [
                              Text('Hallos'),
                            ],
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                    BlocConsumer<TransactionCubit, TransactionState>(
                      listener: (context, state) {
                        // TODO: implement listener
                        if (state is TransactionFailed) {
                          print('error');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(state.error),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is TransactionSuccess) {
                          return Column(
                            children: [listTransaction(state.transactions)],
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
