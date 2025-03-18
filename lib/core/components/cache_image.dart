import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'custom_cicle_progress_indicator.dart';

class CacheImage extends StatelessWidget {
  const CacheImage({
    super.key,
    required this.url,
  });
  final String url;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      height: 250,
      width: double.infinity,
      fit: BoxFit.fill,
      placeholder: (context, url) =>
          SizedBox(height: 200, child: CustomCircleIndicator()),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
