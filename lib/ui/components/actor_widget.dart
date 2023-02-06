import 'package:flutter/material.dart';

import 'app_cache_image.dart';

class ActorWidget extends StatelessWidget {
  final String url, name, nameCharacter;

  const ActorWidget(
      {Key? key,
      required this.url,
      required this.name,
      required this.nameCharacter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
              flex: 5,
              child: AppCacheImage(
                width: 50,
                height: 50,
                url: url,
                connerRadius: 15,
              )),
          Flexible(
            flex: 2,
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontFamily: 'BeVietNamPro',
                  fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            nameCharacter,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color(0x80FFFFFF),
                fontWeight: FontWeight.w500,
                fontFamily: 'BeVietNamPro',
                fontSize: 9),
          )
        ],
      ),
    );
  }
}
