import 'package:flutter/material.dart';

String setAqi(val) {
  if (val >= 0 && val <= 50) {
    return 'Sangat Bagus';
  } else if (val >= 51 && val <= 100) {
    return 'Bagus';
  } else if (val >= 101 && val <= 150) {
    return 'Sedang';
  } else if (val >= 151 && val <= 200) {
    return 'Tidak Sehat';
  } else if (val >= 201 && val <= 300) {
    return 'Sangat Tidak Sehat';
  } else {
    return 'Berbahaya';
  }
}

Color setColor(val) {
  if (val == 'p1') {
    return Color(0xff52b947);
  } else if (val == 'p2') {
    return Color(0xfff3ec19);
  } else if (val == 'p3') {
    return Color(0xff7e2b7d);
  } else if (val == 'p4') {
    return Color(0xffed1d24);
  } else if (val == 'p5') {
    return Color(0xfff57e20);
  } else {
    return Color(0xff480d27);
  }
}

Color setColorDark(val) {
  if (val == 'p1') {
    return Color(0xff398232);
  } else if (val == 'p2') {
    return Color(0xfff3c519);
  } else if (val == 'p3') {
    return Color(0xfff55020);
  } else if (val == 'p4') {
    return Color(0xfff58d20);
  } else if (val == 'p5') {
    return Color(0xff472b7e);
  } else {
    return Color(0xff3a0d48);
  }
}

setGradient(val) {
  if (val == '50d') {
    return [Color(0xff2c3e50), Color(0xffbdc3c7)];
  } else if (val == '01d') {
    return [Color(0xffF7971E), Color(0xffFFD200)];
  } else if (val == '01n') {
    return [Color(0xff203A43), Color(0xff2C5364)];
  } else if (val == '02n') {
    return [Color(0xff0F2027), Color(0xff203A43)];
  } else if (val == '02d') {
    return [Color(0xff3B4371), Color(0xffF3904F)];
  } else {
    return [Color(0xffF7971E), Color(0xffFFD200)];
  }
}

setWeather(val) {
  if (val == '01d' || val == '01n') {
    return 'Langit Cerah';
  } else if (val == '02d' || val == '02n') {
    return 'Sedikit Berawan';
  } else if (val == '03d') {
    return 'Berawan';
  } else if (val == '04d') {
    return 'Berawan Gelap';
  } else if (val == '09d') {
    return 'Hujan';
  } else if (val == '10d') {
    return 'Hujan Siang Hari';
  } else if (val == '10n') {
    return 'Hujan Malam Hari';
  } else if (val == '11d') {
    return 'Hujan Badai';
  } else if (val == '13d') {
    return 'Salju';
  } else {
    return 'Kabut';
  }
}

setImage(val) {
  if (val == '01d') {
    return 'weather-icons/Sunny.png';
  } else if (val == '01n') {
    return 'weather-icons/Clear.png';
  } else if (val == '02d') {
    return 'weather-icons/PartlyCloudyDay.png';
  } else if (val == '02n') {
    return 'weather-icons/PartlyCloudyNight.png';
  } else if (val == '03d') {
    return 'weather-icons/Mist.png';
  } else if (val == '04d') {
    return 'weather-icons/Overcast.png';
  } else if (val == '09d') {
    return 'weather-icons/ModRain.png';
  } else if (val == '10d') {
    return 'weather-icons/ModRainSwrsDay.png';
  } else if (val == '10n') {
    return 'weather-icons/ModRainSwrsNight.png';
  } else if (val == '11d') {
    return 'weather-icons/CloudRainThunder.png';
  } else if (val == '13d') {
    return 'weather-icons/OccLightSnow.png';
  } else {
    return 'weather-icons/wind.png';
  }
}
