
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/constants/app_spacing.dart';
import 'package:note_app/widgets/common/common_app_bar.dart';
import 'package:note_app/widgets/common/common_bottom_nav.dart';
import 'package:note_app/widgets/common/empty_state.dart';

class DeletedScreen extends StatelessWidget{
  const DeletedScreen({super.key});

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
         appBar: const CommonAppBar(
           showClearAll: true,
         ),
         
         body:Padding(
           padding: const EdgeInsets.all(AppSpacing.lg),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              Text("Deleted Notes",style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: AppSpacing.xs,),
              Text("Items in the trash are automatically removed after 30 days.",style:Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: AppSpacing.xl,),
               
               Center(
                child: EmptyState(
                  icon: Icons.delete_outline, 
                  title: "No deleted notes", 
                  message: "Notes you delete will appear here. You can restore or permanently delete them later.", 
                  buttonText: "Discover Notes", 
                  onPressed: (){
                    context.go('/home');
                  },
                )
               ),
             ],
           ),
         ),
      
        bottomNavigationBar: CommonBottomNav(
          currentIndex: 2,
          onTap: (index) {
            if (index == 0) {
              context.go('/home');
            } else if (index == 1) {
              context.go('/favourites');
            } else if (index == 2) {
              context.go('/deleted');
            }
          },
        ),
      ),
    );
  }
}