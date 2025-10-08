import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keyboard Listener Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Keyboard Listener Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FocusNode _focusNode = FocusNode(debugLabel: 'keyboard-listener');
  String _lastEventDescription = 'None';

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleKey(RawKeyEvent event) {
    final LogicalKeyboardKey logicalKey = event.logicalKey;
    final String keyLabel = logicalKey.debugName ?? logicalKey.keyLabel;
    final String eventType = event is RawKeyDownEvent ? 'down' : 'up';

    setState(() {
      _lastEventDescription = '$eventType: $keyLabel';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RawKeyboardListener(
          focusNode: _focusNode,
          autofocus: true,
          onKey: _handleKey,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => _focusNode.requestFocus(),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Press any key',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'You clicked: $_lastEventDescription',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
