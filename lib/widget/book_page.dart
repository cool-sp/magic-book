import 'package:flutter/material.dart';

import 'book_page_footer.dart';

class BookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: 20, maxHeight: 20),
              child: BookPageFooter(),
            ),
          ],
        ));
  }
}
