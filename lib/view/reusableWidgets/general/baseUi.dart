import 'package:baby_milestones_tracker/model/utilities/imports/generalImport.dart';

class BaseUi extends StatelessWidget {
  final List<Widget> children;
  final FloatingActionButton? floatingActionButton;
  final AppBar? appBar;
  final bool? allowBackButton;
  final bool? safeTop, safeBottom;
  final Function? onRefreshFunction;
  final bool refreshedEnabled;
  final Color? containerColor;

  const BaseUi(
      {Key? key,
      this.allowBackButton,
      required this.children,
      this.floatingActionButton,
      this.appBar,
      this.safeTop,
      this.safeBottom,
      this.refreshedEnabled = true,
      this.onRefreshFunction,
      this.containerColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseModel>.reactive(
        viewModelBuilder: () => BaseModel(),
        onViewModelReady: (model) async {
          //listen to socket
          // if (channelBucket != null) {
          //   channelBucket!.sink.close();
          //   channelBucket = null;
          //   channelBucket = IOWebSocketChannel.connect(websocketUrl);
          //   notificationSocket.listenTochannel(
          //       context: context, channel: channelBucket!);
          // }else{
          //    channelBucket = IOWebSocketChannel.connect(websocketUrl);
          //   notificationSocket.listenTochannel(
          //       context: context, channel: channelBucket!);
          // }
        },
        onDispose: (model) {},
        disposeViewModel: false,
        builder: (context, model, child) {
          return WillPopScope(
              onWillPop: () async {
                return allowBackButton ?? true;
              },
              child: !refreshedEnabled
                  ? Scaffold(
                      appBar: appBar,
                      body: AnnotatedRegion<SystemUiOverlayStyle>(
                        value: SystemUiOverlayStyle.light
                            .copyWith(statusBarColor: white),
                        child: SafeArea(
                          // bottom: false,
                          top: safeTop ?? false,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: black,
                            child: Stack(children: children),
                          ),
                        ),
                      ),
                      floatingActionButton: floatingActionButton,
                    )
                  : RefreshIndicator(
                      displacement: 100,
                      backgroundColor: purple,
                      color: white,
                      strokeWidth: 3,
                      triggerMode: RefreshIndicatorTriggerMode.onEdge,
                      onRefresh: () async {
                        if (onRefreshFunction != null) {
                          return onRefreshFunction!();
                        }
                      },
                      child: AnnotatedRegion<SystemUiOverlayStyle>(
                        value:
                            const SystemUiOverlayStyle(statusBarColor: white),
                        child: Scaffold(
                          appBar: appBar,
                          body: SafeArea(
                            bottom: safeBottom ?? true,
                            top: safeTop ?? false,
                            child: SwipeDetector(
                              onSwipeRight: (offset) {
                                if (backButtonRedirectBucket != null) {
                                  router.goNamed(backButtonRedirectBucket!);
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                color: containerColor ?? white,
                                child: Stack(
                                  children: children,
                                ),
                              ),
                            ),
                          ),
                          floatingActionButton: floatingActionButton,
                        ),
                      ),
                    ));
        });
  }
}
