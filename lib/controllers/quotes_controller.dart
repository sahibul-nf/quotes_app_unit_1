import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotes_app_unit_1/models/quote_api_model.dart';
import 'package:quotes_app_unit_1/repositories/quotes_repository.dart';

class QuotesController {
  final QuotesRepository quotesRepository;

  QuotesController({required this.quotesRepository});

  Future<List<QuoteApi>> getRandomQuotes() async {
    final result = await quotesRepository.fetchRandomQuotes();

    return result;
  }
}

final getRandomQuotesProvider = FutureProvider<List<QuoteApi>>((ref) async {
  final repo = ref.watch(quotesRepositoryProvider);
  final controller = QuotesController(quotesRepository: repo);

  return await controller.getRandomQuotes();
});
