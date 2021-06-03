import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:Bismuth/mains/signinDesign.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3a4f69),
      body: Stack(
        children: <Widget>[
//********************************************** BACKGROUND IMAGE *********************************************************/
          Transform.translate(
            offset: Offset(1.0, 0.0),
            child:
                // Adobe XD layer: 'istockphoto-1128218…' (shape)
                Container(
              width: 920.0,
              height: 919.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.07), BlendMode.dstIn),
                ),
              ),
            ),
          ),

//****************************** button with a page link to the signin Screen  ******************************************/
          Transform.translate(
            offset: Offset(72.7, 528.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => signinDesign(),
                ),
              ],
              child: SizedBox(
                width: 296.0,
                height: 56.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 0.0, 295.6, 55.8),
                      size: Size(295.6, 55.8),
                      pinLeft: true,
                      pinRight: true,
                      pinTop: true,
                      pinBottom: true,
                      child: SvgPicture.string(
                        _svg_ak4vsx,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(73.6, 18.0, 140.0, 19.0),
                      size: Size(295.6, 55.8),
                      fixedWidth: true,
                      fixedHeight: true,
                      child:
                          // Adobe XD layer: 'buttons' (group)
                          Stack(
                        children: <Widget>[
                          Pinned.fromSize(
                            bounds: Rect.fromLTWH(0.0, 0.0, 140.0, 19.0),
                            size: Size(140.0, 19.0),
                            pinLeft: true,
                            pinRight: true,
                            pinTop: true,
                            pinBottom: true,
                            child:
                                // Adobe XD layer: 'button' (group)
                                Stack(
                              children: <Widget>[
                                Pinned.fromSize(
                                  bounds: Rect.fromLTWH(0.0, 0.0, 140.0, 19.0),
                                  size: Size(140.0, 19.0),
                                  pinLeft: true,
                                  pinRight: true,
                                  pinTop: true,
                                  pinBottom: true,
                                  child: Text(
                                    'Let’s get started!',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      color: const Color(0xffffffff),
                                      letterSpacing: 0.064,
                                      fontWeight: FontWeight.w600,
                                      height: 1.1,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

//****************************** TEXT TO INTRUDUCE THE APPLICATION ******************************************/
          Transform.translate(
            offset: Offset(57.0, 313.0),
            child: SizedBox(
              width: 322.0,
              height: 88.0,
              child: Text(
                'Welcome\nto Bismuth',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 35,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                  height: 1.1428571428571428,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(89.0, 416.0),
            child: SizedBox(
              width: 263.0,
              height: 44.0,
              child: SingleChildScrollView(
                  child: Text(
                'Classify field rocks and Remark your observation Easly . Let\'s get started!',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  color: const Color(0xffffffff),
                  letterSpacing: -0.16,
                  fontWeight: FontWeight.w500,
                  height: 1.25,
                ),
                textAlign: TextAlign.center,
              )),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_ak4vsx =
    '<svg viewBox="0.0 0.0 295.6 55.8" ><path transform="translate(0.0, 0.0)" d="M 10.71673011779785 0 L 284.8864135742188 0 C 290.8050537109375 0 295.6031494140625 5.992444038391113 295.6031494140625 13.38449764251709 L 295.6031494140625 42.38424301147461 C 295.6031494140625 49.77629852294922 290.8050537109375 55.76874160766602 284.8864135742188 55.76874160766602 L 10.71673011779785 55.76874160766602 C 4.798043727874756 55.76874160766602 0 49.77629852294922 0 42.38424301147461 L 0 13.38449764251709 C 0 5.992444038391113 4.798043727874756 0 10.71673011779785 0 Z" fill="#132641" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
