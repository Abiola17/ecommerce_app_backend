


import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/features/personalization/screens/controllers/controllers/user_controller.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/network/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

/// Variables

  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());


  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }


  //login
  Future<void> emailAndPasswordSignIn() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog(
          'Logging you in...', TImages.docerAnimation);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected){
      //Remove Loader
      TFullScreenLoader.stopLoading();
      return;
      }

      //form validation
      if (!loginFormKey.currentState!.validate()){
        //Remove Loader
      TFullScreenLoader.stopLoading();
      return;
      }

      //Save data if remember me is selected
      if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
  
      //register user in the firebase authentication & save user data in firebase
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(
          email.text.trim(), password.text.trim());

      //Remove Loader
      TFullScreenLoader.stopLoading();

      //move to verify email screen
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      //Remove Loader
      TFullScreenLoader.stopLoading();

      //Show some generic error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());

    } 
  }


  // Google sign in
  Future<void>  googleSignIn() async {
    try{
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.docerAnimation);

       //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected){
      //Remove Loader
      TFullScreenLoader.stopLoading();
      return;
      }

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoolgle();

      //save user record
      await userController.saveUserRecord(userCredentials);

      //Remove Loader
      TFullScreenLoader.stopLoading();

      //redirect
      AuthenticationRepository.instance.screenRedirect();

    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

}