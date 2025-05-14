import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<_SettingsOption> options = [
      _SettingsOption(
        label: 'Ubah kata sandi',
        value: 'kaleee1234',
        onTap: () {},
      ),
      _SettingsOption(label: 'Bahasa', value: 'Indonesia', onTap: () {}),
      _SettingsOption(label: 'Syarat & ketentuan', onTap: () {}),
      _SettingsOption(label: 'Logout', onTap: () {}),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF183A6D)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          'Pengaturan',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: options.length,
        separatorBuilder:
            (context, index) =>
                const Divider(height: 1, color: Color(0xFFE5E5E5)),
        itemBuilder: (context, index) {
          final option = options[index];
          return ListTile(
            title: Text(
              option.label,
              style: TextStyle(
                color:
                    (option.label == 'Logout' ||
                            option.label == 'Syarat & ketentuan')
                        ? Colors.grey[400]
                        : Colors.grey[700],
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (option.value != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      option.value!,
                      style: TextStyle(
                        color:
                            (option.label == 'Logout' ||
                                    option.label == 'Syarat & ketentuan')
                                ? Colors.grey[400]
                                : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                const Icon(Icons.chevron_right, color: Colors.grey, size: 22),
              ],
            ),
            onTap: option.onTap,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 2,
            ),
            dense: true,
          );
        },
      ),
    );
  }
}

class _SettingsOption {
  final String label;
  final String? value;
  final VoidCallback onTap;
  _SettingsOption({required this.label, this.value, required this.onTap});
}
