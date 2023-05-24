import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:quotes_app_unit_1/models/quote_api_model.dart';

class QuotesRepository {
  // Fungsi untuk fetch data quotes
  Future<List<QuoteApi>> fetchRandomQuotes() async {
    // url endpoint API
    const url = "https://api.quotable.io/quotes/random?limit=20";

    // send request ke API
    final response = await http.get(Uri.parse(url));

    // cek response status
    if (response.statusCode != 200) {
      // cek error
      throw "Gagal mengambil data quotes";
    }

    // decode response json
    List json = jsonDecode(response.body);

    print(json);

    List<QuoteApi> quotes = [];

    for (var item in json) {
      final quote = QuoteApi.fromJson(item);
      quotes.add(quote);
    }

    return quotes;
  }
}

final quotesRepositoryProvider = Provider<QuotesRepository>((ref) {
  return QuotesRepository();
});
