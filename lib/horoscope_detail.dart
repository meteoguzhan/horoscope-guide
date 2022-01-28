import 'package:flutter/material.dart';
import 'package:burc_rehberi/model/horoscope.dart';
import 'package:palette_generator/palette_generator.dart';

class HoroscopeDetail extends StatefulWidget {
  final Horoscope selectedHoroscope;

  const HoroscopeDetail({required this.selectedHoroscope, Key? key})
      : super(key: key);

  @override
  State<HoroscopeDetail> createState() => _HoroscopeDetailState();
}

class _HoroscopeDetailState extends State<HoroscopeDetail> {
  Color appBarColor = Colors.transparent;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();
    appBarColorFind();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appBarColor,
            flexibleSpace: FlexibleSpaceBar(
              title:
                  Text(widget.selectedHoroscope.name + ' Burcu ve Özellikleri'),
              centerTitle: true,
              background: Image.asset(
                'images/' + widget.selectedHoroscope.bigImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Text(
                  widget.selectedHoroscope.detail,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void appBarColorFind() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage('images/${widget.selectedHoroscope.bigImage}'));
    setState(() {});
    appBarColor = _generator.dominantColor!.color;
  }
}
