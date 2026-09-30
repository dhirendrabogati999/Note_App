
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/constants/app_colors.dart';
import 'package:note_app/constants/app_sizes.dart';
import 'package:note_app/constants/app_spacing.dart';
import 'package:note_app/models/notes_model.dart';
import 'package:note_app/widgets/common/common_app_bar.dart';
import 'package:note_app/widgets/common/common_bottom_nav.dart';
import 'package:note_app/widgets/common/common_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CommonAppBar(),
      
        body:Padding(
          padding:const EdgeInsets.all(AppSpacing.lg),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("All Notes",style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: AppSpacing.xs,),
              Text("Curating your thoughts into clarity.",style:Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: AppSpacing.md),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: Hive.box<NotesModel>('notesBox').listenable(),
                  builder: (context, Box<NotesModel> box, _) {
                    if (box.isEmpty) {
                      return const Center(
                        child: Text('No notes yet'),
                      );
                    }
                
                    return ListView.builder(
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                        final note = box.getAt(index);
                
                        if (note == null) {
                          return const SizedBox();
                        }
                
                        return Card(
                          child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(note.title,style: Theme.of(context).textTheme.titleSmall,),

                              Text('${note.createdAt.hour}:${note.createdAt.minute.toString().padLeft(2, '0')}',),
                            ],
                          ),
                          subtitle: Text(note.description,style:const TextStyle(fontWeight: FontWeight.w400),),
                        ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
          ),
          onPressed: (){
            showModalBottomSheet(
              context: context, 
              isScrollControlled: true,
              builder: (context){
                return CommonBottomSheet(
                  buttonText: "Save", 
                  onSave: (title, description) async {
                   final box = Hive.box<NotesModel>('notesBox');

                   final note = NotesModel(
                    title: title, 
                    description: description, 
                    createdAt: DateTime.now(),                   
                   );

                   await box.add(note);
                  }
                );
              }
            );      
          },
          child:const Icon(Icons.add),
        ),
      
        bottomNavigationBar: CommonBottomNav(
          currentIndex: 0, 
          onTap: (index){
            if(index == 0){
              context.go('/home');
            }else if(index == 1){
              context.go('/favourites');
            }else if(index == 2){
              context.go('/deleted');
            }
          },
        ),     
      ),
    );
  }
}