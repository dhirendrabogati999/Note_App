
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/constants/app_spacing.dart';
import 'package:note_app/widgets/common/common_app_bar.dart';
import 'package:note_app/widgets/common/common_bottom_nav.dart';
import 'package:note_app/widgets/common/empty_state.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         appBar: const CommonAppBar(),
      
         body:Padding(
           padding: const EdgeInsets.all(AppSpacing.lg),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              Text("Favourites Notes",style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: AppSpacing.xs,),
              Text("Refining your most curated thoughts and inspirations.",style:Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: AppSpacing.xl,),
               Center(
                child: EmptyState(
                  icon: Icons.star_border_outlined, 
                  title: "No favourite notes yet", 
                  message: "Start curating your thoughts by tapping the star icon on your most important entries.", 
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
          currentIndex: 1,
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