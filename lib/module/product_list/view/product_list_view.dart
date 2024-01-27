import 'package:flutter/material.dart';
import 'package:latihan_service_model/core.dart';
import 'package:latihan_service_model/model/product.dart';
import '../controller/product_list_controller.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  Widget build(context, ProductListController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: const Text("ProductList"),
        actions: [
          IconButton(
            onPressed: () => controller.addProduct(),
            icon: const Icon(
              Icons.add,
              size: 24.0,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: controller.products.length,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            var item = controller.products[index];
            var product = Product.fromJson(item);
            return Card(
              child: ListTile(
                // title: Text(item["product_name"].toString()),
                title: Text(product.productName ?? "-"),
                // subtitle: Text(item["date"]),
                subtitle: Text(product.time.toString()),
                onTap: () => controller.deleteProduct(item["id"]),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  State<ProductListView> createState() => ProductListController();
}
