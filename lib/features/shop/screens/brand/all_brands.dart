
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/brand/t_brand_card.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/screens/brand/brand_products.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
appBar: const TAppBar(title: Text('Brand'),showBackArrow: true,),
body: SingleChildScrollView(
  child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
  child: Column(
    children: [
      //heading
      const TSectionHeading(title: 'Brands', showActionButton: false,),
      const SizedBox(height: TSizes.spaceBtwItems,),

      //brands
      TGridLayout(
        mainAxisExtent: 80,
        itemCount: 10, itemBuilder: (context, index) => TBrandCard(showBorder: true, onTap: () => Get.to(()=> const BrandProducts()))),



    ],
  ),
  
  ),
),
    );
  }
}