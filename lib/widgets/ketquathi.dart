// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:day2/widgets/webview_gsheet.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

const _credentials = r'''
{
  "type": "service_account",
  "project_id": "bangdiem",
  "private_key_id": "e8cdc948a6ef8b3aff4eb1ea4a386b451d7028c3",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC35AkMkC02Das2\ns24QupGth5vT1EvSh01jUUzL6Pe4fxWtjy8TztxMV3bvWHQqYnB2iFAG62zRDNch\nMUYMzMig9d/Hfx7ytlsTIpoK8nY35Gsy/JXaLLaP9rS9gBkc+9G4RImHzEVI42/r\nQccMmYzAk6aFOUzK6c4gL8FY9EXD4DbYdYdHbktF//XacAIFSZMrp9pWJeYKMRdQ\nr9m1bgYwSrVN4ZRUCEL76sAJ5l8Z1Ryj0ZxgL8xlffCbqRCK0gDsiSh4kiy78iZw\nyq5xxua3FPWTv+k98WXQX2fMnY15PPDlMHIj2yvro0ot8nHlaverpnpF671dx0XB\nddnk7GTdAgMBAAECggEAC6eCoU6z5tSX8MgPZjUEzYwmJpcyVP3pPC2nYdb6eDFp\ntM25zJYUJSx357Rh7Fu/x+tcswuRonAfZEWkrGQAJR9gFtsqIXTIMd7EB4SVVHaA\nCsOyVZj22wnmK4pmTQ1ynayOUNJz46oyaiUJkfVbU8snxxK6GLQXsbeFF/enQkIk\ngN9Nzm9TX6LtGCjT3TwmNQJjs56ZmuUfkV6pdTLzVxze02ojgLEV5MG55ho9O/bf\nkuNt4drpn67wB9LYgQ/XMF0Aftt5dGayjF/pPvg/r1LIbHNUuokFvNvF2Cuhfymt\n/FXiWdtfOFebC0Br49DWnkt8kvLlRmFnXJaxRcXEsQKBgQDiXIghYVOeIoVlqr3z\nLmRJU4QD2wCvy4zrKlU0s+YtOOW7kscGOO3FW7MndvQoQzcZgJ+2G9f8L+Bl07mW\nqOOjbW1ogzyOKQUz4zDaiLqMATGK8ltSQF/QkvzPnqnT+OCoTo8ESZzHoc/rYePN\ntZnvJc6rlCSPib+W27j/N2rMFQKBgQDP9+rkDO0MLoYTH8SMBArT3Za2Rry6JLW1\nuBNIOTFHcVtNeZaRwLXtqCE+abQ4Pk+kLEkuRQidK4DmSuLaAfW+9ZbnoQUa7gMr\nf8wVX7IMxNY2IlEx00WSCshHgMprRM94Qw/WF8W0xSrmEDo1WlSYxVIBo7opCNcJ\n1wjT3oi/qQKBgBEuEK7n4h7IY/N5Z/1C8h2Wlxhr0LuG6WUXy2u6k6eu/9CirTRN\nsc4ezZQbNSCxKUdoObbqmhPr1k4kKZvDqbNHpNwfycLIXjq37YdIhVAG7ymqhz/Q\n3vTHkyR22FDcPMDJZZVfuOR15X/p6A4+0DYUWoEvNy8lt0LN3laQcCyZAoGBAJWT\nmj2rjlLUo1nd319VCPSYy20OM28uOAMbAcNQX0EjJqfya3kpQbBM3JwnKpfJOT67\nG2dL/4YLZAo+kip6fmV5/a9bAHD9/wmqQP6edVD5wZft1rgfXEpNtv62gt/j/dRh\nZ2J0dp4tsU0HHtaAwZefU/wZ5irdUMyi/JZl17UBAoGAadnXYZwaN9Kss1w83kzh\n/mYdKkKViTzM1+h0qdVJt9VYpeRv9M/gHKk1ThBgFsVOBppEVb9Y4VrxZxXESlhe\nJr8M4V6U+aD46X5o7qyfo+QvvnxO2ouBdzqevoSfIXlcmFMo6h5mXEe54IwKjURp\nunZWnrf/6i+r90R3Y43kG5w=\n-----END PRIVATE KEY-----\n",
  "client_email": "bang-diem-gsheets@bangdiem.iam.gserviceaccount.com",
  "client_id": "112614174885423072456",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/bang-diem-gsheets%40bangdiem.iam.gserviceaccount.com"
}
''';

