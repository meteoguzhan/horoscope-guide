class Horoscope {
  final String _name;
  final String _date;
  final String _detail;
  final String _smallImage;
  final String _bigImage;

  Horoscope(this._name, this._date, this._detail, this._smallImage, this._bigImage);

  get name => _name;
  get date => _date;
  get detail => _detail;
  get smallImage => _smallImage;
  get bigImage => _bigImage;

  @override
  String toString() {
    return '$_name - $_bigImage';
  }
}
