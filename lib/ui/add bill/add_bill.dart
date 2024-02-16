import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled1/resouces/colors.dart';
import 'package:untitled1/resouces/text.dart';
import 'package:untitled1/ui/homepage.dart';

class AddBill extends StatefulWidget {
  const AddBill({super.key});

  @override
  State<AddBill> createState() => _AddBillState();
}

class _AddBillState extends State<AddBill> {

  final TextEditingController _dateTimeController = TextEditingController();
  final TextEditingController _addressNameController = TextEditingController();
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _advancedRentController = TextEditingController();
  final TextEditingController _totalRentController = TextEditingController();
  final TextEditingController _pendingRentController = TextEditingController();
  DateTime? picked;

  void addBillToFirestore(String addressName,
  String items,
  String advancedRent,
      String totalRent,
      String pendingRent,
      String dateTime) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      await firestore.collection('Bill').add({
        // 'id':widget.catId,
        'date': dateTime,
        'address':addressName,
        'items':items,
        'advanced':advancedRent,
        'totalRent':totalRent,
        'pendingRent':pendingRent,
        'time ': DateTime.now(),
        // Add more fields related to the category if needed
      });

      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage(),));
    } catch (e) {
      if (kDebugMode) {
        print('Error adding bill: $e');
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    picked = await showDatePicker(
      context: context,
      initialDate:(picked==null)
                      ?DateTime.now()
                      : picked as DateTime,
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );
    // startOfDay = DateTime(picked!.year, picked!.month, picked!.day);
    // endOfDay = startOfDay!.add(const Duration(days: 1));
    if(picked !=null){
      String formattedDate = DateFormat('dd-MM-yyyy').format(picked!);
      _dateTimeController.text=formattedDate!.toString();
    }
    setState(() {
    });
  }

  @override
  void initState() {
    _dateTimeController.text = "";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText.semiBold("Add Bill",size: 18),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            children: [
              const SizedBox(height: 30,),
              TextField(
                controller: _dateTimeController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Choose order Date',
                  labelStyle: TextStyle(
                      color: AppColor.primary
                  ),
                  border: OutlineInputBorder(),
                ),
                onTap: (){
                  _selectDate(context);
                },
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: _addressNameController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  labelStyle: TextStyle(
                    color: AppColor.primary
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                maxLines: 4,
                controller: _itemController,
                decoration: const InputDecoration(
                  labelText: 'Item Names',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: _totalRentController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Total Rent',
                  border: OutlineInputBorder(),
                  prefixText: "₹ "
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: _advancedRentController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Advanced Rent',
                  border: OutlineInputBorder(),
                    prefixText: "₹ "
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: _pendingRentController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Pending Rent',
                  border: OutlineInputBorder(),
                    prefixText: "₹ "
                ),
              ),
              const SizedBox(height: 60,),
              ElevatedButton(
                  onPressed: (){
                    String addressName = _addressNameController.text.trim();
                    String items = _itemController.text.trim();
                    String advancedRent = _advancedRentController.text.trim();
                    String totalRent = _totalRentController.text.trim();
                    String pendingRent = _pendingRentController.text.trim();
                    String dateTime = _dateTimeController.text.trim();
                    if(addressName.isNotEmpty &&
                        items.isNotEmpty &&
                        advancedRent.isNotEmpty&&
                        totalRent.isNotEmpty &&
                        pendingRent.isNotEmpty &&
                        dateTime.isNotEmpty)
                    {
                      addBillToFirestore(addressName, items, advancedRent, totalRent, pendingRent, dateTime);
                      _dateTimeController.clear();
                      _addressNameController.clear();
                      _itemController.clear();
                      _advancedRentController.clear();
                      _totalRentController.clear();
                      _pendingRentController.clear();
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('data added successfully.')));
                    }
                  },
                  child: const SizedBox(
                    height: 30,
                    width: double.infinity,
                    child: Center(
                      child: CommonText.semiBold("Add bill",color: AppColor.white,size: 18,),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