const _spreadsheetId = '1Io9rLOuL9PQ2QIKYIS6Xmtu5C4k3HbWdPZl8s7Lh-YE';

class KetQuaThi extends StatefulWidget {
  final String HoTen;
  final String Lop;
  final String DeThi;
  final String Diem;

  const KetQuaThi(this.HoTen, this.Lop, this.DeThi, this.Diem);

  @override
  State<KetQuaThi> createState() => _KetQuaThiState();
}

class _KetQuaThiState extends State<KetQuaThi> {
  String TabSheet = '';
  late Timer _timer;
  int _start = 6;
  String CheckGui = "Gửi kết quả bài thi lên Server";

  Future GuiKetQua() async {
    if (widget.Lop == "Lớp 11A4") {
      if (widget.DeThi == "Kiểm tra 15 phút lần 1") {
        TabSheet = "11A4-151";
      } else if (widget.DeThi == "Kiểm tra 15 phút lần 2") {
        TabSheet = "11A4-152";
      } else {
        TabSheet = "11A4-GK";
      }
    } else {
      if (widget.DeThi == "Kiểm tra 15 phút lần 1") {
        TabSheet = "11A9-151";
      } else if (widget.DeThi == "Kiểm tra 15 phút lần 2") {
        TabSheet = "11A9-152";
      } else {
        TabSheet = "11A9-GK";
      }
    }
    ;
    final gsheets = GSheets(_credentials);
    final ss = await gsheets.spreadsheet(_spreadsheetId);
    var sheet1 = ss.worksheetByTitle(TabSheet.toString());
    // sheet ??= await ss.addWorksheet('trang1');

    await sheet1!.values.appendRow([
      widget.HoTen.toString(),
      widget.Lop.toString(),
      widget.Diem.toString()
    ]);

    //await sheet1!.values.insertValue(widget.Diem.toString(), column: 1, row: 2);

    // var sheet2 = ss.worksheetByTitle("Feed");
    // await sheet2!.values.insertValue(widget.Diem.toString(), column: 2, row: 2);

    // await sheet!.values.insertValue(widget.Diem.toString(), column: 3, row: 2);
    //await sheet!.values.insertValue('hello', column: 1, row: 1);
    //await sheet.values.insertColumns(DD, values)
    //  final cell = await sheet.cells.cell(column: 2, row: 2);
    // prints 'new'
    // ignore: avoid_print
    // print(cell.value);
  }

  @override
  bool issendresult = false;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Kết quả thi"),
      ),
      body: Container(
          //color: Colors.yellowAccent,
          child: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Image.asset(
              "assets/images/finish.jpeg",
              height: 250,
            ),
            Text(
              "CHÚC MỪNG",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              widget.HoTen.toUpperCase() + " " + widget.Lop.toUpperCase(),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text("ĐÃ HOÀN THÀNH VỚI SỐ ĐIỂM LÀ " + widget.Diem.toUpperCase(),
                style: TextStyle(
                  fontSize: 18,
                )),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: issendresult
                    ? Text(
                        _start.toString(),
                        style: TextStyle(fontSize: 16),
                      )
                    : Text(
                        CheckGui,
                        style: TextStyle(fontSize: 16),
                      ),
              ),
              onPressed: () {
                GuiKetQua();
                issendresult = true;
                const oneSec = const Duration(seconds: 1);
                _timer = new Timer.periodic(
                  oneSec,
                  (Timer timer) {
                    if (_start == 0) {
                      setState(() {
                        timer.cancel();
                        CheckGui = "Đã gửi thành công";
                        issendresult = false;
                      });
                    } else {
                      setState(() {
                        _start--;
                      });
                    }
                  },
                );
              },
              color: issendresult ? Colors.red : Colors.green,
              textColor: Colors.white,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.grey,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Xem kết quả của lớp từ Server",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              onPressed: () {
                // GuiKetQua();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WebViewGsheet()));
              },
              color: Colors.green,
              textColor: Colors.white,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.grey,
            ),
          ],
        ),
      )),
    );
  }
}
