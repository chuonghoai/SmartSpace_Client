// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smartspace_client/core/auth/user_storage_service.dart';
import 'package:smartspace_client/features/auth/services/auth_service.dart';
import 'package:smartspace_client/features/profile/models/user_model.dart';
import 'package:smartspace_client/l10n/app_localizations.dart';
import 'package:smartspace_client/routes/router_path.dart';
import 'package:smartspace_client/ui/shared/image/app_network_image.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            FutureBuilder<UserModel?>(
              future: userStorageService.getUser(),
              builder: (context, snapshot) {
                final user = snapshot.data;
                return Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      AppNetworkImage(
                        url: user?.avatarUrl,
                        width: 48,
                        height: 48,
                        isCircle: true,
                        errorWidget: CircleAvatar(
                          radius: 24,
                          backgroundColor: theme.colorScheme.primary,
                          child: Icon(
                            Icons.person,
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user?.fullname ?? l10n.user,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              user?.email ?? 'unknow@gmail.com',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurface.withOpacity(
                                  0.6,
                                ),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const Divider(height: 1),

            // Primary Navigation
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _SidebarItem(
                    icon: Icons.home_outlined,
                    label: l10n.home,
                    onTap: () {
                      // Navigate to home
                      context.go(RouterPath.home);
                    },
                    isSelected: true,
                  ),
                  _SidebarItem(
                    icon: Icons.report_outlined,
                    label: l10n.myReports,
                    onTap: () {
                      Navigator.pop(context);
                      // TODO: Navigate to My Reports
                    },
                  ),
                  _SidebarItem(
                    icon: Icons.notifications_outlined,
                    label: l10n.notifications,
                    onTap: () {
                      Navigator.pop(context);
                      // TODO: Navigate to Notifications
                    },
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(height: 1),
                  ),

                  // Secondary Navigation
                  _SidebarItem(
                    icon: Icons.settings_outlined,
                    label: l10n.settings,
                    onTap: () {
                      Navigator.pop(context);
                      // TODO: Navigate to Settings
                    },
                  ),
                  _SidebarItem(
                    icon: Icons.help_outline,
                    label: l10n.help,
                    onTap: () {
                      Navigator.pop(context);
                      // TODO: Navigate to Help
                    },
                  ),
                  _SidebarItem(
                    icon: Icons.info_outline,
                    label: l10n.aboutApp,
                    onTap: () {
                      Navigator.pop(context);
                      // TODO: Navigate to About application
                    },
                  ),
                ],
              ),
            ),

            const Divider(height: 1),
            // Logout
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: _SidebarItem(
                icon: Icons.logout,
                label: l10n.logout,
                textColor: theme.colorScheme.error,
                iconColor: theme.colorScheme.error,
                onTap: () async {
                  Navigator.pop(context);
                  await authService.logout();
                  if (context.mounted) {
                    context.go(RouterPath.login);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isSelected;
  final Color? textColor;
  final Color? iconColor;

  const _SidebarItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isSelected = false,
    this.textColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return ListTile(
      leading: Icon(
        icon,
        color:
            iconColor ??
            (isSelected ? primaryColor : theme.colorScheme.onSurfaceVariant),
      ),
      title: Text(
        label,
        style: theme.textTheme.bodyLarge?.copyWith(
          color:
              textColor ??
              (isSelected ? primaryColor : theme.colorScheme.onSurface),
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedTileColor: primaryColor.withOpacity(0.08),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
    );
  }
}
