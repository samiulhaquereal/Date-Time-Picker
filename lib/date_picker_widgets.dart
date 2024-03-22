import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:primelcr/features/lc_create/controller/create_lc_controller.dart';
import '../../constand/color_string.dart';

class DatePickerWidget extends StatefulWidget {
  DatePickerWidget({
    super.key,
    required this.initialDate,
    required this.title,
    required this.date,
  });

  Rx<DateTime> initialDate;
  String title;
  String date;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final DateTime? datetime = await showDatePicker(
            context: context,
            initialDate: widget.initialDate.value,
            firstDate: DateTime.now(),
            lastDate: DateTime(3000));
        if (datetime != null){
          setState(() {
            widget.initialDate.value = datetime;
          });
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          suffixIcon: Icon(LineAwesomeIcons.calendar),
          suffixIconColor: tPrimaryColor2,
          labelText: widget.title,
          labelStyle: GoogleFonts.poppins(fontSize:7.sp,color:tBlackColor),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: tStokeColor),
              borderRadius: BorderRadius.circular(5.r)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.r)),
          contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.h),
        ),
        child: Text('${widget.date}'),
      ),
    );
  }
}