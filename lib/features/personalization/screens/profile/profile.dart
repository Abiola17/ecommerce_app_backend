import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/images/t_circular_image.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/personalization/screens/controllers/controllers/user_controller.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: Text('Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(
                        image: TImages.user, width: 50, height: 50),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Change Profile Picture'))
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                  onPressed: () => Get.to(() => const ChangeName()),
                  title: 'Name',
                  value: controller.user.value.fullName),
              TProfileMenu(
                onPressed: () {},
                title: 'Username',
                value: controller.user.value.username,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const TSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'User ID',
                value: controller.user.value.id,
                icon: Iconsax.copy,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'E-mail',
                value: controller.user.value.email,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Gender',
                value: 'Male',
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Date of Birth',
                value: '17th Aug., 2001',
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TextButton(
                onPressed: () => controller.deleteAccountWarningPopup(),
                child: const Text(
                  'Close Account',
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
