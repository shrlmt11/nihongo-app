
import 'package:flutter/material.dart';

void main() => runApp(const NihongoApp());

class NihongoApp extends StatelessWidget {
  const NihongoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NIHONGO',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFFCF4),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFD4AF37)),
      ),
      home: const MainPage(),
    );
  }
}

class Kana {
  final String char;
  final String romaji;
  const Kana(this.char, this.romaji);
}

const hiragana = [
  Kana('あ','a'), Kana('い','i'), Kana('う','u'), Kana('え','e'), Kana('お','o'),
  Kana('か','ka'), Kana('き','ki'), Kana('く','ku'), Kana('け','ke'), Kana('こ','ko'),
  Kana('さ','sa'), Kana('し','shi'), Kana('す','su'), Kana('せ','se'), Kana('そ','so'),
  Kana('た','ta'), Kana('ち','chi'), Kana('つ','tsu'), Kana('て','te'), Kana('と','to'),
  Kana('な','na'), Kana('に','ni'), Kana('ぬ','nu'), Kana('ね','ne'), Kana('の','no'),
  Kana('は','ha'), Kana('ひ','hi'), Kana('ふ','fu'), Kana('へ','he'), Kana('ほ','ho'),
  Kana('ま','ma'), Kana('み','mi'), Kana('む','mu'), Kana('め','me'), Kana('も','mo'),
  Kana('や','ya'), Kana('ゆ','yu'), Kana('よ','yo'),
  Kana('ら','ra'), Kana('り','ri'), Kana('る','ru'), Kana('れ','re'), Kana('ろ','ro'),
  Kana('わ','wa'), Kana('を','wo'), Kana('ん','n'),
];

const katakana = [
  Kana('ア','a'), Kana('イ','i'), Kana('ウ','u'), Kana('エ','e'), Kana('オ','o'),
  Kana('カ','ka'), Kana('キ','ki'), Kana('ク','ku'), Kana('ケ','ke'), Kana('コ','ko'),
  Kana('サ','sa'), Kana('シ','shi'), Kana('ス','su'), Kana('セ','se'), Kana('ソ','so'),
  Kana('タ','ta'), Kana('チ','chi'), Kana('ツ','tsu'), Kana('テ','te'), Kana('ト','to'),
  Kana('ナ','na'), Kana('ニ','ni'), Kana('ヌ','nu'), Kana('ネ','ne'), Kana('ノ','no'),
  Kana('ハ','ha'), Kana('ヒ','hi'), Kana('フ','fu'), Kana('ヘ','he'), Kana('ホ','ho'),
  Kana('マ','ma'), Kana('ミ','mi'), Kana('ム','mu'), Kana('メ','me'), Kana('モ','mo'),
  Kana('ヤ','ya'), Kana('ユ','yu'), Kana('ヨ','yo'),
  Kana('ラ','ra'), Kana('リ','ri'), Kana('ル','ru'), Kana('レ','re'), Kana('ロ','ro'),
  Kana('ワ','wa'), Kana('ヲ','wo'), Kana('ン','n'),
];

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomePage(),
      const KanaPage(title: 'Hiragana', items: hiragana),
      const KanaPage(title: 'Katakana', items: katakana),
      const FlashcardPage(),
      const WritingPage(),
    ];

    return Scaffold(
      body: SafeArea(child: pages[index]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Beranda'),
          NavigationDestination(icon: Icon(Icons.translate), label: 'Hiragana'),
          NavigationDestination(icon: Icon(Icons.language), label: 'Katakana'),
          NavigationDestination(icon: Icon(Icons.style_outlined), label: 'Flashcard'),
          NavigationDestination(icon: Icon(Icons.edit_outlined), label: 'Menulis'),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String title;
  final String subtitle;
  const Header(this.title, this.subtitle, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(subtitle, style: TextStyle(color: Colors.grey.shade700)),
      ]),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(children: const [
      Header('NIHONGO 日本語', 'Belajar Hiragana & Katakana dari dasar'),
      Feature(icon: Icons.translate, title: 'Hiragana', subtitle: '46 karakter dasar Jepang'),
      Feature(icon: Icons.language, title: 'Katakana', subtitle: '46 karakter untuk kata serapan'),
      Feature(icon: Icons.style, title: 'Flashcard', subtitle: 'Balik kartu untuk melihat romaji'),
      Feature(icon: Icons.edit, title: 'Latihan Menulis', subtitle: 'Tulis kana langsung di layar'),
    ]);
  }
}

