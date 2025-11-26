import "package:flutter/material.dart";
import 'package:get/get.dart';
import '/controllers/theme_controller.dart';

class SettingPage extends StatefulWidget {

  const SettingPage({super.key,});

  @override
  State<SettingPage> createState() => _SettingPageState();
}
class _SettingPageState extends State<SettingPage> {
  //thema
  final controller = Get.find<ThemeController>();

  //toggel
  bool isWifiOn = false;

  //single checkbox (hanya satu pilihan)
  int selectedOption = 1;

  //multiple checkbox
  bool micAccess = true;
  bool locationAccess = true;
  bool haptics = false;

  String? nilaiTerpilih;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Settings", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Obx(() => Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SwitchListTile(
                  title: Text("Dark Mode"),
                  value: controller.isDark.value,
                  onChanged: (value) {
                    controller.toggleTheme();
                  },
                ),
                Text(
                  "Toggle",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 5),
                Text("Celuler Data", style: TextStyle(fontSize: 18)),
                SizedBox(height: 5),
                SwitchListTile(
                  title: Text("WIFI"),
                  value: isWifiOn,
                  onChanged: (value) {
                    setState(() {
                      isWifiOn = value;
                    });
                  },
                ),
                SizedBox(height: 5),
                Text(
                  "Single Checkbox",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 5),
                RadioListTile(
                  title: Text("Allow Notifications"),
                  value: 1,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text("Turn off Notifications"),
                  value: 2,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
                SizedBox(height: 5),
                Text(
                  "Multiple Checkbox",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 5),
                CheckboxListTile(
                  title: Text("Microphone Access"),
                  value: micAccess,
                  onChanged: (value) {
                    setState(() {
                      micAccess = value!;
                    });
                  },
                ),
                SizedBox(height: 5),
                CheckboxListTile(
                  title: Text("Location Access"),
                  value: locationAccess,
                  onChanged: (value) {
                    setState(() {
                      locationAccess = value!;
                    });
                  },
                ),
                SizedBox(height: 5),
                CheckboxListTile(
                  title: Text("Haptics"),
                  value: haptics,
                  onChanged: (value) {
                    setState(() {
                      haptics = value!;
                    });
                  },
                ),
                Card(
                  child: ExpansionTile(title: Text("Roy Agung Pamungkas"),
                    subtitle: Text("Programmer"),
                    childrenPadding: EdgeInsets.all(16),
                    children: [
                      tampilData("Gaji", "10.000.000"),
                      tampilData("Tunjangan", "1.000.000"),
                      tampilData("Lama Kerja", "2 Tahun"),
                    ],
                    )
                ),
                SizedBox(height: 10),
                DropdownButton(
                  value: nilaiTerpilih, 
                  hint: Text("Pilih Nilai"),
                  items: [
                    DropdownMenuItem(child: Text("menu 1"), value: "menu1",),
                    DropdownMenuItem(child: Text("menu 2"), value: "menu2",),
                    DropdownMenuItem(child: Text("menu 3"), value: "menu3",),
                  ],
                  onChanged: (value) {
                    setState(() { 
                    nilaiTerpilih = value;
                    if (value == 'menu1') {
                      debugPrint('Menu 1 dipilih');
                    } else if (value == 'menu2') {
                      debugPrint('Menu 2 dipilih');
                    } else if (value == 'menu3') {
                      debugPrint('Menu 3 dipilih');
                    
                    }
                    }
                    );
                  })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget tampilData(String labelData, String value) {
  return Padding(padding: EdgeInsets.all(10),
    child: Row(
      children: [
        SizedBox(
          width: 100, child: Text(labelData),),
          Expanded(child: Text(value),),
      ],
    ),
    );
}
