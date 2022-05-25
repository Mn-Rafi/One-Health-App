import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Map<int, Color> color = {
  50: const Color(0x0590EE90),
  100: const Color(0x5090EE90),
  200: const Color(0x6090EE90),
  300: const Color(0x7090EE90),
  400: const Color(0x75090EE90),
  500: const Color(0x8090EE90),
  600: const Color(0x8590EE90),
  700: const Color(0x9090EE90),
  800: const Color(0x9590EE90),
  900: const Color(0x9890EE90),
};

MaterialColor colorCustom = MaterialColor(0xFF90EE90, color);

class MyTheme {
  static ThemeData lightTheme = ThemeData(
      primarySwatch: colorCustom,
      textTheme: TextTheme(
        bodyText1: GoogleFonts.ubuntu(fontSize: 12),
        bodyText2: GoogleFonts.ubuntu(
            fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
      ));
}

const String yearsSvg =
    '''<svg width="108" height="112" viewBox="0 0 108 112" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M55.6479 106.581C68.493 104.692 78.7183 100.825 86.3239 94.9785C94.0141 89.1323 97.8592 81.6222 97.8592 72.4481C97.8592 68.6705 97.0563 65.2078 95.4507 62.0598C93.9296 58.9119 91.5211 56.3485 88.2254 54.3698C84.8451 52.3911 80.5352 51.1319 75.2958 50.5923C70.1408 49.9627 63.9296 50.2775 56.662 51.5366C56.0704 51.6266 55.6056 51.5366 55.2676 51.2668C55.0141 50.907 54.9718 50.3224 55.1408 49.5129L64.5211 6.20598C64.7746 5.12668 65.0704 4.27223 65.4085 3.64264C65.831 3.01305 66.5493 2.69825 67.5634 2.69825L100.141 0C100.732 0 101.113 0.179884 101.282 0.539652C101.535 0.809479 101.662 1.25919 101.662 1.88878L100.648 7.95985C100.394 9.48886 99.9296 10.6131 99.2535 11.3327C98.662 11.9623 97.9859 12.2771 97.2254 12.2771L70.2254 14.1658C69.4648 14.2558 68.8732 14.4806 68.4507 14.8404C68.1127 15.1102 67.9014 15.5599 67.8169 16.1895L64.1408 34.8075C63.9718 35.4371 64.0141 36.0217 64.2676 36.5613C64.5211 37.101 65.0282 37.3258 65.7887 37.2359C71.7042 37.2359 77.2394 37.7306 82.3944 38.7199C87.5493 39.6194 92.0282 41.2383 95.831 43.5768C99.6338 45.8253 102.592 48.9733 104.704 53.0207C106.901 56.9781 108 61.9699 108 67.996C108 74.9215 106.648 80.9926 103.944 86.2092C101.239 91.3359 97.5634 95.6981 92.9155 99.2957C88.2676 102.893 82.7747 105.727 76.4366 107.795C70.1831 109.954 63.4225 111.348 56.1549 111.978C55.3944 112.067 54.8873 111.888 54.6338 111.438C54.3803 111.078 54.2113 110.493 54.1268 109.684C53.9577 108.964 53.9577 108.29 54.1268 107.66C54.3803 107.121 54.8873 106.761 55.6479 106.581Z" fill="#737373" fill-opacity="0.66"/>
<path d="M0 103V92.2987C5.32054 85.6996 10.6411 79.0113 15.9616 72.2338C21.2822 65.4563 26.1871 58.4558 30.6763 51.2325C32.9209 47.5762 34.9161 43.6524 36.6619 39.461C38.4077 35.2697 39.2806 30.9446 39.2806 26.4857C39.2806 23.8104 38.8233 21.3134 37.9089 18.9948C36.9944 16.587 35.6227 14.6251 33.7938 13.1091C32.048 11.5931 29.8034 10.8351 27.06 10.8351C23.7346 10.8351 21.1575 11.9944 19.3285 14.313C17.5827 16.5424 16.3357 19.2623 15.5875 22.4727C14.9225 25.5939 14.5068 28.5814 14.3405 31.4351H1.1223C1.53797 25.4602 2.61871 20.1095 4.36451 15.3831C6.19345 10.6567 8.97842 6.91126 12.7194 4.14675C16.4604 1.38225 21.3653 0 27.4341 0C32.0064 0 36.1215 1.02554 39.7794 3.07662C43.5204 5.12771 46.4716 8.02597 48.6331 11.7714C50.8777 15.4277 52 19.7974 52 24.8805C52 29.2502 51.0855 33.8874 49.2566 38.7922C47.4277 43.697 45.0168 48.6463 42.024 53.6403C39.1143 58.545 35.9137 63.3606 32.4221 68.087C29.0136 72.8134 25.6051 77.2277 22.1966 81.3299C18.7882 85.432 15.7538 89.0883 13.0935 92.2987H52V103H0Z" fill="#737373"/>
</svg>''';