// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:smartspace_client/l10n/app_localizations.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return AppBar(
      title: Container(
        height: 40,
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: l10n.search,
            hintStyle: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant.withOpacity(0.6),
            ),
            prefixIcon: Icon(
              Icons.search,
              size: 20,
              color: theme.colorScheme.onSurfaceVariant.withOpacity(0.6),
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            isDense: true,
          ),
          style: theme.textTheme.bodyMedium,
          textInputAction: TextInputAction.search,
          onSubmitted: (_) {
            // TODO: implement search logic
          },
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none),
          onPressed: () {
            // TODO: Navigate to notifications
          },
          tooltip: l10n.notifications,
        ),
        const SizedBox(width: 8),
      ],
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: theme.scaffoldBackgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
