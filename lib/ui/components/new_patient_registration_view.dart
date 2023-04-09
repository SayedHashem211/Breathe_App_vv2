import 'package:flutter/material.dart';

import '../screens/home/home_screen.dart';
import '../utils/dialog_utils.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class NewPatientRegistrationView extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  NewPatientRegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFormField(
              hintText: 'full name',
              prefixIcon: Icons.person,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'this field required';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFormField(
              hintText: 'mobile number',
              prefixIcon: Icons.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'this field required';
                }
                if (value.length > 11) {
                  return 'invalid mobile number';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFormField(
              hintText: 'Address',
              prefixIcon: Icons.location_city_outlined,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'this field required';
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 55,
              child: CustomButton(
                text: 'submit',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    DialogUtils.showProgressDialog(context, 'Loading...');
                    DialogUtils.showMessage(
                        context, 'patient registered Successfully ..!',
                        positiveActionTitle: 'Ok',
                        negativeActionTitle: 'Cancel', negativeAction: () {
                      return;
                    }, positiveAction: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomeScreen();
                          },
                        ),
                      );
                    });
                  }
                },
              )),
        ],
      ),
    );
  }
}
