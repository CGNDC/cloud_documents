import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/search_view_model.dart';

class SearchListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contactVM = Provider.of<SearchViewModel>(context, listen: false);
    contactVM.fetchDocuments();

    return Scaffold(
      appBar: AppBar(title: Text('Cloud Documents')),
      body: Consumer<SearchViewModel>(
        builder: (context, vm, child) {
          if (vm.documents.isEmpty) {
            return Center(child: Text('No documents found.'));
          }
          return ListView.builder(
            itemCount: vm.documents.length,
            itemBuilder: (context, index) {
              final contact = vm.documents[index];
              return ListTile(
                title: Text(contact.title),
                subtitle: Text(contact.description),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => vm.deleteDocuments(contact.id!),
                ),
                onTap: () {
                },
              );
            },
          );
        },
      ),
    );
  }
}
