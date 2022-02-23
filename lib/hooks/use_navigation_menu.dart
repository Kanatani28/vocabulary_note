import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vocabulary_note/ui/pages/home.dart';
import 'package:vocabulary_note/ui/pages/setting.dart';

class NavigationController {
  ValueNotifier<int> currentPageIndex;
  Widget currentPage;
  void Function(int)? setCurrentPageIndex;

  NavigationController(
      {required this.currentPageIndex,
      required this.currentPage,
      required this.setCurrentPageIndex});
}

NavigationController useNavigationMenu() {
  final currentPageIndex = useState<int>(0);
  void setCurrentPageIndex(int index) {
    currentPageIndex.value = index;
  }

  final List<Widget> _pageList = [
    const Home(),
    const Setting(),
  ];
  final currentPage = useMemoized(() {
    return _pageList[currentPageIndex.value];
  }, [currentPageIndex.value]);

  return NavigationController(
      currentPageIndex: currentPageIndex,
      setCurrentPageIndex: setCurrentPageIndex,
      currentPage: currentPage);
}
