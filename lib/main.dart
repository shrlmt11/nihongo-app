import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const NihongoApp());

const gold = Color(0xFFD4AF37);
const bg = Color(0xFFFFFCF4);

class Kana {
  final String c, r;
  const Kana(this.c, this.r);
}

const hira = [
  Kana('あ','a'),Kana('い','i'),Kana('う','u'),Kana('え','e'),Kana('お','o'),
  Kana('か','ka'),Kana('き','ki'),Kana('く','ku'),Kana('け','ke'),Kana('こ','ko'),
  Kana('さ','sa'),Kana('し','shi'),Kana('す','su'),Kana('せ','se'),Kana('そ','so'),
  Kana('た','ta'),Kana('ち','chi'),Kana('つ','tsu'),Kana('て','te'),Kana('と','to'),
  Kana('な','na'),Kana('に','ni'),Kana('ぬ','nu'),Kana('ね','ne'),Kana('の','no'),
  Kana('は','ha'),Kana('ひ','hi'),Kana('ふ','fu'),Kana('へ','he'),Kana('ほ','ho'),
  Kana('ま','ma'),Kana('み','mi'),Kana('む','mu'),Kana('め','me'),Kana('も','mo'),
  Kana('や','ya'),Kana('ゆ','yu'),Kana('よ','yo'),
  Kana('ら','ra'),Kana('り','ri'),Kana('る','ru'),Kana('れ','re'),Kana('ろ','ro'),
  Kana('わ','wa'),Kana('を','wo'),Kana('ん','n')
];

const kata = [
  Kana('ア','a'),Kana('イ','i'),Kana('ウ','u'),Kana('エ','e'),Kana('オ','o'),
  Kana('カ','ka'),Kana('キ','ki'),Kana('ク','ku'),Kana('ケ','ke'),Kana('コ','ko'),
  Kana('サ','sa'),Kana('シ','shi'),Kana('ス','su'),Kana('セ','se'),Kana('ソ','so'),
  Kana('タ','ta'),Kana('チ','chi'),Kana('ツ','tsu'),Kana('テ','te'),Kana('ト','to'),
  Kana('ナ','na'),Kana('ニ','ni'),Kana('ヌ','nu'),Kana('ネ','ne'),Kana('ノ','no'),
  Kana('ハ','ha'),Kana('ヒ','hi'),Kana('フ','fu'),Kana('ヘ','he'),Kana('ホ','ho'),
  Kana('マ','ma'),Kana('ミ','mi'),Kana('ム','mu'),Kana('メ','me'),Kana('モ','mo'),
  Kana('ヤ','ya'),Kana('ユ','yu'),Kana('ヨ','yo'),
  Kana('ラ','ra'),Kana('リ','ri'),Kana('ル','ru'),Kana('レ','re'),Kana('ロ','ro'),
  Kana('ワ','wa'),Kana('ヲ','wo'),Kana('ン','n')
];

class NihongoApp extends StatelessWidget {
  const NihongoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NIHONGO',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: bg,
        colorScheme: ColorScheme.fromSeed(seedColor: gold),
      ),
      home: const Shell(),
    );
  }
}

class Shell extends StatefulWidget {
  const Shell({super.key});
  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    final pages = const [Home(), Learn(), Flash(), Quiz(), Writing(), Profile()];
    return Scaffold(
      body: SafeArea(child: pages[i]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: i,
        onDestinationSelected: (v) => setState(() => i = v),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Beranda'),
          NavigationDestination(icon: Icon(Icons.menu_book_outlined), label: 'Belajar'),
          NavigationDestination(icon: Icon(Icons.style_outlined), label: 'Flash'),
          NavigationDestination(icon: Icon(Icons.quiz_outlined), label: 'Quiz'),
          NavigationDestination(icon: Icon(Icons.edit_outlined), label: 'Menulis'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profil'),
        ],
      ),
    );
  }
}

class Head extends StatelessWidget {
  final String t, s;
  const Head(this.t, this.s, {super.key});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(20,20,20,12),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(t, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800)),
      const SizedBox(height: 4),
      Text(s, style: TextStyle(color: Colors.grey.shade700)),
    ]),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) => ListView(children: const [
    Head('NIHONGO 日本語','Belajar Hiragana & Katakana'),
    CardItem(Icons.translate,'Hiragana & Katakana','46 karakter dasar tiap jenis'),
    CardItem(Icons.style,'Flashcard','Tandai sudah hafal atau belum'),
    CardItem(Icons.quiz,'Quiz','Latihan pilihan ganda'),
    CardItem(Icons.edit,'Menulis','Latihan menulis langsung di layar'),
  ]);
}

