import 'package:ecommerce/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:flutter/material.dart';

class SCurvedEdgesWidget extends StatelessWidget {
  const SCurvedEdgesWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      //used to create custom shape
      clipper: SCustomCurvedEdges(),
      child: child,
    );
  }
}
