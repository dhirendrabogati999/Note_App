
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/constants/app_colors.dart';
import 'package:note_app/constants/app_sizes.dart';
import 'package:note_app/constants/app_spacing.dart';
import 'package:note_app/widgets/common/common_app_bar.dart';
import 'package:note_app/widgets/common/common_bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CommonAppBar(),
      
        body:Padding(
          padding:const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('All Notes',style:Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: AppSpacing.xs,),
              Text('Curating your thoughts into clarity',style:Theme.of(context).textTheme.bodyMedium),
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