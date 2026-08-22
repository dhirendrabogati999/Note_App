
import 'package:flutter/material.dart';
import 'package:note_app/constants/app_colors.dart';
import 'package:note_app/constants/app_sizes.dart';
import 'package:note_app/constants/app_spacing.dart';

class EmptyState extends StatelessWidget{
  final IconData icon;
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback onPressed;

  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context){
    return 
      Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.border,
          borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          CircleAvatar(
            backgroundColor:AppColors.white,
            child: Icon(icon,color: AppColors.primary),
          ),
          const SizedBox(height:AppSpacing.md),
          Text(title,style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height:AppSpacing.sm),
          Text(message,textAlign: TextAlign.center),
          const SizedBox(height:AppSpacing.md),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:AppColors.primary,
              foregroundColor: AppColors.white
            ),
            onPressed:onPressed,
            child: Text(buttonText,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          ),
          ],
        ),
      );
  }
}