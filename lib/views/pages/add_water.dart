import 'package:flutter/material.dart';

import 'package:ihydrate_application/provider/water.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class AddWaterData extends StatefulWidget {
  const AddWaterData({super.key});

  @override
  State<AddWaterData> createState() => _AddWaterdataState();
}

class _AddWaterdataState extends State<AddWaterData> {
  void showAlert(BuildContext context) {
    QuickAlert.show(
        context: context, type: QuickAlertType.error, title: 'Add Water');
  }

  final _formkey = GlobalKey<FormState>();

  final _nameditingController = TextEditingController();
  final _texteditingcontroller = TextEditingController();

  // DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 76, 192, 187),
            title: const Text('Add Water')),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: ListTile(
                          subtitle: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter ml';
                              }
                              return null;
                            },
                            controller: _nameditingController,
                            keyboardType: TextInputType.number,
                            maxLength: 4,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              hintText: 'Add ml....',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(12)),
                  Row(children: [
                    Expanded(
                        flex: 5,
                        child: ListTile(
                            subtitle: TextFormField(
                          maxLines: 3,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please add notes';
                            }
                            return null;
                          },
                          controller: _texteditingcontroller,
                          maxLength: 12,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            hintText: 'Add note....',
                          ),
                        ))),
                    ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          Navigator.pop(context);

                          // showTopSnackbar(context);
                          int intValue = int.parse(_nameditingController.text);
                          context.read<WaterProivder>().adddata(
                              noteditingController: _nameditingController.text,
                              watereditingContoller: intValue);
                          // Provider.of<WaterProivder>(
                          //   context,
                          // ).adddata(
                          //     texteditingcontroller: intValue,
                          //     nameditingController:
                          //         _texteditingcontroller.text);

                          _nameditingController.clear();
                          _texteditingcontroller.clear();
                        } else {
                          showAlert(context);
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(
                          //         content: Text('please enter detiles')));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 70, 175, 178),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 15.0,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'SAVE',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ]));
  }

  // void showTopSnackbar(BuildContext context) {
  //   Flushbar(
  //     animationDuration: const Duration(milliseconds: 500),
  //     icon: const Icon(Icons.check_circle, color: Colors.white),
  //     shouldIconPulse: false,
  //     duration: const Duration(seconds: 1),
  //     padding: const EdgeInsets.all(15),
  //     flushbarPosition: FlushbarPosition.TOP,
  //     margin: const EdgeInsets.all(20),
  //     borderRadius: const BorderRadius.all(Radius.circular(24)),
  //     backgroundGradient: const LinearGradient(
  //       colors: [Colors.lightBlue, Colors.white],
  //     ),
  //     message: 'Success',
  //   ).show(context).then((value) {});
  // }
}
