import 'package:flutter/material.dart';
import '../services/settings_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final usernameController = TextEditingController();
  String plataforma = 'PC';

  @override
  void initState() {
    super.initState();
    final s = SettingsService.instance;
    usernameController.text = s.username;
    plataforma = s.preferredPlatform;
  }

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  Future<void> _saveAll() async {
    final s = SettingsService.instance;
    await s.setUsername(usernameController.text);
    await s.setPreferredPlatform(plataforma);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Preferencias guardadas')));
  }

  @override
  Widget build(BuildContext context) {
    final s = SettingsService.instance;

    return Scaffold(
      appBar: AppBar(title: const Text('Ajustes')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Nombre de usuario', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Introduce tu nombre',
                ),
              ),
              const SizedBox(height: 20),

              ValueListenableBuilder<bool>(
                valueListenable: s.darkMode,
                builder: (_, isDark, __) {
                  return SwitchListTile(
                    title: const Text('Tema oscuro'),
                    value: isDark,
                    onChanged: (v) async {
                      await s.setDarkMode(v);
                    },
                  );
                },
              ),

              const SizedBox(height: 20),

              const Text(
                'Plataforma preferida',
                style: TextStyle(fontSize: 16),
              ),
              Column(
                children: [
                  RadioListTile<String>(
                    value: 'PC',
                    groupValue: plataforma,
                    title: const Text('PC'),
                    onChanged: (v) => setState(() => plataforma = v!),
                  ),
                  RadioListTile<String>(
                    value: 'PS5',
                    groupValue: plataforma,
                    title: const Text('PS5'),
                    onChanged: (v) => setState(() => plataforma = v!),
                  ),
                  RadioListTile<String>(
                    value: 'Switch',
                    groupValue: plataforma,
                    title: const Text('Switch'),
                    onChanged: (v) => setState(() => plataforma = v!),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  onPressed: _saveAll,
                  child: const Text('Guardar ajustes'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
