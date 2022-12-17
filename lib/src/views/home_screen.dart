import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_api/src/controllers/news_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef watch) {
    final viewModel = watch.watch(getDataFuture);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text('News Api'),
        ),
        body: viewModel.list.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: viewModel.list.length,
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.all(6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 6),
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(10)),
                          height: 150,
                          width: 150,
                          child: Image.network(
                            viewModel.list[i].images.main,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  viewModel.list[i].name.first +
                                      viewModel.list[i].name.middle +
                                      viewModel.list[i].name.last,
                                  style: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20)),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                  "Occupation: ${viewModel.list[i].occupation}",
                                  style: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12)),
                              Text("Age: ${viewModel.list[i].age}",
                                  style: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12)),
                              Text("Gender: ${viewModel.list[i].gender!.name}",
                                  style: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12)),
                              Text(viewModel.list[i].species,
                                  style: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12)),
                              Text(viewModel.list[i].sayings.toString(),
                                  style: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10)),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }));
  }
}
