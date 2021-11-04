import 'dart:ui';
import 'mau.dart';
import 'phim_bam.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppCalculator());
}

class AppCalculator extends StatefulWidget {
  const AppCalculator({Key? key}) : super(key: key);

  @override
  _AppCalculatorState createState() => _AppCalculatorState();
}

class _AppCalculatorState extends State<AppCalculator> {
  String _textPhepTinh = '', _kq = '';
  bool daBamDauBang = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                  left: 10,
                  right: 10,
                ),
                decoration: const BoxDecoration(
                  color: Mau.mauDenXam,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(),
                    manHinh(_textPhepTinh, Alignment.bottomRight, 2),
                    thanhChan(),
                    manHinh(_kq, Alignment.topRight, 1),
                    const SizedBox(),
                  ],
                ),
              ),
            ),
            hangPhim('C', '\$', '%', '/'),
            hangPhim('7', '8', '9', '-'),
            hangPhim('4', '5', '6', '+'),
            hangPhim('1', '2', '3', '*'),
            hangPhim('0', '0', '.', '='),
          ],
        ),
      ),
    );
  }

  Expanded manHinh(String text, Alignment ali, int chiSoFlex) {
    return Expanded(
      child: Container(
        alignment: ali,
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 30,
          right: 40,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      flex: chiSoFlex,
    );
  }

  Container thanhChan() {
    return Container(
      margin: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      color: Colors.white,
      height: 2,
    );
  }

  Row hangPhim(String text1, String text2, String text3, String text4) {
    return Row(
      children: [
        phimVuong(text1),
        if (text1 != '0') phimVuong(text2),
        phimVuong(text3),
        phimTron(text4),
      ],
    );
  }

  Phim phimTron(String text4) {
    return Phim(
      mauNut: Mau.mauVangCam,
      mauText: Colors.black,
      hinhDangNut: const CircleBorder(),
      text: text4,
      onPressed: onPressed,
    );
  }

  Phim phimVuong(String text) {
    return Phim(
      mauNut: Mau.mauDenXam,
      text: text,
      onPressed: onPressed,
    );
  }

  onPressed(String text) {
    setState(() {
      if (text == '=') {
        daBamDauBang = true;
        //tính kết quả
        _kq = tinhToan();
      } else if (text == 'C') {
        clear();
        daBamDauBang = false;
      } else if (text == '\$') {
        //tiếp tục tính toán sau khi bấm dấu bằng
        _kq = '';
        daBamDauBang = false;
      } else {
        if (!daBamDauBang) _textPhepTinh += text;
      }
    });
  }

  void clear() {
    _textPhepTinh = '';
    _kq = '';
  }

  String tinhToan() {
    int dem = -1;
    String ketQua = '', tmp = '', toanTu = '';
    try {
      for (var i = dem + 1; i < _textPhepTinh.length; i++) {
        var kiTuTrongChuoiLa1So = '0'.compareTo(_textPhepTinh[i]) <= 0 &&
            '9'.compareTo(_textPhepTinh[i]) >= 0;
        var kiTuTrongChuoiLaDauCham = '.'.compareTo(_textPhepTinh[i]) == 0;
        if (kiTuTrongChuoiLa1So || kiTuTrongChuoiLaDauCham) {
          if (toanTu == '') {
            ketQua += _textPhepTinh[i];
          } else {
            tmp += _textPhepTinh[i];
          }
        } else if (_textPhepTinh[i] == '%') {
          if (toanTu == '') {
            ketQua = tinhPhanTram(ketQua);
          } else {
            tmp = tinhPhanTram(tmp);
          }
        } else {
          dem = i;
          if (tmp != '') ketQua = thucHIenTinhToan(toanTu, ketQua, tmp);
          tmp = '';
          toanTu = _textPhepTinh[i];
        }
      }
      ketQua = thucHIenTinhToan(toanTu, ketQua, tmp);
    } catch (e) {
      ketQua = 'lỗi rồi';
      print(ketQua);
    }
    return ketQua;
  }

  String thucHIenTinhToan(String toanTu, String ketQua, String tmp) {
    if (toanTu == '+') {
      ketQua = (double.parse(ketQua) + double.parse(tmp)).toString();
    } else if (toanTu == '-') {
      ketQua = (double.parse(ketQua) - double.parse(tmp)).toString();
    } else if (toanTu == '*') {
      ketQua = (double.parse(ketQua) * double.parse(tmp)).toString();
    } else if (toanTu == '/') {
      ketQua = (double.parse(ketQua) / double.parse(tmp)).toString();
    }
    return ketQua;
  }

  String tinhPhanTram(String soCanTinh) =>
      (double.parse(soCanTinh) / 100).toString();
}
