import 'package:flutter/material.dart';

import 'package:adobe_xd/page_link.dart';

import 'package:adobe_xd/pinned.dart';
import 'package:Bismuth/RecordDe.dart';
import '../Upcoming_G.dart';
//import './library_.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClassificationOf_U extends StatelessWidget {
  ClassificationOf_U({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        title: Text(
          'Rock Information',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 22,
            color: const Color(0xff3a4f69),
            letterSpacing: -0.5305882377624512,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
        brightness: Brightness.light,
        backgroundColor: const Color(0xffffffff),
        leading: IconButton(
          alignment: AlignmentDirectional.centerStart,
          color: Colors.indigo,
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(
              context, MaterialPageRoute(builder: (context) => RecordDe())),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(-0.5, -0.8),
            child:
                // Adobe XD layer: 'images-2' (shape)
                Container(
              width: 428.5,
              height: 285.1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/baslay header.jpg'),
                  fit: BoxFit.fill,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.71), BlendMode.dstIn),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(270.0, 289.0),
            child:
                // Adobe XD layer: 'divider' (shape)
                Container(
              width: 1.0,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0x2b534c4c),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(152.0, 289.0),
            child:
                // Adobe XD layer: 'divider' (shape)
                Container(
              width: 1.0,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0x2b534c4c),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(293.2, 317.0),
            child: SizedBox(
              width: 58.0,
              child: Text(
                'MEMPER',
                style: TextStyle(
                  fontFamily: 'Gibson',
                  fontSize: 12,
                  color: const Color(0x7f534c4c),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(277.6, 292.0),
            child: SizedBox(
              width: 89.0,
              child: Text(
                'KAHFAH',
                style: TextStyle(
                  fontFamily: 'Gibson',
                  fontSize: 20,
                  color: const Color(0xff534c4c),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(168.2, 317.0),
            child: SizedBox(
              width: 82.0,
              child: Text(
                'FORMATION',
                style: TextStyle(
                  fontFamily: 'Gibson',
                  fontSize: 12,
                  color: const Color(0x7f534c4c),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(169.4, 290.0),
            child: SizedBox(
              width: 79.0,
              child: Text(
                'QASIM',
                style: TextStyle(
                  fontFamily: 'Gibson',
                  fontSize: 22,
                  color: const Color(0xff534c4c),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(72.0, 317.0),
            child: SizedBox(
              width: 48.0,
              child: Text(
                'GROUP',
                style: TextStyle(
                  fontFamily: 'Gibson',
                  fontSize: 12,
                  color: const Color(0x7f534c4c),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(55.2, 290.0),
            child: SizedBox(
              width: 82.0,
              child: Text(
                'TAYMA',
                style: TextStyle(
                  fontFamily: 'Gibson',
                  fontSize: 22,
                  color: const Color(0xff534c4c),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, -23.0),
            child:
                // Adobe XD layer: 'bg' (shape)
                Container(
              width: 428.0,
              height: 309.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.0, -0.86),
                  end: Alignment(0.0, 1.0),
                  colors: [
                    const Color(0x00f2f3f5),
                    const Color(0x5ea8aab3),
                    const Color(0x4bf7f8fa),
                    const Color(0xf5fafafa),
                    const Color(0xffffffff)
                  ],
                  stops: [0.0, 0.0, 0.409, 0.926, 1.0],
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(126.2, 196.0),
            child: SizedBox(
              width: 166.0,
              child: Text(
                'BASALT',
                style: TextStyle(
                  fontFamily: 'Gibson',
                  fontSize: 40,
                  color: const Color(0xb5262020),
                  fontWeight: FontWeight.w600,
                  height: 1.1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(154.2, 236.0),
            child: SizedBox(
              width: 106.0,
              child: Text(
                'SYMPOL: Tb',
                style: TextStyle(
                  fontFamily: 'Gibson',
                  fontSize: 16,
                  color: const Color(0x5a262020),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(46.0, 355.0),
            child:
                // Adobe XD layer: 'bg' (shape)
                Container(
              width: 325.0,
              height: 52.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: const Color(0xffd8d9db),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x14455b63),
                    offset: Offset(0, 4),
                    blurRadius: 16,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(60.0, 375.0),
            child: Text(
              'GEOGENESIS',
              style: TextStyle(
                fontFamily: 'Gibson',
                fontSize: 14,
                color: const Color(0x6c534c4c),
                letterSpacing: 0.28,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(200.0, 375.0),
            child: SizedBox(
              width: 156.0,
              child: Text(
                'Magmatic,volcanic.',
                style: TextStyle(
                  fontFamily: 'Gibson',
                  fontSize: 14,
                  color: const Color(0xff534c4c),
                  letterSpacing: 0.28,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(41.0, 426.5),
            child: SvgPicture.string(
              _svg_8eqfm6,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(42.0, 436.0),
            child:
                // Adobe XD layer: 'The Awe-Inspiring St' (text)
                SizedBox(
              width: 220.0,
              height: 26.0,
              child: Text(
                'GEODETCOM:',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: const Color(0xff241332),
                  letterSpacing: -0.38588235473632815,
                  fontWeight: FontWeight.w700,
                  height: 1.375,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(42.0, 474.0),
            child: SizedBox(
              width: 320.0,
              height: 78.0,
              child: Text(
                'basalt-eroded tongues and outliers of multiple basalt flows,some scoria remnants,no preserved craters Reference section at lat.28 03’00”N.,long.36 35’12”E. ',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 14,
                  color: const Color(0xff707070),
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(41.0, 572.0),
            child:
                // Adobe XD layer: 'The Awe-Inspiring St' (text)
                SizedBox(
              width: 220.0,
              height: 26.0,
              child: Text(
                'GEOSTRATAG:',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: const Color(0xff241332),
                  letterSpacing: -0.38588235473632815,
                  fontWeight: FontWeight.w700,
                  height: 1.375,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(41.0, 560.5),
            child: SvgPicture.string(
              _svg_uipf0u,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(41.0, 603.0),
            child: SizedBox(
              width: 320.0,
              height: 41.0,
              child: Text(
                'Cenozoic,Tertiary.',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 14,
                  color: const Color(0xff707070),
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_8eqfm6 =
    '<svg viewBox="41.0 426.5 335.0 1.0" ><path transform="translate(41.0, 426.0)" d="M 0 0.5 L 335 0.5" fill="none" stroke="#eaecef" stroke-width="1" stroke-miterlimit="10" stroke-linecap="square" /></svg>';
const String _svg_uipf0u =
    '<svg viewBox="41.0 560.5 335.0 1.0" ><path transform="translate(41.0, 560.0)" d="M 0 0.5 L 335 0.5" fill="none" stroke="#eaecef" stroke-width="1" stroke-miterlimit="10" stroke-linecap="square" /></svg>';
const String _svg_ri7esg =
    '<svg viewBox="18.0 47.0 18.0 16.0" ><path transform="translate(18.0, 47.0)" d="M 7.99339771270752 14.11870288848877 C 8.387631416320801 14.55112743377686 8.39336109161377 15.24594020843506 8.000114440917969 15.67728233337402 C 7.60959005355835 16.10563850402832 6.981334209442139 16.11102294921875 6.581756114959717 15.67273616790771 L 0.2971522808074951 8.779326438903809 C -0.09566109627485275 8.34846019744873 -0.1024259850382805 7.657307624816895 0.2971522808074951 7.219021320343018 L 6.581756114959717 0.3256111443042755 C 6.974569320678711 -0.1052551344037056 7.60686731338501 -0.1102769896388054 8.000114440917969 0.3210648596286774 C 8.39063835144043 0.7494202852249146 8.391977310180664 1.442453265190125 7.99339771270752 1.87964403629303 L 3.41432785987854 6.902300834655762 L 16.99757385253906 6.902300834655762 C 17.55126190185547 6.902300834655762 18.00011444091797 7.389163970947266 18.00011444091797 7.999173641204834 C 18.00011444091797 8.604959487915039 17.5475959777832 9.096046447753906 16.99757385253906 9.096046447753906 L 3.41432785987854 9.096046447753906 L 7.99339771270752 14.11870288848877 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
