
import 'package:flutter/material.dart';
import 'package:note_app/constants/app_colors.dart';
import 'package:note_app/constants/app_spacing.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget{

  final bool showClearAll;

  const CommonAppBar({
    super.key,
    this.showClearAll = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.menu),
      title: Text( 'The Editorial Archive',
        style: Theme.of(context).textTheme.titleMedium,
      ),

       actions: [
        if (showClearAll)
          const Icon(Icons.delete_outline),
        
        const SizedBox(width:12),
        const Icon(
          Icons.search,
        ),

        const SizedBox(width: AppSpacing.lg),
      ],

      backgroundColor: AppColors.white,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}