import 'package:flutter/material.dart';

class LoadingImage extends StatelessWidget {
  final String url;
  const LoadingImage({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (context, error, stackTrace) {
        return const Center(
          child: Text("error"),
        );
      },
      frameBuilder: (context, image, frame, wasSynchronouslyLoaded) {
        if (!wasSynchronouslyLoaded && frame == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return image;
      },
    );
  }
}
