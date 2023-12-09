import '../../model/utilities/imports/generalImport.dart';

class GeneralContainer extends StatelessWidget {
  final double height, width, borderWidth, borderRadius,topLeft,topRight,bottomLeft,bottomRight,left,right,bottom,top,allSide,leftMargin,
topMargin,
rightMargin,
bottomMargin;
  final BorderStyle? borderStyle;
  final Color color, borderColor;
  final bool noDecoration,noBorderRadius, isNetworkImage,allBorder;
  final BoxFit? boxFit;
  final BoxShape? shape;
  final List<BoxShadow>? boxShadow;

  final String? image;
  final Widget? child;
  const GeneralContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.color,
      this.noDecoration = false,
      this.borderWidth = 0,
      this.borderStyle,
      this.borderColor = transparent,
      this.noBorderRadius = false,
      this.borderRadius = 0,
      this.child,
      this.image,
      this.boxFit,
      this.isNetworkImage = false, this.allBorder=true, this.topLeft=0,  this.topRight=0,  this.bottomLeft=0, this.bottomRight=0, this.boxShadow,
      this.left=0,this.right=0,this.top=0,this.bottom=0,this.allSide=0,this.shape,  this.leftMargin=0,  this.topMargin=0,  this.rightMargin=0,  this.bottomMargin=0
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sS(context).cH(height: height),
      width: sS(context).cW(width: width),
      margin: EdgeInsets.fromLTRB(sS(context).cW(width:leftMargin), sS(context).cH(height: topMargin),
       sS(context).cW(width:rightMargin), sS(context).cH(height:bottomMargin)), 
      padding: EdgeInsets.fromLTRB(sS(context).cW(width:allSide!=0?allSide: left), sS(context).cH(height:allSide!=0?allSide: top),
       sS(context).cW(width:allSide!=0?allSide: right), sS(context).cH(height:allSide!=0?allSide: bottom)),
      decoration: noDecoration == true
          ? BoxDecoration(color: color)
          : BoxDecoration(
            
              image: image != null
                  ? DecorationImage(
                      image: (isNetworkImage == true
                          ? NetworkImage(image!)
                          : AssetImage(image!) as ImageProvider),fit:boxFit?? BoxFit.contain)
                  : null,
              borderRadius: noBorderRadius == true
                  ? BorderRadius.zero
                  :( allBorder==true?BorderRadius.all(
                      Radius.circular(sS(context).cH(height: borderRadius))):BorderRadius.only(
                        topLeft: Radius.circular(sS(context).cH(height: topLeft)),
                        bottomLeft: Radius.circular(sS(context).cH(height: bottomLeft)),
                        topRight: Radius.circular(sS(context).cH(height: topRight)),
                        bottomRight: Radius.circular(sS(context).cH(height: bottomRight)),
                      )),
              color: color,
              boxShadow: boxShadow,
              
              border: 
                  Border.all(
                      color: borderColor,
                      width: borderWidth,
                      style: borderStyle ?? BorderStyle.solid)),
      child: child,
    );
  }
}
