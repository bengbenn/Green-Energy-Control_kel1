
import 'package:flutter/material.dart';

void main() {
  runApp(const GreenEnergyApp());
}

class GreenEnergyApp extends StatelessWidget {
  const GreenEnergyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Green Energy Control',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        useMaterial3: true,
      ),
      home: const EnergyDashboard(),
    );
  }
}

class EnergyDashboard extends StatefulWidget {
  const EnergyDashboard({super.key});

  @override
  State<EnergyDashboard> createState() =>
      _EnergyDashboardState();
}

class _EnergyDashboardState extends State<EnergyDashboard> {
  bool lampOn = false;
  bool solarOn = true;

  Offset panelPosition = const Offset(20, 20);

  void showEnergyDetails() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Detail Energi Surya'),
        content: const Text(
          'Panel surya menghasilkan energi bersih '
          'untuk membantu mengurangi penggunaan listrik '
          'dari sumber konvensional.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Green Energy Control'),
        backgroundColor: Colors.green.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dashboard Energi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Kelola energi bersih secara interaktif.',
            ),
            const SizedBox(height: 16),

            // Row: Ringkasan energi
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.solar_power,
                            color: Colors.green,
                            size: 32,
                          ),
                          Text('Energi Surya'),
                          Text(
                            '3.5 kWh',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.bolt,
                            color: Colors.orange,
                            size: 32,
                          ),
                          Text('Penggunaan'),
                          Text(
                            '2.1 kWh',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            const Text(
              'Kontrol Perangkat',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Tap dan Long Press pada kartu lampu
            GestureDetector(
              onTap: () {
                setState(() {
                  lampOn = !lampOn;
                });
              },
              onLongPress: showEnergyDetails,
              child: Card(
                color: lampOn
                    ? Colors.green.shade100
                    : Colors.grey.shade200,
                child: ListTile(
                  leading: Icon(
                    lampOn
                        ? Icons.lightbulb
                        : Icons.lightbulb_outline,
                    color: lampOn
                        ? Colors.orange
                        : Colors.grey,
                    size: 36,
                  ),
                  title: const Text('Lampu Hemat Energi'),
                  subtitle: Text(
                    lampOn ? 'Status: ON' : 'Status: OFF',
                  ),
                  trailing: const Icon(Icons.touch_app),
                ),
              ),
            ),

            const SizedBox(height: 16),
            const Text(
              'Simulasi Panel Surya',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Geser panel dengan mouse. Klik panel untuk '
              'mengubah status dan tekan lama untuk '
              'melihat detail energi.',
            ),
            const SizedBox(height: 10),

            // Stack: area simulasi panel surya
            LayoutBuilder(
              builder: (context, constraints) {
                const panelWidth = 100.0;
                const panelHeight = 100.0;
                const areaHeight = 250.0;

                final maxX = (constraints.maxWidth -
                        panelWidth)
                    .clamp(0.0, double.infinity)
                    .toDouble();

                const maxY = areaHeight - panelHeight;

                final safePosition = Offset(
                  panelPosition.dx.clamp(0.0, maxX).toDouble(),
                  panelPosition.dy.clamp(0.0, maxY).toDouble(),
                );

                return Container(
                  height: areaHeight,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    border: Border.all(
                      color: Colors.green.shade300,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      const Positioned(
                        left: 12,
                        top: 12,
                        child: Text('Area Simulasi'),
                      ),

                      Positioned(
                        left: safePosition.dx,
                        top: safePosition.dy,
                        child: GestureDetector(
                          // Gesture 1: Tap
                          onTap: () {
                            setState(() {
                              solarOn = !solarOn;
                            });
                          },

                          // Gesture 2: Long Press
                          onLongPress: showEnergyDetails,

                          // Gesture 3: Drag/Pan
                          onPanUpdate: (details) {
                            setState(() {
                              panelPosition = Offset(
                                (panelPosition.dx +
                                        details.delta.dx)
                                    .clamp(0.0, maxX)
                                    .toDouble(),
                                (panelPosition.dy +
                                        details.delta.dy)
                                    .clamp(0.0, maxY)
                                    .toDouble(),
                              );
                            });
                          },

                          child: Card(
                            color: solarOn
                                ? Colors.green.shade200
                                : Colors.grey.shade300,
                            child: SizedBox(
                              width: panelWidth,
                              height: panelHeight,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.solar_power,
                                    size: 38,
                                    color: solarOn
                                        ? Colors.green.shade900
                                        : Colors.grey,
                                  ),
                                  const Text(
                                    'Panel Surya',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    solarOn ? 'ON' : 'OFF',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            // Informasi SDG 7
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      Icons.eco,
                      color: Colors.green,
                      size: 32,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Mendukung SDG 7: Energi Bersih '
                        'dan Terjangkau.',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
