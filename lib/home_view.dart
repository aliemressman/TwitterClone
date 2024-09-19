import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isHeaderClose = false;
  double lastOffSet = 0;
  final String _backGroundImage = "https://picsum.photos/200/300";
  final int _defaultTabLenght = 4;
  final String _randomImage = "https://picsum.photos/200/300?grayscale";
  final String dummyText =
      "Hi Elon, do you think future robots can win medals at the Olympics with their hands in their pockets?😎🇹🇷 How about discussing this in Istanbul, the cultural capital that unites continents?";

  ScrollController? scrollController;

  @override
  void initState() {
    scrollController = ScrollController();

    scrollController!.addListener(() {
      if (scrollController!.offset <= 0) {
        isHeaderClose = false;
      } else if (scrollController!.offset >= scrollController!.position.maxScrollExtent) {
        isHeaderClose = true;
      } else {
        isHeaderClose = scrollController!.offset > lastOffSet ? true : false;
      }
      isHeaderClose = scrollController!.offset > lastOffSet ? true : false;

      setState(() {
        lastOffSet = scrollController!.offset;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _fabButton,
      body: SafeArea(
        child: DefaultTabController(
          length: _defaultTabLenght,
          child: Column(children: <Widget>[
            _containerAppBar,
            _tabBarItems,
            _expandedList,
          ]),
        ),
      ),
    );
  }

  Widget get _fabButton => FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.transfer_within_a_station_rounded),
      );

  Widget get _containerAppBar => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: isHeaderClose ? 0 : 50,
        child: _appBar,
      );

  Widget get _appBar => AppBar(
        elevation: 0,
        centerTitle: false,
        title: _appBarItems,
      );

  Widget get _appBarItems => Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 15,
        children: [
          CircleAvatar(backgroundImage: NetworkImage(_backGroundImage)),
          const Text('Home', style: styleText),
        ],
      );

  static const styleText = TextStyle(
    color: Colors.black,
    fontSize: 20,
    letterSpacing: 1,
    fontWeight: FontWeight.bold,
  );

  Widget get _tabBarItems => const TabBar(
        tabs: [
          Tab(child: Icon(Icons.dangerous)),
          Tab(child: Icon(Icons.accessible_forward_sharp)),
          Tab(child: Icon(Icons.zoom_out_outlined)),
          Tab(child: Icon(Icons.location_disabled)),
        ],
      );

  Widget get _expandedList => Expanded(child: _listView);

  Widget get _listView => ListView.builder(
      itemCount: 15,
      controller: scrollController,
      itemBuilder: (context, index) {
        return _listViewCard;
      });

  Widget get _listViewCard => Card(
        child: ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(_randomImage)),
          title: Wrap(
            direction: Axis.horizontal,
            runSpacing: 10,
            children: [const _listTittleText(styleText: styleText), Text(dummyText), _placeHolderField, _downRow()],
          ),
        ),
      );

  Row _downRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _iconLabelButton,
        _iconLabelButton,
        _iconLabelButton,
        _iconLabelButton,
      ],
    );
  }

  Widget get _placeHolderField => Container(
        height: 100,
        child: const Placeholder(),
      );

  Widget _iconLabel(String text) => Wrap(
        spacing: 5,
        children: [
          const Icon(
            Icons.message,
            color: CupertinoColors.inactiveGray,
          ),
          Text(text)
        ],
      );

  Widget get _iconLabelButton => InkWell(
        child: _iconLabel("4"),
        onTap: () {},
      );
}

class _listTittleText extends StatelessWidget {
  const _listTittleText({super.key, required this.styleText});

  final TextStyle styleText;

  @override
  Widget build(BuildContext context) {
    return Text(
      'baslik',
      style: styleText,
    );
  }
}
