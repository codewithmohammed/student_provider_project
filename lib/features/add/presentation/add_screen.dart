import 'package:flutter/material.dart';
import 'package:student_provider_project/provider/student_provider.dart';
import 'package:student_provider_project/utils/field_validators.dart';
import 'package:student_provider_project/widgets/profile_picture_stack.dart';
import 'package:student_provider_project/widgets/custom_button.dart';
import 'package:student_provider_project/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final kwidth = MediaQuery.of(context).size.width;
    return ScaffoldMessenger(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Consumer<StudentProvider>(
              builder: (context, addStudentProvider, child) {
                return Form(
                  key: addStudentProvider.addFormKey,
                  child: addStudentProvider.addIsLoading
                      ? const CircularProgressIndicator()
                      : Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: ProfilePictureStack(
                                  imageBytes: addStudentProvider.addImageBytes,
                                  function: () {
                                    addStudentProvider.addSelectImage();
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: CustomTextFormField(
                                controller: addStudentProvider.nameController,
                                textInputType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.join,
                                label: 'Name',
                                hint: 'Name',
                                isObscure: false,
                                validator: (string) {
                                  return null;
                                },
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: kwidth / 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    child: CustomTextFormField(
                                      controller: addStudentProvider
                                          .classNumberController,
                                      textInputType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.join,
                                      label: 'Class',
                                      hint: '12',
                                      isObscure: false,
                                      validator: validateClassNumber,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: kwidth / 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    child: CustomTextFormField(
                                        controller: addStudentProvider
                                            .divisionController,
                                        textInputType:
                                            TextInputType.emailAddress,
                                        textInputAction: TextInputAction.join,
                                        label: 'Division',
                                        hint: 'G',
                                        isObscure: false,
                                        validator: validateDivision),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: CustomTextFormField(
                                controller: addStudentProvider.emailController,
                                textInputType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.join,
                                label: 'Email',
                                hint: 'example@email.com',
                                isObscure: false,
                                validator: validateEmail,
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: kwidth / 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    child: CustomTextFormField(
                                      controller:
                                          addStudentProvider.ageController,
                                      textInputType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.join,
                                      label: 'Age',
                                      hint: '13',
                                      isObscure: false,
                                      validator: validateAge,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: kwidth / 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    child: CustomTextFormField(
                                      controller: addStudentProvider
                                          .phoneNumberController,
                                      textInputType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.join,
                                      label: 'Phone Number',
                                      hint: '0123456789',
                                      isObscure: false,
                                      validator: validatePhoneNumber,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: CustomTextFormField(
                                controller: addStudentProvider.streetController,
                                textInputType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.join,
                                label: 'Street',
                                hint: 'Abu Dhabi',
                                isObscure: false,
                                validator: validateStreet,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 50,
                                width: kwidth / 2,
                                child: CustomButton(
                                  containerColor: Colors.green,
                                  isLoading: addStudentProvider.addIsLoading,
                                  text: 'Submit',
                                  onTap: () async {
                                    await addStudentProvider.onSubmitClicked();

                                    SnackBar snackBar = SnackBar(
                                      content: const Text(
                                          'The Student is Added',
                                          style: TextStyle(fontSize: 20)),
                                      backgroundColor: Colors.indigo,
                                      dismissDirection: DismissDirection.up,
                                      behavior: SnackBarBehavior.floating,
                                      margin: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height -
                                              150,
                                          left: 10,
                                          right: 10),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
