import 'package:ecommerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SChoiceShape extends StatelessWidget {
  const SChoiceShape({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = SHelperFunctions.getColor(text) != null;

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),//to make chip boxes color transparent 
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? SColors.white : null),
        avatar:
            isColor
                ? SCircularContainer(
                  width: 50,
                  height: 50,
                  backgroundColor: SHelperFunctions.getColor(text)!,
                )
                : null,
        shape: isColor ? CircleBorder() : null,
        backgroundColor: isColor ? SHelperFunctions.getColor(text)! : null,
        labelPadding:
            isColor ? EdgeInsets.all(0) : null, //for making item at center
        padding:
            isColor
                ? EdgeInsets.all(0)
                : null, //for making icon took complete space
        selectedColor: Colors.green,
      ),
    );
  }
}
