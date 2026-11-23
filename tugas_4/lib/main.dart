import 'package:flutter/material.dart';
import 'api_service.dart';
import 'article_model.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Berita',
      debugShowCheckedModeBanner: false,
      home: NewsScreenApp(),
    );
  }
}

class NewsScreenApp extends StatefulWidget {
  const NewsScreenApp({super.key});

  @override
  State<NewsScreenApp> createState() => _NewsScreenAppState();
}

class _NewsScreenAppState extends State<NewsScreenApp> {
  late Future<List<Article>> _articlesFuture;
  late final ScrollController _scrollController;
  bool _showBackToTopButton = false;

  @override
  void initState() {
    super.initState();
    _articlesFuture = ApiService().fetcArticles();
    _scrollController = ScrollController()
      ..addListener(() {
        final show = _scrollController.offset >= 300;
        if (show != _showBackToTopButton) {
          setState(() {
            _showBackToTopButton = show;
          });
        }
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _refreshArticles() async {
    setState(() {
      _articlesFuture = ApiService().fetcArticles();
    });
    try {
      await _articlesFuture;
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Berita',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      floatingActionButton: _showBackToTopButton
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: Colors.redAccent,
              tooltip: 'Kembali ke atas',
              child: const Icon(Icons.arrow_upward, color: Colors.white),
            )
          : null,
      body: RefreshIndicator(
        onRefresh: _refreshArticles,
        child: FutureBuilder<List<Article>>(
          future: _articlesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Center(child: Text('Error: ${snapshot.error}')),
                  ),
                ],
              );
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              final articles = snapshot.data!;
              return ListView.builder(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return Card(
                    child: Column(
                      children: [
                        if (article.urlToImage != null)
                          Image.network(
                            article.urlToImage!,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.image_not_supported);
                            },
                          ),
                        Text(
                          article.title,
                        ),
                        Text(
                          article.description ?? 'Tidak ada deskripsi',
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: const Center(
                      child: Text('Tidak ada berita yang ditemukan'),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
