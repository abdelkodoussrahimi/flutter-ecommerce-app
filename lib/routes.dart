import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:projct2/core/constant/routes.dart';
import 'package:projct2/test.dart';
import 'package:projct2/view/address/add.dart';
import 'package:projct2/view/address/adddetails.dart';
import 'package:projct2/view/address/view.dart';
import 'package:projct2/view/screen/auth/checkemail.dart';
import 'package:projct2/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:projct2/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:projct2/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:projct2/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:projct2/view/screen/auth/home.dart';
import 'package:projct2/view/screen/auth/homescreen.dart';
import 'package:projct2/view/screen/auth/items.dart';
import 'package:projct2/view/screen/auth/login.dart';
import 'package:projct2/view/screen/auth/myfavorite.dart';
import 'package:projct2/view/screen/auth/productdetails.dart';
import 'package:projct2/view/screen/auth/signup.dart';
import 'package:projct2/view/screen/auth/success_signup.dart';
import 'package:projct2/view/screen/auth/verifycodesignup.dart';
import 'package:projct2/view/screen/cart.dart';
import 'package:projct2/view/screen/checkout.dart';
import 'package:projct2/view/screen/onboarding.dart';
import 'package:projct2/view/screen/orders/archive.dart';
import 'package:projct2/view/screen/orders/details.dart';
import 'package:projct2/view/screen/orders/pending.dart';

import 'core/middleware/mymiddleware.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Onboarding(), middlewares: [MyMiddleWare()]),
//  GetPage(name: "/", page: () => const TestView()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const Onboarding()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  //
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myfavroite, page: () => const MyFavorite()),
  //cart
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  //address
  //
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),

  GetPage(
      name: AppRoute.addressadddetails, page: () => const AddressAddDetails()),
];
