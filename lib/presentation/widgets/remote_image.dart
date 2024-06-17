
import 'package:flutter/material.dart';

class RemoteImage extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final GestureTapCallback? onTap;

  // final ImageWidgetBuilder? imageBuilder;
  const RemoteImage({
    Key? key,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.onTap,
    // this.imageBuilder,
    this.imageUrl,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  static Map? header;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        child: Image.network(
          imageUrl!,
          fit: fit ?? BoxFit.cover,
          height: height,
          filterQuality: FilterQuality.high,
          errorBuilder: (context, url, error) {
            return CircleAvatar(
              radius: 26,
              backgroundColor: Colors.grey.shade200,
              child: Text("No Image Found"),
            );
          },
          width: width,
          color: color,
        ),
      ),
    );
  }
}
