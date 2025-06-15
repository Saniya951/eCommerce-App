import 'package:ecommerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerce/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class SPrimaryHeaderContainer extends StatelessWidget {
  const SPrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SCurvedEdgesWidget(
      child: Container(
        color: SColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: SCircularContainer(
                  backgroundColor: SColors.textWhite.withAlpha(25),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: SCircularContainer(
                  backgroundColor: SColors.textWhite.withAlpha(25),
                ),
              ),

              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
