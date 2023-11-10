import 'dart:async';

import 'package:crypto_list/features/bloc/crypto_list_bloc.dart';
import 'package:crypto_list/features/crypto_list/widgets/widgets.dart';
import 'package:crypto_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  final String title = 'Crypto currency app';

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _CryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());
  @override
  void initState() {
    _CryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          // backgroundColor: theme.colorScheme.inversePrimary,
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _CryptoListBloc.add(LoadCryptoList(completer: completer));
            return completer.future;
          },
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
            bloc: _CryptoListBloc,
            builder: (context, state) {
              if (state is CryptoListLoaded) {
                return ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: state.coinsList.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, i) {
                    final coin = state.coinsList[i];
                    return CryptoCoinTile(coin: coin);
                  },
                );
              }
              if (state is CryptoListLoadingFailure) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Something went wrong',
                          style: theme.textTheme.headlineMedium),
                      Text('Please try again later',
                          style: theme.textTheme.labelSmall
                              ?.copyWith(fontSize: 16)),
                      const SizedBox(height: 30),
                      TextButton(
                          onPressed: () {
                            _CryptoListBloc.add(LoadCryptoList());
                          },
                          child: const Text('Try again'))
                    ],
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
