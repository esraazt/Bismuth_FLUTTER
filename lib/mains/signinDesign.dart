import 'package:flutter/material.dart';
import 'sigupDesign.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Bismuth/mains/signin.dart';

class signinDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3a4f69),
      // appBar: AppBar(backgroundColor: const Color(0xffffffff),),
      body: Stack(
        children: <Widget>[
          //appBar
          Container(
            width: 428.0,
            height: 69.0,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
            ),
          ),

//********************************************** BACKGROUND IMAGE *********************************************************/

          Transform.translate(
            offset: Offset(1.0, 70.0),
            child: Container(
              width: 862.0,
              height: 862.0,
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
          Transform.translate(offset: Offset(6.0, 306.8), child: signin()),

          Transform.translate(
            offset: Offset(139.6, 612.0),
            child: SizedBox(
              width: 173.0,
              child: Text(
                'Forgot password?',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: const Color(0xffbec2ce),
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(83.2, 662.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => signupDesign(),
                ),
              ],
              child: SizedBox(
                width: 286.0,
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: const Color(0xffbec2ce),
                      letterSpacing: -0.09846153259277343,
                      height: 1.125,
                    ),
                    children: [
                      TextSpan(
                        text: 'Here for the first time?',
                      ),
                      TextSpan(
                        text: ' ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign up',
                        style: TextStyle(
                          color: const Color(0xff132641),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 69.0),
            child:
                // Adobe XD layer: 'bg' (shape)
                Container(
              width: 428.0,
              height: 44.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x14455b63),
                    offset: Offset(0, 12),
                    blurRadius: 16,
                  ),
                ],
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(72.4, 84.0),
            child: SizedBox(
              width: 67.0,
              child: Text(
                'SIGN IN',
                style: TextStyle(
                  fontFamily: 'Gibson',
                  fontSize: 16,
                  color: const Color(0xff454f63),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(285.0, 84.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => signupDesign(),
                ),
              ],
              child: SizedBox(
                width: 72.0,
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                    fontFamily: 'Gibson',
                    fontSize: 16,
                    color: const Color(0xff959dad),
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),

          // 'divider' (shape)
          Transform.translate(
            offset: Offset(214.0, 69.0),
            child: Container(
              width: 1.0,
              height: 44.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.0),
                color: const Color(0xfff4f4f6),
              ),
            ),
          ),

          //ombree
          Transform.translate(
            offset: Offset(0.0, 106.0),
            child: SvgPicture.string(
              _svg_n75ur4,
              allowDrawingOutsideViewBox: true,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_n75ur4 =
    '<svg viewBox="0.0 106.0 214.0 7.0" ><path transform="translate(0.0, 106.0)" d="M 0 0 L 94 0 L 94 7 L 0 7 L 0 0 Z" fill="#37527c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(54.73, 106.0)" d="M 0 0 L 79 0 L 79 7 L 0 7 L 0 0 Z" fill="#426191" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(108.75, 106.0)" d="M 0 0 L 63 0 L 63 7 L 0 7 L 0 0 Z" fill="#6284b9" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(166.0, 106.0)" d="M 0 0 L 48 0 L 48 7 L 0 7 L 0 0 Z" fill="#95afd8" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
