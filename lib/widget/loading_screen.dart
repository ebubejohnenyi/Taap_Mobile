import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/data/bloc/app_start/app_start_bloc.dart';
import 'package:mobile/data/bloc/app_start/app_start_state.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Preload an asset image
    precacheImage(AssetImage('assets/png/logo.png'), context);
    // Preload a network image
    // precacheImage(NetworkImage('https://example.com/image.jpg'), context);
  }

  @override
  Widget build(context) {
    return BlocListener<AppStartBloc, AppStartState>(
      listener: (ctx, state) {
        if (state is FirstTimeUser) {
          context.go('/splash');
        } else if (state is ReturningUser) {
          context.go('/login');
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xFF3E8672),
        body: Center(
          child: Image.asset(
            'assets/png/logo.png',
            fit: BoxFit.contain,
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
