import 'package:flutter/material.dart';
import 'package:uas_flutter/API_leagues.dart';

class DetailItem extends StatelessWidget {
  final Leagues data;
  const DetailItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Item'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Text(
              data.strLeagueAlternate ?? 'No Title',
              style: const TextStyle(
                fontSize: 21.0,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              width: screenSize.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // data.thumbnail != null
                  //     ? Image.network(data.thumbnail!)
                  //     : Container(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    '${data.strLeague}',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '${data.strSport}',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
