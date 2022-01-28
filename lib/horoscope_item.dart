import 'package:burc_rehberi/horoscope_detail.dart';
import 'package:flutter/material.dart';
import 'model/horoscope.dart';

class HoroscopeItem extends StatelessWidget {
  final Horoscope listedHoroscope;

  const HoroscopeItem({required this.listedHoroscope, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        HoroscopeDetail(selectedHoroscope: listedHoroscope),
                  ),
                );
              },
              leading: Image.asset('images/' + listedHoroscope.smallImage),
              title: Text(listedHoroscope.name, style: myTextStyle.headline6),
              subtitle:
                  Text(listedHoroscope.date, style: myTextStyle.subtitle2),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.pink),
            ),
          )),
    );
  }
}
