import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomeView extends StatelessWidget {
  final appBarTitle = 'Instagram';
  final _randomImageURL = 'https://picsum.photos/536/354';
  MaterialColor get randomColor => Colors.primaries[Random().nextInt(17)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actions: [
          IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Column(),
                );
              })
        ],
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wallpaper),
            Text(
              appBarTitle,
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline5!
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(flex: 8, child: listViewItemColumn(context)),
          Expanded(flex: 1, child: listViewBuilderExpanded()),
          Expanded(flex: 1, child: buildDismissibleBottomCard()),
        ],
      ),
    );
  }

  ListView listViewItemColumn(BuildContext context) {
    return ListView(
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: 500,
            color: randomColor),
        Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: 500,
            color: randomColor),
        Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: 500,
            color: randomColor),
        Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: 500,
            color: randomColor),
        Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: 500,
            color: randomColor),
        Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: 500,
            color: Colors.red),
      ],
    );
  }

  ListView listViewBuilderExpanded() {
    return ListView.builder(
      itemCount: 100,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Card(
            child: ListTile(
              onTap: () {},
              leading: CircleAvatar(
                backgroundImage: NetworkImage(_randomImageURL),
              ),
              title: Text('$appBarTitle $index'),
              trailing: Icon(Icons.arrow_right_alt),
            ),
          ),
        );
      },
    );
  }

  Dismissible buildDismissibleBottomCard() {
    return Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.red),
      secondaryBackground: Container(
        color: Colors.purple,
      ),
      child: containerInDismissible(),
    );
  }

  Container containerInDismissible() {
    return Container(
      color: Colors.pink,
    );
  }
}
