import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_provider_project/features/edit/presentation/edit_screen.dart';
import 'package:student_provider_project/features/view/presentation/student_view.dart';
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
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return StudentView(
                                studentModel: studentModel,
                              );
                            },
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[350],
                                boxShadow: const [
                                  BoxShadow(blurRadius: 5, spreadRadius: 2)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              shape: BoxShape.rectangle,
                                              color: Colors.white),
                                        ),
                                        Container(
                                          height: 75,
                                          width: 75,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              shape: BoxShape.rectangle,
                                              color: Colors.red,
                                              image: DecorationImage(
                                                  image: MemoryImage(
                                                      studentModel
                                                          .profilePicture))),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        TextButton.icon(
                                          onPressed: () {
                                            studentProvider.assignStudentData(
                                                studentModel);
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) {
                                                return const EditScreen();
                                              },
                                            ));
                                          },
                                          icon: const Icon(Icons.edit),
                                          label: const Text('Edit'),
                                        ),
                                        TextButton.icon(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'Delete ${studentModel.name}'),
                                                  content: const Text(
                                                      'are you sure you want to delete this student'),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () async {
                                                        await studentProvider
                                                            .deleteStudent(
                                                                studentModel
                                                                    .studentID);
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: const Text('Yes'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child:
                                                          const Text('Close'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                          label: const Text(
                                            'Delete',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Name:${studentModel.name}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    Text(
                                        'Class:${studentModel.classNumber} ,Div:${studentModel.division}',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            overflow: TextOverflow.ellipsis))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
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
