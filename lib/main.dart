import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messagerie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Messagerie"),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 200,
                itemBuilder: (context, index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 1500),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .unselectedWidgetColor
                            .withOpacity(0.2),
                        border: Border.all(
                            color: Theme.of(context)
                                .disabledColor
                                .withOpacity(0.4)),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Expanded(
                              child: Text("test"),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "test2",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 10,
                          style: TextStyle(
                              color: Colors.grey, height: 1.3, fontSize: 12),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(children: [
                          const Text(
                            "date",
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                          const Flexible(fit: FlexFit.tight, child: SizedBox()),
                          Text(
                            "test3",
                            style:
                                TextStyle(color: Colors.red[400], fontSize: 11),
                          ),
                          Text("text 4",
                              style: TextStyle(
                                  color: Theme.of(context).disabledColor))
                        ])
                      ],
                    ),
                  );
                },
                staggeredTileBuilder: (int index) {
                  return const StaggeredTile.fit(2);
                }),
          ),
        ));
  }
}
