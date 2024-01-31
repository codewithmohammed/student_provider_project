import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_provider_project/features/search/widgets/grid_container.dart';
import 'package:student_provider_project/provider/student_provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final kwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Consumer<StudentProvider>(
          builder: (context, studentProvider, child) {
            return Column(
              children: [
                TextField(
                  style: const TextStyle(color: Colors.white),
                  // controller: searchController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade700,
                      prefixIcon: const Icon(CupertinoIcons.search),
                      // prefixIconColor: AppColors.white,
                      hintText: 'Search for students',
                      hintStyle: const TextStyle(
                          // color: AppColors.greylight1,
                          ),
                      suffixIconColor: Colors.white,
                      border: InputBorder.none),
                  onChanged: (value) {
                    studentProvider.runFilter(value);
                  },
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount:
                        studentProvider.studentfoundStudentsModels.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final studentModel =
                          studentProvider.studentfoundStudentsModels[index];
                      // print(studentModel.name);
                      return GridContainer(studentModel: studentModel);
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
