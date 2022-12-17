import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_api/src/controllers/news_controller.dart';
import 'package:readmore/readmore.dart';

import '../widgets/app_text.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: avoid_renaming_method_parameters
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(getDataFuture);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: const AppText(
            text: 'News Api',
            size: 25,
          ),
          centerTitle: true,
        ),
        body: viewModel.list.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: viewModel.list.length,
                itemBuilder: (context, i) {
                  return Container(
                    margin: const EdgeInsets.all(6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 6),
                          decoration: BoxDecoration(
                              color: Colors.deepOrangeAccent.withOpacity(0.5),
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
                              AppText(
                                  text: viewModel.list[i].name.first +
                                      viewModel.list[i].name.middle +
                                      viewModel.list[i].name.last,
                                  size: 20),
                              const SizedBox(
                                width: 3,
                              ),
                              AppText(
                                  text:
                                      "Occupation: ${viewModel.list[i].occupation}",
                                  size: 12),
                              AppText(
                                  text: "Age: ${viewModel.list[i].age}",
                                  size: 12),
                              AppText(
                                  text:
                                      "Gender: ${viewModel.list[i].gender!.name.toLowerCase()}",
                                  size: 12),
                              AppText(
                                  text: 'Species: ${viewModel.list[i].species}',
                                  size: 12),
                              ReadMoreText(viewModel.list[i].sayings.toString(),
                                  trimLines: 3,
                                  colorClickableText: Colors.deepOrangeAccent,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: 'Show more',
                                  trimExpandedText: 'Show less',
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
