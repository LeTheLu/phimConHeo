import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppCacheImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final double? connerRadius;

  const AppCacheImage({
    Key? key,
    required this.url,
    this.width,
    this.height,
    this.connerRadius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(connerRadius!),
      child: CachedNetworkImage(
        width: width,
        height: height,
        imageUrl: url,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            Container(height: 45,width :45, alignment: Alignment.center ,child: CircularProgressIndicator(value: downloadProgress.progress,)),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.cover,
      ),
    );
  }
}
