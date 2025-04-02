import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/documents.dart';

class SearchViewModel extends ChangeNotifier {
  List<Documents> documents = [];
  final supabase = Supabase.instance.client;

  Future<void> fetchDocuments() async {
    try {
      final data = await supabase.from('Documentss').select();
      documents = (data as List)
          .map((DocumentsMap) => Documents.fromMap(DocumentsMap))
          .toList();
      notifyListeners();
    } catch (error) {
      print('Error fetching documents: $error');
    }
  }

  Future<void> addDocuments(Documents documents) async {
    try {
      await supabase.from('documents').insert(documents.toMap());
      await fetchDocuments();
    } catch (error) {
      print('Error adding documents: $error');
    }
  }

  Future<void> updateDocuments(Documents documents) async {
    try {
      await supabase
          .from('Documentss')
          .update(documents.toMap())
          .eq('id', documents.id!);
      await fetchDocuments();
    } catch (error) {
      print('Error updating documents: $error');
    }
  }

  Future<void> deleteDocuments(int id) async {
    try {
      await supabase.from('Documentss').delete().eq('id', id);
      await fetchDocuments();
    } catch (error) {
      print('Error deleting documents: $error');
    }
  }
}
