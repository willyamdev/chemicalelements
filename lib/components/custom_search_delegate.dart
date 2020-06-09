import 'package:chemicalelements/models/chemical_element.dart';
import 'package:chemicalelements/models/elements_list.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<ChemicalElement> {
  List<ChemicalElement> elements;
  ElementsList elementsList = ElementsList();
  CustomSearchDelegate(){
    elements = elementsList.elementsList;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ChemicalElement> list = List();

    if (query.isNotEmpty) {
      for (var c in elements) {
        String a = c.elementName;

        if (a.toLowerCase().startsWith(query)) {
          list.add(c);
        }
      }

      return Container(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, indice) {
            return ListTile(
              title: Text(list[indice].elementName),
              onTap: () {
                close(context, list[indice]);
              },
            );
          },
        ),
      );
    } else {
      return Container(
        child: Center(child: Text("Não há nenhum resultado para essa pesquisa")),
      );
    }
  }
}
