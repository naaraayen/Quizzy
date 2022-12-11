import 'package:flutter/material.dart';

class DifficultyPicker extends StatefulWidget {
  final Function getDifficultyCallBack;
  const DifficultyPicker(this.getDifficultyCallBack, {super.key});

  @override
  State<DifficultyPicker> createState() => _DifficultyPickerState();
}

class _DifficultyPickerState extends State<DifficultyPicker> {
  var currentItem = 'easy';

  List<String> difficulties = ['easy', 'medium', 'hard'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text('DIFFICULTY LEVEL: ', style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'ConcertOne'

            ),),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1.0),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: difficulties.map((item) {
                  return Flexible(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          currentItem = item;
                        });
                        widget.getDifficultyCallBack(currentItem);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: currentItem == item ? Colors.teal[800] : null,
                            border: const Border(right: BorderSide(color: Colors.white))
                            ),
                        child: Center(child: Text(item.toUpperCase(), style: const TextStyle(
                          color: Colors.white,
                        ),)),
                      ),
                    ),
                  );
                }).toList()),
          ),
        ],
      ),
    );
  }
}
