class ApiLeagues {
  List<Leagues>? leagues;

  ApiLeagues({this.leagues});

  ApiLeagues.fromJson(Map<String, dynamic> json) {
    if (json['leagues'] != null) {
      leagues =
          (json['leagues'] as List).map((i) => Leagues.fromJson(i)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.leagues != null) {
      data['leagues'] = this.leagues!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Leagues {
  String? idLeague;
  String? strLeague;
  String? strSport;
  String? strLeagueAlternate;

  Leagues(
      {this.idLeague, this.strLeague, this.strSport, this.strLeagueAlternate});

  Leagues.fromJson(Map<String, dynamic> json) {
    idLeague = json['idLeague'];
    strLeague = json['strLeague'];
    strSport = json['strSport'];
    strLeagueAlternate = json['strLeagueAlternate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idLeague'] = this.idLeague;
    data['strLeague'] = this.strLeague;
    data['strSport'] = this.strSport;
    data['strLeagueAlternate'] = this.strLeagueAlternate;
    return data;
  }
}
