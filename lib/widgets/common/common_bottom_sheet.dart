
import 'package:flutter/material.dart';
import 'package:note_app/constants/app_colors.dart';
import 'package:note_app/constants/app_sizes.dart';
import 'package:note_app/constants/app_spacing.dart';

class CommonBottomSheet extends StatefulWidget {
  final String? initialTitle;
  final String? initialDescription;
  final String buttonText;
  final void Function(String title, String description) onSave;

  const CommonBottomSheet({
    super.key,
    this.initialTitle,
    this.initialDescription,
    required this.buttonText,
    required this.onSave,
  });

  @override
  State<CommonBottomSheet> createState() => _CommonBottomSheetState();
}

class _CommonBottomSheetState extends State<CommonBottomSheet> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;

  @override 
  void initState(){
    super.initState();

    titleController = TextEditingController(
      text: widget.initialTitle ?? '',
    );

    descriptionController = TextEditingController(
      text: widget.initialDescription ?? '',
    );
  }

  @override
  void dispose(){
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.md,
        right: AppSpacing.md,
        top: AppSpacing.md,
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.md,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.initialTitle == null ? 'Add Note' : 'Edit Note',
            style: Theme.of(context).textTheme.titleLarge,         
          ),

          const SizedBox(height: AppSpacing.lg,),
      
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: 'Enter note title',
               border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.border,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
              )
            ),
          ),
      
          const SizedBox(height: AppSpacing.md,),
      
          TextField(
            controller: descriptionController,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'Write your note...',
               border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
              ),
              focusedBorder: OutlineInputBorder(                
                borderSide: const BorderSide(
                  color: AppColors.border,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.lg,),
      
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,    
                    color: AppColors.textSecondary,            
                  ),
                  borderRadius: BorderRadius.circular(AppSizes.radiusMedium)
                ),
                child: TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  }, 
                  child: const Text('Cancle',style: TextStyle(fontWeight: FontWeight.w600),),
                ),
              ),
      
              const SizedBox(width: AppSpacing.sm,),
      
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,   
                    color: AppColors.textSecondary,                
                  ),
                  borderRadius: BorderRadius.circular(AppSizes.radiusMedium)
                ),
                child: TextButton(
                  onPressed: (){
                        final title = titleController.text.trim();
                    final description = descriptionController.text.trim();
                
                    if (title.isEmpty || description.isEmpty) {
                      return;
                    }
                
                    widget.onSave(title, description);
                    Navigator.pop(context);                
                  }, 
                  child: Text(widget.buttonText,style:const TextStyle(fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
      
        ],
      ),
    );
  }
}