import 'package:flutter/material.dart';
import 'package:quizzy/provider/question.dart';
import 'package:provider/provider.dart';

class CategoryPicker extends StatefulWidget {
  final Function itemPicker;
  const CategoryPicker(this.itemPicker, {super.key});
  @override
  State<CategoryPicker> createState() => _CategoryPickerState();
}

class _CategoryPickerState extends State<CategoryPicker> {
  late Future categoryFuture;
  var initialIndex = 0;
  @override
  void initState() {
    getJsonData();
    super.initState();
  }

  void getJsonData() {
    categoryFuture =
        Provider.of<Question>(context, listen: false).fetchCategory();
  }

  @override
  Widget build(BuildContext context) {
    final catData = Provider.of<Question>(context);
    return SizedBox(
      height: 50,
      child: FutureBuilder(
        future: categoryFuture,
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.done) {
            if (dataSnapshot.hasError) {
              return const Text('Error Loading The Categories');
            }
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: catData.categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: InkWell(
                    onTap: () {
                      widget.itemPicker(catData.categories[index]['id']);
                      setState(() {
                        initialIndex = index;
                      });
                    },
                    child: Chip(
                      padding: EdgeInsets.all(initialIndex == index ? 12.0 : 0),
                      side: initialIndex == index
                          ? const BorderSide(color: Colors.white, width: 2.0)
                          : BorderSide.none,
                      label: Text(
                        catData.categories[index]['name'],
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.teal.shade300,
                    ),
                  ),
                );
              },
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                        color: Colors.white, strokeWidth: 2.0)),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Loading Categories ...',
                  style: TextStyle(color: Colors.white),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
