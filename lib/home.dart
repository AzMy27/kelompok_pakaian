import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:uas_flutter/about_developer.dart';
// import 'package:uas_flutter/detail_item.dart';
import 'package:uas_flutter/API_leagues.dart';
import 'package:uas_flutter/detail_leagues.dart';

class HomeHome extends StatefulWidget {
  const HomeHome({super.key});

  @override
  State<HomeHome> createState() => _HomeHomeState();
}

class _HomeHomeState extends State<HomeHome> {
  ApiLeagues? apiLeagues;
  bool isLoading = true;
  String? errorMessage;

  Future<void> getData() async {
    const String apiURL =
        "https://www.thesportsdb.com/api/v1/json/3/all_leagues.php"; // Updated API URL
    try {
      Response response = await Dio().get(apiURL);
      if (response.data != null) {
        setState(() {
          apiLeagues = ApiLeagues.fromJson(response.data);
          isLoading = false;
        });
      } else {
        throw Exception("API response is null");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = e.toString();
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UNTUK UAS'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AboutDeveloper();
                  },
                ),
              );
            },
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : errorMessage != null
              ? Center(child: Text(errorMessage!))
              : GridView.builder(
                  itemCount: apiLeagues?.leagues?.length ?? 0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    var league = apiLeagues!.leagues![index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailItem(data: league),
                          ),
                        );
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              league.strLeague ?? "",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              league.strSport ?? "",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
