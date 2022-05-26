import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SimpleText extends StatelessWidget {
  final String text;
  final Color color;
  const SimpleText({
    Key? key,
    this.color = Colors.black,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: GoogleFonts.ubuntu(
        fontSize: 11.sp,
        color: color,
      ),
    );
  }
}
final ksize1 = SizedBox(
  height: 1.h,
);

final ksize3 = SizedBox(
  height: 3.h,
);

final ksize5 = SizedBox(
  height: 5.h,
);



final ksize7 = SizedBox(
  height: 7.h,
);

final ksize10 = SizedBox(
  height: 10.h,
);

final kboxDecoration1 = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    border: Border.all(color: Colors.green[900]!));
