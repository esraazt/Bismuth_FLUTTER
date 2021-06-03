import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../RecordDe.dart';

class DACITE extends StatelessWidget {
  DACITE({
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
          alignment: AlignmentDirectional.bottomEnd,
          color: Colors.indigo,
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(
              context, MaterialPageRoute(builder: (context) => RecordDe())),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0.0, -4.0),
            child:
                // Adobe XD layer: 'Screen Shot 1442-08…' (shape)
                Container(
              width: 429.0,
              height: 287.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/dacite.png'),
                  fit: BoxFit.fill,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.7), BlendMode.dstIn),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, -24.0),
            child:
                // Adobe XD layer: 'bg' (shape)
                Container(
              width: 428.0,
              height: 311.0,
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
                  stops: [0.0, 0.0, 0.409, 0.867, 1.0],
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(40.0, 309.0),
            child:
                // Adobe XD layer: 'data' (group)
                SizedBox(
              width: 350.0,
              height: 40.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(230.0, 0.0, 1.0, 40.0),
                    size: Size(350.0, 40.0),
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child:
                        // Adobe XD layer: 'divider' (shape)
                        Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0x2b534c4c),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(106.0, 0.0, 1.0, 40.0),
                    size: Size(350.0, 40.0),
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child:
                        // Adobe XD layer: 'divider' (shape)
                        Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0x2b534c4c),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(264.0, 28.0, 48.0, 12.0),
                    size: Size(350.0, 40.0),
                    pinRight: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
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
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(248.0, 2.0, 102.0, 20.0),
                    size: Size(350.0, 40.0),
                    pinRight: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'LIMESTONE',
                      style: TextStyle(
                        fontFamily: 'Gibson',
                        fontSize: 20,
                        color: const Color(0xff534c4c),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(131.0, 28.0, 68.0, 12.0),
                    size: Size(350.0, 40.0),
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
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
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(142.0, 1.0, 46.0, 22.0),
                    size: Size(350.0, 40.0),
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'JAUF',
                      style: TextStyle(
                        fontFamily: 'Gibson',
                        fontSize: 22,
                        color: const Color(0xff534c4c),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(24.0, 28.0, 40.0, 12.0),
                    size: Size(350.0, 40.0),
                    pinLeft: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
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
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 1.0, 88.0, 22.0),
                    size: Size(350.0, 40.0),
                    pinLeft: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'QALIBAH',
                      style: TextStyle(
                        fontFamily: 'Gibson',
                        fontSize: 22,
                        color: const Color(0xff534c4c),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(135.6, 214.0),
            child: SizedBox(
              width: 161.0,
              child: Text(
                'DACITE',
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
            offset: Offset(161.2, 254.0),
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
            offset: Offset(38.0, 376.0),
            child:
                // Adobe XD layer: 'card' (group)
                SizedBox(
              width: 325.0,
              height: 52.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 325.0, 52.0),
                    size: Size(325.0, 52.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child:
                        // Adobe XD layer: 'bg' (shape)
                        Container(
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
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(14.0, 20.0, 87.0, 14.0),
                    size: Size(325.0, 52.0),
                    pinLeft: true,
                    fixedWidth: true,
                    fixedHeight: true,
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
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(129.0, 20.0, 181.0, 14.0),
                    size: Size(325.0, 52.0),
                    pinRight: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'Sedimentary, coastal plain.',
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
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(36.0, 448.3),
            child: SvgPicture.string(
              _svg_smmrag,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(46.0, 462.0),
            child: SizedBox(
              width: 338.0,
              height: 144.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 220.0, 26.0),
                    size: Size(338.0, 144.0),
                    pinLeft: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'The Awe-Inspiring St' (text)
                        Text(
                      'GEODETCOM:',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        color: const Color(0xff000000),
                        letterSpacing: -0.38588235473632815,
                        fontWeight: FontWeight.w700,
                        height: 1.375,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 38.0, 338.0, 106.0),
                    size: Size(338.0, 144.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Text(
                      'red to black ferruginous oolites, bounded by yellow sandy.silty sandstone yellow to ocher powdery with wavy bedding,sigmoidal and ripple crossbedded.brown-pink sandstone and carbonaceous with burrows,dolomite sandy limestone remains fish,laminated algal',
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 14,
                        color: const Color(0xff707070),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(36.0, 619.5),
            child: SizedBox(
              width: 353.0,
              height: 84.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 11.5, 220.0, 26.0),
                    size: Size(353.0, 83.5),
                    pinLeft: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'The Awe-Inspiring St' (text)
                        Text(
                      'GEOSTRATAG:',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        color: const Color(0xff000000),
                        letterSpacing: -0.38588235473632815,
                        fontWeight: FontWeight.w700,
                        height: 1.375,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 353.0, 1.0),
                    size: Size(353.0, 83.5),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'Line' (shape)
                        SvgPicture.string(
                      _svg_ato3ys,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 42.5, 338.0, 41.0),
                    size: Size(353.0, 83.5),
                    pinLeft: true,
                    pinRight: true,
                    pinBottom: true,
                    fixedHeight: true,
                    child: Text(
                      'Phanerozoic, Paleozoic, Devonian, Early Devonian, Praguian',
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 14,
                        color: const Color(0xff707070),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_smmrag =
    '<svg viewBox="36.0 448.3 353.0 1.0" ><path transform="translate(36.0, 447.82)" d="M 0 0.5 L 352.9947509765625 0.5" fill="none" stroke="#eaecef" stroke-width="1" stroke-miterlimit="10" stroke-linecap="square" /></svg>';
const String _svg_ato3ys =
    '<svg viewBox="0.0 0.0 353.0 1.0" ><path transform="translate(0.0, -0.5)" d="M 0 0.5 L 352.9947509765625 0.5" fill="none" stroke="#eaecef" stroke-width="1" stroke-miterlimit="10" stroke-linecap="square" /></svg>';
