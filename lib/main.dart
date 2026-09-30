import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/app/app.dart';
import 'package:note_app/models/notes_model.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(NotesModelAdapter());

  await Hive.openBox<NotesModel>('notesBox');

  runApp(const MyApp());
}