class Feature extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const Feature({required this.icon, required this.title, required this.subtitle, super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: Card(
        color: Colors.white,
        elevation: 0,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color(0xFFFFF1B8),
            child: Icon(icon, color: const Color(0xFF8A6D00)),
          ),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}

class KanaPage extends StatelessWidget {
  final String title;
  final List<Kana> items;
  const KanaPage({required this.title, required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Header(title, 'Ketuk karakter untuk melihat bacaannya'),
      Expanded(
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10,
          ),
          itemCount: items.length,
          itemBuilder: (_, i) {
            final k = items[i];
            return InkWell(
              onTap: () => showModalBottomSheet(
                context: context,
                showDragHandle: true,
                builder: (_) => Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Text(k.char, style: const TextStyle(fontSize: 90)),
                    Text(k.romaji.toUpperCase(), style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  ]),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: const Color(0x22D4AF37)),
                ),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(k.char, style: const TextStyle(fontSize: 34)),
                  Text(k.romaji, style: const TextStyle(fontWeight: FontWeight.w600)),
                ]),
              ),
            );
          },
        ),
      ),
    ]);
  }
}

class FlashcardPage extends StatefulWidget {
  const FlashcardPage({super.key});
  @override
  State<FlashcardPage> createState() => _FlashcardPageState();
}

class _FlashcardPageState extends State<FlashcardPage> {
  bool useHiragana = true;
  int i = 0;
  bool flipped = false;

  @override
  Widget build(BuildContext context) {
    final items = useHiragana ? hiragana : katakana;
    final k = items[i];
    return ListView(children: [
      const Header('Hafalkan Kana', 'Flashcard Hiragana & Katakana'),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SegmentedButton<bool>(
          segments: const [
            ButtonSegment(value: true, label: Text('Hiragana')),
            ButtonSegment(value: false, label: Text('Katakana')),
          ],
          selected: {useHiragana},
          onSelectionChanged: (v) => setState(() { useHiragana = v.first; i = 0; flipped = false; }),
        ),
      ),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 330,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(28)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(k.char, style: const TextStyle(fontSize: 115)),
            if (flipped) Text(k.romaji.toUpperCase(), style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ]),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: FilledButton(
          style: FilledButton.styleFrom(backgroundColor: Colors.black87, padding: const EdgeInsets.all(15)),
          onPressed: () => setState(() => flipped = !flipped),
          child: Text(flipped ? 'Tutup Kartu' : 'Putar Kartu'),
        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        TextButton(
          onPressed: i == 0 ? null : () => setState(() { i--; flipped = false; }),
          child: const Text('‹ Sebelumnya'),
        ),
        Text('${i + 1} / ${items.length}', style: const TextStyle(fontWeight: FontWeight.bold)),
        TextButton(
          onPressed: i == items.length - 1 ? null : () => setState(() { i++; flipped = false; }),
          child: const Text('Selanjutnya ›'),
        ),
      ]),
    ]);
  }
}

class WritingPage extends StatefulWidget {
  const WritingPage({super.key});
  @override
  State<WritingPage> createState() => _WritingPageState();
}

class _WritingPageState extends State<WritingPage> {
  bool useHiragana = true;
  int i = 0;
  final points = <Offset?>[];

  @override
  Widget build(BuildContext context) {
    final items = useHiragana ? hiragana : katakana;
    final k = items[i];

    return ListView(children: [
      const Header('Cara Menulis', 'Lihat karakter lalu coba tulis sendiri'),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SegmentedButton<bool>(
          segments: const [
            ButtonSegment(value: true, label: Text('Hiragana')),
            ButtonSegment(value: false, label: Text('Katakana')),
          ],
          selected: {useHiragana},
          onSelectionChanged: (v) => setState(() { useHiragana = v.first; i = 0; points.clear(); }),
        ),
      ),
      const SizedBox(height: 16),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 220,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(28)),
          child: Center(child: Text(k.char, style: TextStyle(fontSize: 145, color: Colors.grey.shade300))),
        ),
      ),
      const Padding(
        padding: EdgeInsets.fromLTRB(20, 18, 20, 8),
        child: Text('AREA LATIHAN', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 280,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: const Color(0x22D4AF37)),
          ),
          clipBehavior: Clip.antiAlias,
          child: GestureDetector(
            onPanStart: (d) => setState(() => points.add(d.localPosition)),
            onPanUpdate: (d) => setState(() => points.add(d.localPosition)),
            onPanEnd: (_) => setState(() => points.add(null)),
            child: CustomPaint(painter: DrawPainter(points), child: const SizedBox.expand()),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 4),
        child: OutlinedButton.icon(
          onPressed: () => setState(points.clear),
          icon: const Icon(Icons.refresh),
          label: const Text('Hapus'),
        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        TextButton(
          onPressed: i == 0 ? null : () => setState(() { i--; points.clear(); }),
          child: const Text('‹ Sebelumnya'),
        ),
        Text('${i + 1} / ${items.length}', style: const TextStyle(fontWeight: FontWeight.bold)),
        TextButton(
          onPressed: i == items.length - 1 ? null : () => setState(() { i++; points.clear(); }),
          child: const Text('Selanjutnya ›'),
        ),
      ]),
    ]);
  }
}

class DrawPainter extends CustomPainter {
  final List<Offset?> points;
  DrawPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 7
      ..strokeCap = StrokeCap.round
      ..color = Colors.black87;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
