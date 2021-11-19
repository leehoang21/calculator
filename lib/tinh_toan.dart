class Tinh {
  String _textPhepTinh = '', _kq = '';
  bool _daBamDauBang = false;
  Tinh(this._textPhepTinh, this._kq, this._daBamDauBang);

  String tinhToan() {
    int dem = -1;
    String ketQua = '', tmp = '', toanTu = '';
    try {
      for (var i = dem + 1; i < _textPhepTinh.length; i++) {
        var kiTuTrongChuoiLa1So = '0'.compareTo(_textPhepTinh[i]) <= 0 &&
            '9'.compareTo(_textPhepTinh[i]) >= 0;
        var kiTuTrongChuoiLaDauCham = '.'.compareTo(_textPhepTinh[i]) == 0;
        var kiTuDauLaDauTruHoacCong = ('-'.compareTo(_textPhepTinh[i]) == 0 ||
                '+'.compareTo(_textPhepTinh[i]) == 0) &&
            i == 0;
        if (kiTuTrongChuoiLa1So ||
            kiTuTrongChuoiLaDauCham ||
            kiTuDauLaDauTruHoacCong) {
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
