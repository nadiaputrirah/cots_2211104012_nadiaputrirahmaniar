import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:cots_2211104012_nadiaputrirahmaniar/design_system/styles/color.dart';
import 'package:cots_2211104012_nadiaputrirahmaniar/design_system/styles/typograph.dart';
import 'package:cots_2211104012_nadiaputrirahmaniar/modules/routes/app_routes.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? validatePhoneNumber(String? value) {
    final phoneRegExp = RegExp(r'^\d{10,13}$');
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    } else if (!phoneRegExp.hasMatch(value)) {
      return 'Enter a valid phone number (10-13 digits)';
    }
    return null;
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      // Submit logic here
      print('Phone Number: ${_phoneController.text}');
      Get.snackbar(
        'Success',
        'Phone Number Submitted',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: ColorCollection.greenGojek,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorCollection.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorCollection.item),
          onPressed: () {
            Get.back(); // Ganti Navigator.pop dengan Get.back
          },
        ),
        title: Text('Login', style: AppTypography.h2),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter your registered phone number to log in',
                style: AppTypography.subhead2
                    .copyWith(color: ColorCollection.neutral600),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorCollection.neutral500),
                      borderRadius: BorderRadius.circular(8),
                      color: ColorCollection.neutral200,
                    ),
                    child: Text(
                      '+62',
                      style: AppTypography.h4
                          .copyWith(color: ColorCollection.item),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'Phone number',
                        hintStyle: AppTypography.subhead2
                            .copyWith(color: ColorCollection.neutral500),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: ColorCollection.neutral500),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: ColorCollection.greenGojek),
                        ),
                      ),
                      validator: validatePhoneNumber,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Handle "Issue with number?" action
                  },
                  child: Text(
                    'Issue with number?',
                    style: AppTypography.subhead2
                        .copyWith(color: ColorCollection.greenGojek),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.main); // Mengarahkan ke MainPage
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorCollection.greenGojek,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style:
                        AppTypography.h4.copyWith(color: ColorCollection.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
