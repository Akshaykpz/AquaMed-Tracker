import 'package:flutter/material.dart';
import 'package:ihydrate_application/models/category/data_base.dart';

class Search extends SearchDelegate {
  List<MedicineModel> allData = MedicineModel.getData().values.toList();
  List<MedicineCopyModel> compltedData =
      MedicineCopyModel.getData().values.toList();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "search result");
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<MedicineModel> matchQuery = [];
    List<MedicineCopyModel> compltedMatchQuery = [];

    for (var item in allData) {
      if (item.pill.toLowerCase().contains(query.toLowerCase().trim()) ||
          item.dose.toLowerCase().contains(query.toLowerCase().trim())) {
        matchQuery.add(item);
      }
    }
    for (var item in compltedData) {
      if (item.pill.toLowerCase().contains(query.toLowerCase().trim()) ||
          item.dose.toLowerCase().contains(query.toLowerCase().trim())) {
        compltedMatchQuery.add(item);
      }
    }
    return (matchQuery.isEmpty && compltedMatchQuery.isEmpty)
        ? Center(
            child: Image.asset('lib/assets/images/107420-no-data-loader.gif'))
        : ListView.builder(
            itemCount: matchQuery.length + compltedMatchQuery.length,
            itemBuilder: (context, index) {
              if (index < matchQuery.length) {
                var result = matchQuery[index];
                return Card(
                  child: ListTile(
                    title: Text(result.note),
                    subtitle: Text(result.dose),
                  ),
                );
              } else {
                var completedResult =
                    compltedMatchQuery[index - matchQuery.length];
                return Card(
                  child: ListTile(
                    title: Text(completedResult.pill),
                    subtitle: Text(completedResult.dose),
                  ),
                );
              }
            },
          );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<MedicineModel> matchQuery = [];
    List<MedicineCopyModel> compltedMatchQuery = [];
    for (var item in allData) {
      if (item.note.contains(query.toLowerCase().trim()) ||
          item.dose.toLowerCase().contains(query.toLowerCase().trim())) {
        matchQuery.add(item);
      }
    }
    for (var item in compltedData) {
      if (item.pill.toLowerCase().contains(query.toLowerCase().trim()) ||
          item.dose.toLowerCase().contains(query.toLowerCase().trim())) {
        compltedMatchQuery.add(item);
      }
    }
    return (matchQuery.isEmpty && compltedMatchQuery.isEmpty)
        ? Center(
            child: Image.asset('lib/assets/images/107420-no-data-loader.gif'))
        : ListView.builder(
            itemCount: matchQuery.length + compltedMatchQuery.length,
            itemBuilder: (context, index) {
              if (index < matchQuery.length) {
                var result = matchQuery[index];
                return Card(
                  child: ListTile(
                    title: Text(result.note),
                    subtitle: Text(result.dose),
                  ),
                );
              } else {
                var completedResult =
                    compltedMatchQuery[index - matchQuery.length];
                return Card(
                  child: ListTile(
                    title: Text(completedResult.pill),
                    subtitle: Text(completedResult.dose),
                  ),
                );
              }
            },
          );
  }
}