class CardItem extends StatelessWidget {
  final IconData icon; final String t,s;
  const CardItem(this.icon,this.t,this.s,{super.key});
  @override
  Widget build(BuildContext context)=>Padding(
    padding:const EdgeInsets.symmetric(horizontal:20,vertical:6),
    child:Card(color:Colors.white,elevation:0,child:ListTile(
      leading:CircleAvatar(backgroundColor:const Color(0xFFFFF1B8),child:Icon(icon,color:const Color(0xFF8A6D00))),
      title:Text(t,style:const TextStyle(fontWeight:FontWeight.w700)),
      subtitle:Text(s),
    )),
  );
}

class Learn extends StatefulWidget {
  const Learn({super.key});
  @override State<Learn> createState()=>_LearnState();
}
class _LearnState extends State<Learn>{
  bool h=true;
  @override Widget build(BuildContext context){
    final items=h?hira:kata;
    return Column(children:[
      const Head('Belajar Kana','Ketuk karakter untuk melihat romaji'),
      Padding(padding:const EdgeInsets.symmetric(horizontal:20),child:SegmentedButton<bool>(
        segments:const[ButtonSegment(value:true,label:Text('Hiragana')),ButtonSegment(value:false,label:Text('Katakana'))],
        selected:{h},onSelectionChanged:(v)=>setState(()=>h=v.first))),
      Expanded(child:GridView.builder(
        padding:const EdgeInsets.all(16),
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:4,mainAxisSpacing:10,crossAxisSpacing:10),
        itemCount:items.length,
        itemBuilder:(_,i){final k=items[i];return InkWell(
          onTap:()=>showModalBottomSheet(context:context,showDragHandle:true,builder:(_)=>Padding(
            padding:const EdgeInsets.all(28),
            child:Column(mainAxisSize:MainAxisSize.min,children:[
              Text(k.c,style:const TextStyle(fontSize:90)),
              Text(k.r.toUpperCase(),style:const TextStyle(fontSize:28,fontWeight:FontWeight.w900))
            ]))),
          child:Container(decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(18)),
            child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[Text(k.c,style:const TextStyle(fontSize:34)),Text(k.r)])));
        },
      ))
    ]);
  }
}

class Flash extends StatefulWidget {
  const Flash({super.key});
  @override State<Flash> createState()=>_FlashState();
}
class _FlashState extends State<Flash>{
  bool h=true, flip=false; int i=0; Set<String> known={};
  @override void initState(){super.initState();load();}
  Future<void> load()async{final p=await SharedPreferences.getInstance();setState(()=>known=(p.getStringList('known')??[]).toSet());}
  Future<void> save()async{final p=await SharedPreferences.getInstance();await p.setStringList('known',known.toList());}
  @override Widget build(BuildContext context){
    final items=h?hira:kata; final k=items[i]; final key='${h?'h':'k'}${k.c}';
    return ListView(children:[
      const Head('Hafalkan Kana','Putar kartu untuk melihat jawaban'),
      Padding(padding:const EdgeInsets.symmetric(horizontal:20),child:SegmentedButton<bool>(
        segments:const[ButtonSegment(value:true,label:Text('Hiragana')),ButtonSegment(value:false,label:Text('Katakana'))],
        selected:{h},onSelectionChanged:(v)=>setState((){h=v.first;i=0;flip=false;}))),
      const SizedBox(height:18),
      Padding(padding:const EdgeInsets.symmetric(horizontal:20),child:Container(
        height:330,decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(28)),
        child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
          Text(k.c,style:const TextStyle(fontSize:115)),
          if(flip)...[
            Text(k.r.toUpperCase(),style:const TextStyle(fontSize:30,fontWeight:FontWeight.w900)),
            const SizedBox(height:16),
            Wrap(spacing:8,children:[
              FilledButton.tonal(onPressed:()async{setState(()=>known.add(key));await save();},child:const Text('Sudah Hafal')),
              OutlinedButton(onPressed:()async{setState(()=>known.remove(key));await save();},child:const Text('Belum Hafal'))
            ])
          ]
        ]),
      )),
      Padding(padding:const EdgeInsets.all(20),child:FilledButton(
        style:FilledButton.styleFrom(backgroundColor:Colors.black87,padding:const EdgeInsets.all(15)),
        onPressed:()=>setState(()=>flip=!flip),child:Text(flip?'Tutup Kartu':'Putar Kartu'))),
      Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children:[
        TextButton(onPressed:i==0?null:()=>setState((){i--;flip=false;}),child:const Text('‹ Sebelumnya')),
        Text('${i+1} / ${items.length}'),
        TextButton(onPressed:i==items.length-1?null:()=>setState((){i++;flip=false;}),child:const Text('Selanjutnya ›')),
      ])
    ]);
  }
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override State<Quiz> createState()=>_QuizState();
}
class _QuizState extends State<Quiz>{
  bool h=true; final rnd=Random(); late Kana q; List<String> ops=[]; String? pick;
  @override void initState(){super.initState();next();}
  void next(){final items=h?hira:kata;q=items[rnd.nextInt(items.length)];final s=<String>{q.r};while(s.length<4){s.add(items[rnd.nextInt(items.length)].r);}ops=s.toList()..shuffle();pick=null;}
  @override Widget build(BuildContext context)=>ListView(children:[
    const Head('Quiz Kana','Pilih romaji yang benar'),
    Padding(padding:const EdgeInsets.symmetric(horizontal:20),child:SegmentedButton<bool>(
      segments:const[ButtonSegment(value:true,label:Text('Hiragana')),ButtonSegment(value:false,label:Text('Katakana'))],
      selected:{h},onSelectionChanged:(v)=>setState((){h=v.first;next();}))),
    const SizedBox(height:18),
    Center(child:Text(q.c,style:const TextStyle(fontSize:120))),
    ...ops.map((o)=>Padding(padding:const EdgeInsets.symmetric(horizontal:20,vertical:5),child:OutlinedButton(
      onPressed:pick!=null?null:()=>setState(()=>pick=o),
      child:Text(o.toUpperCase(),style:const TextStyle(fontSize:18,fontWeight:FontWeight.w800))
    ))),
    if(pick!=null)Padding(padding:const EdgeInsets.all(20),child:Column(children:[
      Text(pick==q.r?'Benar! ✅':'Jawaban benar: ${q.r.toUpperCase()}'),
      const SizedBox(height:8),
      FilledButton(onPressed:()=>setState(next),child:const Text('Soal Berikutnya'))
    ]))
  ]);
}

