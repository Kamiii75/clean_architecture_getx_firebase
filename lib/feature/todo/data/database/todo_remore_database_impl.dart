

import 'package:clean_architecture_getx_firebase/feature/todo/data/database/todo_remore_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/todo_model.dart';

class DatabaseService implements TodoRemoteDatabase {
  final _db = FirebaseFirestore.instance;
  static final DatabaseService _singleton = DatabaseService._internal();

  factory DatabaseService() {
    return _singleton;
  }

  DatabaseService._internal();

  @override
  Future<bool> addTodo(ModelTodo mdl) async {
    bool isAdded = false;

    await _db
        .collection('todos')
        .doc(mdl.id)
        .set(mdl.toJson())
        .whenComplete(() => isAdded = true);

    return isAdded;
  }

  @override
  Future<bool> deleteTodo(ModelTodo mdl) async {
    bool isDeleted = false;

    await _db
        .collection('todos')
        .doc(mdl.id)
        .delete()
        .whenComplete(() => isDeleted = true);

    return isDeleted;
  }

  @override
  Future<ModelTodo> editTodo(ModelTodo mdl) async {
    await _db.collection('todos').doc(mdl.id).set(mdl.toJson());

    return mdl;
  }

  @override
  Future<List<ModelTodo>> getAllTodo() async {
    List<ModelTodo> lst = [];

    final snapshot = await _db.collection('todos').get();

    List<DocumentSnapshot> docs = snapshot.docs;
    if (docs.isNotEmpty && docs.isNotEmpty) {
      lst = snapshot.docs.map((e) => ModelTodo.fromJson(e.data())).toList();
    }

    return lst;
  }
}
