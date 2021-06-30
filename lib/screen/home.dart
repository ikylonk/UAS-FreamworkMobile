import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rest_api_cuaca/service/state_manager.dart';
import 'package:rest_api_cuaca/utils/settings.dart';

class Home extends StatelessWidget {
  final time = new DateFormat('EEEE dd, MMM', 'id_ID');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, watch, child) {
          final responseAsyncValue = watch(airData);
          return responseAsyncValue.map(
              data: (_) => Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors:
                              setGradient(_.data.value.data.current.weather.ic),
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: MediaQuery.of(context).size.height / 5,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _.data.value.data.city.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                time.format(
                                    _.data.value.data.current.weather.ts),
                                style: TextStyle(color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Image.asset(
                                  setImage(
                                      _.data.value.data.current.weather.ic),
                                  scale: 1.5,
                                ),
                              ),
                              Text(
                                '${_.data.value.data.current.weather.tp}\u2103',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  setWeather(
                                      _.data.value.data.current.weather.ic),
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        DraggableScrollableSheet(
                          initialChildSize: 0.25,
                          minChildSize: 0.12,
                          expand: true,
                          builder: (BuildContext context, scrollController) {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15))),
                              child: ListView(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                controller: scrollController,
                                children: [
                                  Center(
                                    child: Container(
                                      height: 8,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: setColor(_.data.value.data
                                            .current.pollution.mainus),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: setColor(_.data.value.data
                                                  .current.pollution.mainus),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                          width: 80,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Column(
                                            children: [
                                              Text(
                                                'Index AQI',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                '${_.data.value.data.current.pollution.aqius}',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Kualitas Udara'),
                                            Text(
                                              setAqi(_.data.value.data.current
                                                  .pollution.aqius),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  ListTile(
                                    title: Text('Kelembapan'),
                                    trailing: Text(
                                        '${_.data.value.data.current.weather.hu}%'),
                                  ),
                                  ListTile(
                                    title: Text('Angin'),
                                    trailing: Text(
                                        '${_.data.value.data.current.weather.ws} m/s'),
                                  ),
                                  ListTile(
                                    title: Text('Tekanan'),
                                    trailing: Text(
                                        '${_.data.value.data.current.weather.pr} mb'),
                                  )
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
              loading: (_) => Center(
                    child: CircularProgressIndicator(),
                  ),
              error: (_) => Text(
                    _.error.toString(),
                    style: TextStyle(color: Colors.red),
                  ));
        },
      ),
    );
  }
}
