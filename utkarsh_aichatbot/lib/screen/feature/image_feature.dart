import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utkarsh_aichatbot/prompt/bloc/prompt_bloc.dart';

class ImageFeature extends StatefulWidget {
  const ImageFeature({super.key});

  @override
  State<ImageFeature> createState() => _ImageFeatureState();
}

class _ImageFeatureState extends State<ImageFeature> {
  TextEditingController controller = TextEditingController();

  final PromptBloc promptBloc = PromptBloc();

  @override
  void initState() {
    promptBloc.add(PromptInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Image Creator🚀 "),
      ),
      body: BlocConsumer<PromptBloc, PromptState>(
        bloc: promptBloc,
        listener: (context, state) {
          
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case PromptGeneratingImageLoadState:
              return Center(child: CircularProgressIndicator(),);
            case PromptGeneratingImageErrorState:
            return Center(child: Text("Something Went Wrong"),
            );

            case PromptGeneratingImageSuccessState:
            final successState = state as PromptGeneratingImageSuccessState;
            return  Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                      width: double.maxFinite,
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: MemoryImage(successState.uint8list))
                  ),
                )),
                Container(
                  height: 240,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter you Imagination.... and I will Create it...",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        cursorColor: Colors.blue,
                        controller: controller,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                ),
                                borderRadius: BorderRadius.circular(12)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 48,
                        width: double.maxFinite,
                        child: ElevatedButton.icon(
                          style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue),
                            foregroundColor:
                                WidgetStatePropertyAll(Colors.white),
                          ),
                          onPressed: () {
                            if (controller.text.isNotEmpty) {
                              promptBloc.add(PromptEnteredEvent(prompt: controller.text));
                            }
                          },
                          label: const Text("Generate"),
                          icon: const Icon(Icons.rocket_launch_sharp),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
            default: return SizedBox();
          }
        },
      ),
    );
  }
}
