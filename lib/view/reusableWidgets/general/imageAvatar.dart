import '../../../model/utilities/imports/generalImport.dart';

class SvgImage extends StatelessWidget {
  final String path;
  final double height, width;
  const SvgImage(
      {super.key,
      required this.path,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/$path.svg',
      width: sS(context).cW(width: width),
      height: sS(context).cH(height: height),
      fit: BoxFit.cover,
    );
  }
}
