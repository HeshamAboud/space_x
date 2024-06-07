import 'package:flutter/material.dart';
import 'package:space_x/core/helpers/constants.dart';
import 'package:space_x/features/company%20info/data/models/company_info_model.dart';
import 'package:space_x/features/company%20info/ui/widgets/logos_link_circle.dart';

class CompanyInfoLogos extends StatelessWidget {
  final Links links;

  const CompanyInfoLogos({
    super.key,
    required this.links,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LogosLinkCircle(
          link: links.website,
          logo: Constants.spaceXLogoAssetPath,
        ),
        LogosLinkCircle(
          link: links.twitter,
          logo: Constants.twitterLogoAssetPath,
        ),
        LogosLinkCircle(
          link: links.flickr,
          logo: Constants.flickrLogoAssetPath,
        ),
      ],
    );
  }
}
