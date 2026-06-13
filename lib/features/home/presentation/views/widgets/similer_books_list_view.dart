import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_progress_bar.dart';
import 'package:bookly_app/features/home/presentation/manager/similer_books_cubit/similer_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilerBooksListView extends StatelessWidget {
  const SimilerBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: BlocBuilder<SimilerBooksCubit, SimilerBooksState>(
        builder: (context, state) {
          if (state is SimilerBooksSuccess) {
            return ListView.builder(
              itemCount: state.bookModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: CustomBookImage(
                    imageUrl:
                        state
                            .bookModel[index]
                            .volumeInfo
                            .imageLinks
                            ?.thumbnail ??
                        '',
                  ),
                );
              },
            );
          } else if (state is SimilerBooksFailure) {
            return CustomErrorWidget(errMessage: state.errmessage);
          } else {
            return CustomProgressBar();
          }
        },
      ),
    );
  }
}
