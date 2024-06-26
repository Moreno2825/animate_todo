import 'package:flutter/material.dart';
import 'package:practic_todo/extensions/space_exs.dart';
import 'package:practic_todo/utils/app_colors.dart';
import 'package:practic_todo/utils/app_str.dart';
import 'package:practic_todo/views/home/widget/fab.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,

      /// FAB
      floatingActionButton: const Fab(),

      /// Body
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            /// Custom AppBar
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: double.infinity,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Progress indicator
                  const SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      value: 1 / 3,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
                    ),
                  ),
                  25.w,

                  /// Top level Task info
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStr.mainTitle,
                        style: textTheme.displayLarge,
                      ),
                      3.h,
                      Text(
                        "1 of 3 task",
                        style: textTheme.titleMedium,
                      )
                    ],
                  )
                ],
              ),
            ),

            /// Divider
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Divider(
                thickness: 2,
                indent: 100,
              ),
            ),

            Flexible(
              child: SizedBox(
                width: double.infinity,
                height: 745,
                child: ListView.builder(
                  itemCount: 20,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return AnimatedContainer(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            offset: const Offset(0, 4),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      duration: const Duration(milliseconds: 600),
                      child: ListTile(
                        /// Check Icon
                        leading: GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 600),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey, width: .8),
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        /// Task title
                        title: const Padding(
                          padding: EdgeInsets.only(bottom: 3, top: 3),
                          child: Text(
                            "Done",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        /// Task description
                        subtitle: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300,
                              ),
                            ),

                            /// Date of Task
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 10, top: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Date",
                                      style: TextStyle(color: Colors.grey, fontSize: 14),
                                    ),
                                    Text(
                                      "Subdate",
                                      style: TextStyle(color: Colors.grey, fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
