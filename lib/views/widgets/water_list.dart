import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ihydrate_application/views/widgets/delete_data.dart';

import 'package:intl/intl.dart';

import '../../boxes/box.dart';
import '../../models/category/data_base.dart';

class WaterList extends StatefulWidget {
  const WaterList({super.key});

  @override
  State<WaterList> createState() => _WaterListState();
}

class _WaterListState extends State<WaterList> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm').format(now);
    return ValueListenableBuilder<Box<WaterModel>>(
        valueListenable: Boxes.getdata().listenable(),
        builder: (context, box, _) {
          final today = DateTime.now();
          final filter = box.values
              .where((element) =>
                  element.date.year == today.year &&
                  element.date.month == today.month &&
                  element.date.day == today.day)
              .toList();

          return box.length == 0
              ? Image.asset(
                  'lib/assets/images/107420-no-data-loader.gif',
                  height: 250,
                )
              : ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: ((context, index) => const Divider()),
                  itemCount: filter.length,
                  itemBuilder: (context, index) {
                    print(' this wayyy${filter[index].water}');
                    return Slidable(
                      startActionPane:
                          ActionPane(motion: const BehindMotion(), children: [
                        SlidableAction(
                          onPressed: (context) {
                            // showAlert(context);
                            delete(filter[index]);
                            // deletem(context);
                          },
                          icon: Icons.delete,
                          label: 'Delete',
                          backgroundColor: Colors.red,
                        )
                      ]),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: const Color.fromARGB(255, 93, 204, 255),
                        elevation: 7,
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: SizedBox(
                              height: 70,
                              width: 360,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'note:  ${filter[index].subtitle.toString()}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${filter[index].water.toString()} ml',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      (DateFormat("MMMM d").format(now)),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      formattedDate,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              )

                              // ),
                              ),
                        ),
                      ),
                    );
                  });
        });
  }
}
