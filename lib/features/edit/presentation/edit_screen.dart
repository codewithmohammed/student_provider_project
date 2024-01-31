import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_provider_project/provider/student_provider.dart';
import 'package:student_provider_project/utils/field_validators.dart';
import 'package:student_provider_project/widgets/custom_button.dart';
import 'package:student_provider_project/widgets/custom_text_form_field.dart';
import 'package:student_provider_project/widgets/profile_picture_stack.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final kwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Consumer<StudentProvider>(
              builder: (context, editStudentProvider, child) {
            return Form(
              key: editStudentProvider.editFormKey,
              child: editStudentProvider.editIsLoading
                  ? const CircularProgressIndicator()
                  : Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: ProfilePictureStack(
                            imageBytes: editStudentProvider.editImageBytes,
                            function: () {
                              editStudentProvider.editSelectImage();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: CustomTextFormField(
                            controller: editStudentProvider.editNameController,
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
                                    controller: editStudentProvider
                                        .editClassNumberController,
                                    textInputType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.join,
                                    label: 'Class',
                                    hint: '12th',
                                    isObscure: false,
                                    validator: validateClassNumber),
                              ),
                            ),
                            SizedBox(
                              width: kwidth / 2,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: CustomTextFormField(
                                    controller: editStudentProvider
                                        .editDivisionController,
                                    textInputType: TextInputType.emailAddress,
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
                              controller:
                                  editStudentProvider.editEmailController,
                              textInputType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.join,
                              label: 'Email',
                              hint: 'example@email.com',
                              isObscure: false,
                              validator: validateEmail),
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
                                        editStudentProvider.editAgeController,
                                    textInputType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.join,
                                    label: 'Age',
                                    hint: '13',
                                    isObscure: false,
                                    validator: validateAge),
                              ),
                            ),
                            SizedBox(
                              width: kwidth / 2,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: CustomTextFormField(
                                    controller: editStudentProvider
                                        .editPhoneNumberController,
                                    textInputType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.join,
                                    label: 'Phone Number',
                                    hint: '0123456789',
                                    isObscure: false,
                                    validator: validatePhoneNumber),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: CustomTextFormField(
                              controller:
                                  editStudentProvider.editStreetController,
                              textInputType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.join,
                              label: 'Street',
                              hint: 'Abu Dhabi',
                              isObscure: false,
                              validator: validateStreet),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 50,
                                width: kwidth / 2,
                                child: CustomButton(
                                  containerColor: Colors.green,
                                  isLoading: false,
                                  text: 'Submit',
                                  onTap: () async {
                                    if (editStudentProvider.currentStudentID ==
                                        null) {
                                      return;
                                    }
                                    await editStudentProvider
                                        .onSubmitForEditClicked(
                                            editStudentProvider
                                                .currentStudentID!)
                                        .then((value) =>
                                            Navigator.of(context).pop());
                                  },
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 50,
                                width: kwidth / 2,
                                child: CustomButton(
                                  containerColor: Colors.red,
                                  isLoading: false,
                                  text: 'Cancel',
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
            );
          }),
        ),
      ),
    );
  }
}
