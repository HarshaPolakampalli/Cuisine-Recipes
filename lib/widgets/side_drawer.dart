import 'package:flutter/material.dart';
import '../screens/filters.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
            ),
          ),

          getListItem(Icons.restaurant,"Meals",(){

            Navigator.of(context).pushReplacementNamed('/');
          }),
          SizedBox(height: 20,),
          getListItem(Icons.settings,"Filters",(){
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(FiltersScreen.routename);
          }),
        ],
      ),
    );
  }

  Widget getListItem(IconData icon,String text,Function tapHandler){
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        text,
        style: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600,
            fontSize: 18),
      ),
      onTap: tapHandler,
    );
  }
}
