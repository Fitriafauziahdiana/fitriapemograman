import 'package:flutter/material.dart';

class ConsulPage extends StatefulWidget {
  const ConsulPage({super.key});

  @override
  State<ConsulPage> createState() => _ConsulPageState();
}

class _ConsulPageState extends State<ConsulPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 120, left: 24, right: 24),
        child: Center(
          child: Column(
            children: [
              Text(
                'FORMULIR KONSULTASI',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Isikan Data Informasi Diri dan Keluhan Yang Di Alami',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: Color(0xffF1F0F5),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Nama Lengkap*',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: Color(0xffF1F0F5),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Alamat Email*',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: Color(0xffF1F0F5),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Nomor Telepon*',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: Color(0xffF1F0F5),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Keluhan Yang Dirasa*',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
