import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider_deneme/future/onboard/onboard_model.dart';
import 'package:provider_deneme/future/onboard/tab_indicator.dart';
import 'package:provider_deneme/product/padding/page_padding.dart';
import 'package:provider_deneme/product/widget/onboard_card.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  final String _skipTitle = "Skip";
  final String _start = "Start";
  final String _end = "Next";
  int _selectedIndex = 0;
  bool get _isLastPage =>
      OnBoardModels.onBoardItems.length - 1 == _selectedIndex;
  bool get _isFirstPage => _selectedIndex == 0;

  // ------xx
  ValueNotifier<bool> isBackEnable = ValueNotifier(false);
  // ------xx

  void _incrementAndChange([int? value]) {
    if (_isLastPage && value == null) {
      return;
    }

    _incrementSelectedPage(value);
  }

  void _incrementSelectedPage([int? value]) {
    setState(() {
      _selectedIndex = value ?? _selectedIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const PagePadding.all(),
        child: Column(
          children: [
            Expanded(
              child: _pageViewItems(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabIndicator(
                  selectedIndex: _selectedIndex,
                ),
                _nextButton()
              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      actions: [TextButton(onPressed: () {}, child: Text(_skipTitle))],
      leading: _isFirstPage
          ? null
          : IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chevron_left_outlined,
                color: Colors.grey,
              )),
    );
  }

  PageView _pageViewItems() {
    return PageView.builder(
      onPageChanged: (value) {
        _incrementAndChange(value);
      },
      itemCount: OnBoardModels.onBoardItems.length,
      itemBuilder: (context, index) {
        return OnBoardCard(model: OnBoardModels.onBoardItems[index]);
      },
    );
  }

  FloatingActionButton _nextButton() {
    return FloatingActionButton(
      child: Text(_isLastPage ? _start : _end),
      onPressed: () {
        _incrementAndChange();
      },
    );
  }
}
