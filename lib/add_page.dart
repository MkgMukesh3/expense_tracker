import 'package:expense_tracker/db/expenses_db.dart';
import 'package:expense_tracker/home_page.dart';
import 'package:expense_tracker/provider/add_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
      ),
      body:
          Consumer<AddPageProvider>(builder: (context, addPageProvider, child) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildTextFormField(
                  controller: addPageProvider.nameController,
                  labelText: 'Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enetr your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                _buildTextFormField(
                  controller: addPageProvider.amountController,
                  labelText: 'Amount',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter amount';
                    }
                    final amount = double.tryParse(value);
                    if (amount == null || amount <= 0) {
                      return 'Invalid amount';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                DropdownButtonFormField<String>(
                  value: addPageProvider.selectedCategory,
                  onChanged: (String? newValue) {
                    addPageProvider.setSelectedCategory(newValue);
                  },
                  items: addPageProvider.categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Category',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == 'Select Category') {
                      return 'Category is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () => _submitExpense(addPageProvider),
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    TextInputType? keyboardType,
    bool enabled = true,
    Function()? onTap,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.black54),
        ),
      ),
      keyboardType: keyboardType,
      enabled: enabled,
      onTap: onTap,
      validator: validator,
    );
  }

  void _submitExpense(AddPageProvider addPageProvider) async {
    if (_formKey.currentState!.validate()) {
      var resp = await ExpensesDB.createItems(
          addPageProvider.nameController.text,
          double.parse(addPageProvider.amountController.text),
          addPageProvider.selectedCategory,
          DateTime.now().toString());
      print("respData>>> $resp ");
      addPageProvider.clear();

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    }
  }
}
