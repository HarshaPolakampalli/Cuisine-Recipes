import 'package:flutter/material.dart';

import '../widgets/side_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routename = "/filters";

  final Function saveFilters;
  final Map<String,bool> filters;

  FiltersScreen(this.filters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}



class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenfree = false;
  bool vegetatrian = false;
  bool vegan = false;
  bool lactosefree = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     glutenfree = widget.filters['gluten'];
     vegetatrian = widget.filters['vegetarian'];
     vegan = widget.filters['vegan'];
     lactosefree = widget.filters['lactose'];

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  Map<String, bool> _filters = {
                    'gluten': glutenfree,
                    'lactose': lactosefree,
                    'vegetarian': vegetatrian,
                    'vegan': vegan
                  };
                  widget.saveFilters(_filters);
                  Navigator.of(context).pop();
                })
          ],
        ),
        //drawer: SideDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text("Adjust Your Meal Selection",
                  style: Theme.of(context).textTheme.headline6),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchListTile(
                      "Gluten Free", "Only show Gluten Free food", glutenfree,
                      (value) {
                    setState(() {
                      glutenfree = value;
                    });
                  }),
                  buildSwitchListTile("Vegetarian Food",
                      "Only show vegetarian food", vegetatrian, (value) {
                    setState(() {
                      vegetatrian = value;
                    });
                  }),
                  buildSwitchListTile(
                      "Vegan Food", "Only show vegan food", vegan, (value) {
                    setState(() {
                      vegan = value;
                    });
                  }),
                  buildSwitchListTile("Lactose Food",
                      "Only show lactose free food", lactosefree, (value) {
                    setState(() {
                      lactosefree = value;
                    });
                  })
                ],
              ),
            )
          ],
        ));
  }

  Widget buildSwitchListTile(
      String text1, String text2, bool value, Function currentFunction) {
    return SwitchListTile(
        title: Text(text1),
        subtitle: Text(text2),
        value: value,
        onChanged: currentFunction);
  }
}
