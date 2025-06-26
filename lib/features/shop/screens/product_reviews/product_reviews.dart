import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/products/ratings/rating_indicator.dart';
import 'package:ecommerce/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:ecommerce/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: SAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),

      //body
      body: SingleChildScrollView(
        padding: EdgeInsets.all(SSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ratings and reviews are verified and are from people who use the same type of device that you use',
            ),
            SizedBox(height: SSizes.spaceBtwItems),

            //overall product ratings
            SOverallProductRating(),
            SRatingBarIndicator(rating: 3.5),
            Text('12,611', style: Theme.of(context).textTheme.bodySmall),
            SizedBox(height: SSizes.spaceBtwSections),

            //User reviews list
            UserReviewCard(),
            UserReviewCard(),
          ],
        ),
      ),
    );
  }
}
