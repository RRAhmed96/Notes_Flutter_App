import 'package:flutter/material.dart';
import 'package:flutter_note_app/models/note_model.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key, required this.onNewNoteCreated});

  final Function(Note) onNewNoteCreated;

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: const TextStyle(
                fontSize: 28
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Title"
              ),
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: contentController,
              style: const TextStyle(
                  fontSize: 18
              ),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Your content"
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if (titleController.text.isEmpty){
            return ;
          }
          if (contentController.text.isEmpty){
            return ;
          }
          final note = Note(
            content: contentController.text,
            title: titleController.text,
          );
          widget.onNewNoteCreated(note);
          Navigator.of(context).pop();
        },
          child: const Icon(Icons.save),
      ),
    );
  }
}
