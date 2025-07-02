import 'package:b_store/app/constants/colors.dart';
import 'package:b_store/domain/widgets/button_widget.dart';
import 'package:b_store/domain/widgets/my_widgets.dart';
import 'package:flutter/material.dart';

class EditProfileRoute extends StatefulWidget {
  const EditProfileRoute({super.key});

  @override
  State<EditProfileRoute> createState() => _EditProfileRouteState();
}

class _EditProfileRouteState extends State<EditProfileRoute> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final zipController = TextEditingController();
  final phoneController = TextEditingController();

  bool isDefault = false;

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    cityController.dispose();
    zipController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyWidgets.buildAppBar(context,),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    _buildText(text: 'Name'),
                    _buildTextField(controller: nameController, hint: 'Name'),
                    const SizedBox(height: 12),
                    _buildText(text: 'Address'),
                    _buildTextField(controller: addressController, hint: 'Address'),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              _buildText(text: 'City'),
                              _buildTextField(controller: cityController, hint: 'City'),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildText(text: 'ZIP Code'),
                              _buildTextField(controller: zipController, hint: 'ZIP Code'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildText(text: 'Mobile Number'),
                    _buildTextField(controller: phoneController, hint: 'Mobile Number'),
                    CheckboxListTile(
                      // contentPadding: EdgeInsets.zero,
                      title: const Text('Set as default address'),
                      value: isDefault,
                      activeColor: AppColors.primaryColor,
                      onChanged: (value) => setState(() => isDefault = value ?? false),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: ButtonWidget(onTap: (){}, text: 'Next'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required TextEditingController controller, required String hint}) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.primaryColor,
      cursorWidth: 3,
      cursorHeight: 18,
      cursorOpacityAnimates: true,
      cursorRadius: Radius.circular(50),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: 13, color: AppColors.titleColor),
        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: AppColors.discountColor)),
        focusedBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(8) ,borderSide: BorderSide(color: AppColors.primaryColor)),
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(8) ,borderSide: BorderSide(color: AppColors.subTitleColor,)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColors.subTitleColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColors.discountColor,
            width: 1,
          ),
        ),
      ),
      validator: (value) => value == null || value.isEmpty ? 'Please enter $hint' : null,
    );
  }
  Widget _buildText({required String text}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Text(text, style:  TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.blackColor),),
    );
  }
}
