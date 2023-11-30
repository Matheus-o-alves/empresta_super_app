import 'package:empresta_super_app/presentation/presenters/home_page_store.dart';
import 'package:empresta_super_app/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

Widget makeHomePage() {
  final homePageStore = GetIt.instance<HomePageStore>();

  return HomePage(
    store: homePageStore,
  );
}
