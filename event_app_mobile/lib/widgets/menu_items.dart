import 'package:event_app_mobile/services/user_manager.dart';
import 'package:event_app_mobile/widgets/menu_item.dart';
import 'package:flutter/material.dart';

class MenuItems {
  static const List<MenuItem> itemsFirst = [
    itemEdit,
    itemDelete,
  ];

  static const itemEdit = MenuItem(
    text: 'Edit',
    icon: Icons.edit,
  );

  static const itemDelete = MenuItem(
    icon: Icons.delete,
    text: 'Delete',
  );
}
