import 'package:ecommerce/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:ecommerce/common/widgets/texts/section_heading.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SHomeCategories extends StatelessWidget {
  const SHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: SSizes.defaultSpace),
      child: Column(
        children: [
          //reusable for many heading in app
          SSectionHeading(
            title: 'Popular Categories',
            showActionButton: false,
            textColor: Colors.white,
          ),
          const SizedBox(height: SSizes.spaceBtwItems),
    
          //categories
          SizedBox(
            height: 80,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return SVerticalImageText(
                  image: SImages.shoeIcon,
                  title: 'Shoes order',
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