class Writing extends StatefulWidget {
  const Writing({super.key});
  @override State<Writing> createState()=>_WritingState();
}
class _WritingState extends State<Writing>{
  bool h=true; int i=0; final pts=<Offset?>[];
  @override Widget build(BuildContext context){final items=h?hira:kata;final k=items[i];return ListView(children:[
    const Head('Cara Menulis','Lihat karakter lalu coba tulis sendiri'),
    Padding(padding:const EdgeInsets.symmetric(horizontal:20),child:SegmentedButton<bool>(
      segments:const[ButtonSegment(value:true,label:Text('Hiragana')),ButtonSegment(value:false,label:Text('Katakana'))],
      selected:{h},onSelectionChanged:(v)=>setState((){h=v.first;i=0;pts.clear();}))),
    const SizedBox(height:16),
    Padding(padding:const EdgeInsets.symmetric(horizontal:20),child:Container(
      height:220,decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(28)),
      child:Center(child:Text(k.c,style:TextStyle(fontSize:145,color:Colors.grey.shade300))))),
    const Padding(padding:EdgeInsets.fromLTRB(20,18,20,8),child:Text('AREA LATIHAN',style:TextStyle(fontWeight:FontWeight.bold))),
    Padding(padding:const EdgeInsets.symmetric(horizontal:20),child:Container(
      height:280,decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(28)),
      child:GestureDetector(
        onPanStart:(d)=>setState(()=>pts.add(d.localPosition)),
        onPanUpdate:(d)=>setState(()=>pts.add(d.localPosition)),
        onPanEnd:(_)=>setState(()=>pts.add(null)),
        child:CustomPaint(painter:Draw(pts),child:const SizedBox.expand())
      ))),
    Padding(padding:const EdgeInsets.all(20),child:OutlinedButton.icon(onPressed:()=>setState(pts.clear),icon:const Icon(Icons.refresh),label:const Text('Hapus')))
  ]);}
}

class Draw extends CustomPainter{
  final List<Offset?> p; Draw(this.p);
  @override void paint(Canvas c,Size s){final x=Paint()..strokeWidth=7..strokeCap=StrokeCap.round..color=Colors.black87;for(int i=0;i<p.length-1;i++){if(p[i]!=null&&p[i+1]!=null)c.drawLine(p[i]!,p[i+1]!,x);}}
  @override bool shouldRepaint(covariant CustomPainter oldDelegate)=>true;
}

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override State<Profile> createState()=>_ProfileState();
}
class _ProfileState extends State<Profile>{
  int n=0;
  @override void initState(){super.initState();load();}
  Future<void> load()async{final p=await SharedPreferences.getInstance();setState(()=>n=(p.getStringList('known')??[]).length);}
  @override Widget build(BuildContext context)=>ListView(children:[
    const Head('Profil','Ringkasan belajar'),
    Padding(padding:const EdgeInsets.all(20),child:Container(
      padding:const EdgeInsets.all(20),decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(24)),
      child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
        const Text('NIHONGO',style:TextStyle(fontSize:22,fontWeight:FontWeight.w900)),
        const SizedBox(height:8),
        Text('$n karakter ditandai sudah hafal'),
        const SizedBox(height:4),
        const Text('Data disimpan lokal di perangkat.')
      ])
    ))
  ]);
}
