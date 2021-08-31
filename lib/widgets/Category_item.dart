import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/catogery_trips_screens.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUril;

  const CategoryItem(this.id, this.title, this.imageUril);
  void selectCatogry(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/category-trips'
    ,arguments: {
      'id':id,
      'title':title,
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCatogry(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUril,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15),
              ))
        ],
      ),
    );
  }
}
