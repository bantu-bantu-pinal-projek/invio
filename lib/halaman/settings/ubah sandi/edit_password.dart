import 'package:flutter/material.dart';
import '../../../services/account_service.dart';

class EditPassword extends StatelessWidget {
  const EditPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pengaturan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          _buildSettingItem(
            context,
            'Ubah kata sandi',
            'kaleee1234',
            true,
            () => _showChangePasswordDialog(context),
          ),
          _buildSettingItem(context, 'Bahasa', 'Indonesia', true, () {}),
          _buildSettingItem(context, 'Syarat & ketentuan', '', true, () {}),
          _buildSettingItem(context, 'Logout', '', true, () {}),
        ],
      ),
    );
  }

  Widget _buildSettingItem(
    BuildContext context,
    String title,
    String value,
    bool hasArrow,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
            Row(
              children: [
                if (value.isNotEmpty)
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                if (hasArrow)
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(Icons.chevron_right, color: Colors.grey),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final AccountService accountService = AccountService();

    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black54,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Ganti kata sandi',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Silahkan masukkan kata sandi baru',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 24),
                // Password input field
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Cancel button
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.blue),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          foregroundColor: Colors.blue,
                        ),
                        icon: Image.asset(
                          'assets/icons/icon cancel.png',
                          width: 16,
                          height: 16,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.close, size: 16);
                          },
                        ),
                        label: const Text('Batal'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    // OK button
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          // Get new password
                          final newPassword = passwordController.text.trim();

                          if (newPassword.isEmpty) {
                            // Show error message
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Kata sandi tidak boleh kosong'),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }

                          // Get current user
                          final currentUser =
                              await accountService.getCurrentUser();

                          if (currentUser != null) {
                            // Update password
                            final success = await accountService.updatePassword(
                              currentUser.email,
                              newPassword,
                            );

                            if (success) {
                              // Show success message
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Kata sandi berhasil diubah'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            } else {
                              // Show error message
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Gagal mengubah kata sandi'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          } else {
                            // No user logged in
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Tidak ada pengguna yang sedang login',
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }

                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E3A8A),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          foregroundColor: Colors.white,
                        ),
                        icon: Image.asset(
                          'assets/icons/icon Ok.png',
                          width: 16,
                          height: 16,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.check, size: 16);
                          },
                        ),
                        label: const Text('Ok'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}//anjay

// Helper method to show the password change dialog directly
// Use this function if you want to show the dialog from another page
Future<void> showPasswordChangeDialog(BuildContext context) async {
  final TextEditingController passwordController = TextEditingController();
  final AccountService accountService = AccountService();

  await showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black54,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Ganti kata sandi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'Silahkan masukkan kata sandi baru',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 24),
              // Password input field
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                ),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Cancel button
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.blue),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        foregroundColor: Colors.blue,
                      ),
                      icon: Image.asset(
                        'assets/icons/icon cancel.png',
                        width: 16,
                        height: 16,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.close, size: 16);
                        },
                      ),
                      label: const Text('Batal'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // OK button
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        // Get new password
                        final newPassword = passwordController.text.trim();

                        if (newPassword.isEmpty) {
                          // Show error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Kata sandi tidak boleh kosong'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }

                        // Get current user
                        final currentUser =
                            await accountService.getCurrentUser();

                        if (currentUser != null) {
                          // Update password
                          final success = await accountService.updatePassword(
                            currentUser.email,
                            newPassword,
                          );

                          if (success) {
                            // Show success message
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Kata sandi berhasil diubah'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          } else {
                            // Show error message
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Gagal mengubah kata sandi'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        } else {
                          // No user logged in
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Tidak ada pengguna yang sedang login',
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }

                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E3A8A),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        foregroundColor: Colors.white,
                      ),
                      icon: Image.asset(
                        'assets/icons/icon Ok.png',
                        width: 16,
                        height: 16,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.check, size: 16);
                        },
                      ),
                      label: const Text('Ok'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
