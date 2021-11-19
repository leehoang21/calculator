import 'package:calculator_flutter/tinh_toan.dart';
import 'package:flutter/material.dart';

class ProviderCalculator extends ChangeNotifier {
  String _textPhepTinh = '', _kq = '';
  bool _daBamDauBang = false;

  String get textPhepTinh => _textPhepTinh;
  String get kq => _kq;
  bool get getDaBamDauBang => _daBamDauBang;

  void add(String text) {
    _textPhepTinh += text;
    notifyListeners();
  }

  void clear() {
    _textPhepTinh = '';
    _kq = '';
    notifyListeners();
  }

  void bamDauBang(String text) {
    if (text == '=') {
      _daBamDauBang = true;
      //tính kết quả
      _kq = Tinh(_textPhepTinh, _kq, _daBamDauBang).tinhToan();
    } else if (text == 'C') {
      clear();
      _daBamDauBang = false;
    } else if (text == '\$') {
      //tiếp tục tính toán sau khi bấm dấu bằng
      _kq = '';
      _daBamDauBang = false;
    } else {
      if (!_daBamDauBang) _textPhepTinh += text;
    }
    notifyListeners();
  }
}
