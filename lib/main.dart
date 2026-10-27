import 'package:flutter/material.dart';
import 'widgets/skill_chip.dart';
import 'widgets/stat_card.dart';

void main() {
  runApp(const DevFolioApp());
}

class DevFolioApp extends StatelessWidget {
  const DevFolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevFolio App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ProfileScreen(),
    const DashboardScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.badge_outlined),
            selectedIcon: Icon(Icons.badge),
            label: 'Crachá',
          ),
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
        ],
      ),
    );
  }
}

// --- TELA 1: PERFIL & CRACHÁ ---
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DevFolio — Perfil'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Cartão Crachá com Gradiente
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.indigo.shade700, Colors.indigo.shade400],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 46,
                      child: Icon(Icons.person, size: 50),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Nome do Aluno',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Desenvolvedor Mobile Flutter',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Chip(
                    avatar: const Icon(Icons.school, size: 16),
                    label: const Text('Turma: t2dev-t3'),
                    backgroundColor: Colors.white.withOpacity(0.9),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Seção de Habilidades
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Habilidades Técnicas',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 12),
            const Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                SkillChip(label: 'Flutter'),
                SkillChip(label: 'Dart'),
                SkillChip(label: 'Git & GitHub'),
                SkillChip(label: 'Clean Architecture'),
                SkillChip(label: 'UI/UX Mobile'),
                SkillChip(label: 'Debian/Linux'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// --- TELA 2: DASHBOARD DE PROJETOS ---
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Métricas & Projetos'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Visão Geral do Portfólio',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: const [
                  StatCard(
                    title: 'Projetos Concluídos',
                    value: '12',
                    icon: Icons.folder_special,
                    isFeatured: true,
                  ),
                  StatCard(
                    title: 'Commits Realizados',
                    value: '148',
                    icon: Icons.commit,
                  ),
                  StatCard(
                    title: 'Repositórios',
                    value: '8',
                    icon: Icons.code,
                  ),
                  StatCard(
                    title: 'Horas de Código',
                    value: '120h',
                    icon: Icons.timer,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}