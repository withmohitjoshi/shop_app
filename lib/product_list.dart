import 'package:flutter/material.dart';
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/product_card.dart';
import 'package:shop_app/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All', 'Addidas', 'Nike', 'Bata'];

  late String selectedFilter;

  @override
  void initState() {
    selectedFilter = filters[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black54,
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(
          32,
        ),
      ),
    );
    return SafeArea(
      child: Column(
        children: [
          // Header of shop app
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Shoes\nCollection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                  child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
                ),
              ))
            ],
          ),
          // brand filters
          SizedBox(
            height: 120,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                        backgroundColor: selectedFilter == filter
                            ? Theme.of(context).colorScheme.primary
                            : const Color.fromRGBO(245, 247, 249, 1),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        label: Text(filter),
                        labelStyle: const TextStyle(
                          fontSize: 16,
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          // products cards
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ProductDetailsPage(product: product);
                    }));
                  },
                  child: ProductCard(
                    price: product['price'] as double,
                    title: product['title'] as String,
                    image: product['imageUrl'] as String,
                    backgroudColor: index.isEven
                        ? const Color.fromRGBO(216, 240, 253, 1)
                        : const Color.fromRGBO(245, 247, 249, 1),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
