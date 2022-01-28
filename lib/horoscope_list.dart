import 'package:burc_rehberi/horoscope_item.dart';
import 'package:flutter/material.dart';
import 'data/strings.dart';
import 'model/horoscope.dart';

class HoroscopeList extends StatelessWidget {
  late List<Horoscope> allHoroscope;

  HoroscopeList({Key? key}) : super(key: key) {
    allHoroscope = prepareDataSource();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Burçlar Listesi')),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return HoroscopeItem(listedHoroscope: allHoroscope[index]);
          },
          itemCount: allHoroscope.length,
        ),
      ),
    );
  }

  List<Horoscope> prepareDataSource() {
    List<Horoscope> temporary = [];
    for (int i = 0; i < 12; i++) {
      var name = Strings.BURC_ADLARI[i];
      var date = Strings.BURC_TARIHLERI[i];
      var detail = Strings.BURC_GENEL_OZELLIKLERI[i];
      var smallImage = Strings.BURC_ADLARI[i].toLowerCase() + '${i + 1}.png';
      var bigImage =
          Strings.BURC_ADLARI[i].toLowerCase() + '_buyuk${i + 1}.png';

      Horoscope addHoroscope =
          Horoscope(name, date, detail, smallImage, bigImage);
      temporary.add(addHoroscope);
    }
    return temporary;
  }
}
