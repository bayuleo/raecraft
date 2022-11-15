import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<String> list = <String>['3', '6', '9', '12', '15', '18'];
String thickness = '';
int w = 0;
int h = 0;
int t = 0;
String result = '';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raecraft',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xffC8BCB4),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 80, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Choose Your Best \nSize',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff3D3A37),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8, bottom: 16),
                child: Text(
                  'high quality multiplek',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff3D3A37)),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: InputTextCustomWidget(
                        hintText: 'Width',
                        onChanged: (String value) {
                          w = int.tryParse(value) ?? 0;
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: InputTextCustomWidget(
                        hintText: 'Height',
                        onChanged: (String value) {
                          h = int.tryParse(value) ?? 0;
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ],
              ),
              InputTextCustomWidget(
                hintText: 'Thick',
                onChanged: (String value) {
                  t = int.tryParse(value) ?? 0;
                  setState(() {});
                },
              ),
              //     }),
              ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  generateResult();
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: const Color(0xffBC9271),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Color(0xff3D3A37),
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(text: result)).then(
                      (_) => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Copied'),
                        ),
                      ),
                    );
                  },
                  child: Text(result),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void generateResult() {
  int price = 0;
  switch (t) {
    case 3:
      price = 6;
      break;
    case 6:
      price = 8;
      break;
    case 9:
      price = 11;
      break;
    case 12:
      price = 14;
      break;
    case 15:
      price = 16;
      break;
    case 18:
      price = 19;
      break;
    default:
      price = 0;
      break;
  }
  result =
      'Lebar : $w cm\nPanjang : $h cm\nTebal : $t mm (Rp$price/cm²)\n\nLuas : ${w}cm x ${h}cm = ${w * h}cm²\nHarga : ${w * h}cm² x Rp$price = Rp${w * h * price},-\n\nJumlah pcs checkout = Rp${w * h * price} / 100 = ${(w * h * price / 100).ceil()} pcs\n\n*Jangan lupa tulis catatan ukuran (${w}cm x ${h}cm) ketika melakukan checkout produk.';
}

class InputTextCustomWidget extends StatelessWidget {
  const InputTextCustomWidget({
    Key? key,
    this.hintText,
    this.onChanged,
  }) : super(key: key);

  final String? hintText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
