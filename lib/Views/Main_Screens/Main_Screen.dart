import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_task/Controllers/Product_Controller.dart';
import 'package:youtube_task/Services/AuthService.dart';
import 'package:youtube_task/Views/Youtube_Screen.dart';

import 'Product_Tile.dart';

class Main_Screen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            ClipOval(
              child: Container(
                width: double.infinity,
                height: Get.height* 0.2,
                color: Colors.green,
                child: Center(
                  child: Text(
                    'Youtube Task',
                    style: GoogleFonts.pacifico()
                        .copyWith(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                thickness: 3,
                height: 3,
                color: Colors.green,
              ),
            ),
            TextButton.icon(
                onPressed: () => Get.to(Youtube_Screen()),
                icon: Icon(
                  Icons.video_collection,
                  color: Colors.red,
                ),
                label: Text(
                  'Watch Video',
                  style: TextStyle(color: Colors.black87),
                )),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton.icon(
                  onPressed: () async {
                    await AuthService().logoutUser();
                  },
                  icon: Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  label: Text(
                    'Logout',
                    style: TextStyle(color: Colors.black87),
                  )),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (productController.isLoading.value)
                  return Center(child: CircularProgressIndicator());
                else
                  return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: productController.productList.length,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return ProductTile(productController.productList[index]);
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  );
              }),
            )
          ],
        ),
      ),
    ));
  }
}
