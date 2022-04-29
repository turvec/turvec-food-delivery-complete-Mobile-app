import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;

  const ExpandableTextWidget({ Key? key, required this.text}) : super(key: key);

  @override
  _ExpandableTextWidgetState createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secoundHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight/5.63;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.text.length>textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secoundHalf = widget.text.substring(textHeight.toInt()+ 1, widget.text.length);
    }else{
      firstHalf = widget.text;
      secoundHalf = "";
    }
  }

   @override
   Widget build(BuildContext context) {
       return Container(
         child: secoundHalf.isEmpty?SmallText(height: 1.8,color: AppColors.paraColor,size: Dimensions.font16,text: firstHalf) : Column(
           children: [
             SmallText(text: hiddenText?(firstHalf+"..."):(firstHalf+secoundHalf), size: Dimensions.font16, color: AppColors.paraColor, height: 1.8,),
             InkWell(
               onTap: () {
                 setState(() {
                   hiddenText= !hiddenText;
                 });
               },
               child: Row(
                 children: [
                   SmallText(text: hiddenText?"Show more" : "Show less", color: AppColors.mainColor,),
                   Icon(hiddenText?Icons.arrow_drop_down : Icons.arrow_drop_up , color: AppColors.mainColor,)
                 ],
               ),
             )
           ],
         ),
       );
  }
}