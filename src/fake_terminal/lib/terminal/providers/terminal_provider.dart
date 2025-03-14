import 'dart:async';
import 'dart:collection';

import 'package:fake_terminal/terminal/models/terminal_history.dart';
import 'package:fake_terminal/terminal/models/terminal_line.dart';
import 'package:fake_terminal/terminal/models/terminal_state.dart';
import 'package:fake_terminal/terminal/repositories/commands_repository/commands_repository.dart';
import 'package:fake_terminal/terminal/repositories/history_repository/history_repository.dart';
import 'package:fake_terminal/texts/terminal_texts.dart';
import 'package:fake_terminal/texts/time_texts.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:riverpod/riverpod.dart';

final terminalProvider = StateNotifierProvider<TerminalNotifier, TerminalState>((ref) {
  final historyRepository = ref.read(historyRepositoryProvider);
  final commandsRepository = ref.read(commandsRepositoryProvider);
  return TerminalNotifierImpl(historyRepository, commandsRepository);
});

abstract class TerminalNotifier extends StateNotifier<TerminalState> {
  TerminalNotifier(TerminalState state) : super(state);

  bool canExitTerminal();
  void exitTerminal();
  void navigateToTerminalRepository();
  void executeCommand(String commandLine);
  String? autocomplete(String commandLine);
  String? navigateHistoryBack(String commandLine);
  String? navigateHistoryForward(String commandLine);
}

final _kLogger = Logger("TerminalNotifier");

class TerminalNotifierImpl extends TerminalNotifier {
  Future get initializationComplete => _initCompleter.future;

  final _initCompleter = Completer();
  final HistoryRepository _historyRepository;
  final CommandsRepository _commandsRepository;

  TerminalNotifierImpl(this._historyRepository, this._commandsRepository)
      : super(TerminalState(output: [], historyInput: [])) {
    _initState().whenComplete(() => _initCompleter.complete());
  }

//#region Initialization
  Future<void> _initState() async {
    final history = await _historyRepository.fetchTerminalHistory();
    if (history != null) {
      _restoreFromHistory(history);
    } else {
      state = welcomeState();
    }
  }

  @visibleForTesting
  static TerminalState welcomeState() {
    return TerminalState(
      historyInput: [],
      output: [
        TerminalLine(line: TerminalTexts.welcomeText, type: LineType.result),
      ],
    );
  }

  void _restoreFromHistory(TerminalHistory history) {
    _kLogger.fine("Restored history");
    final newState = TerminalState(output: history.output, historyInput: history.historyInput);
    if (history.output.isNotEmpty) {
      final timestampText = TimeTexts.lastLoginMessage(history.timestampMillis);
      newState.output.add(TerminalLine(
        type: LineType.timestamp,
        line: "\n$timestampText\n",
      ));
    }
    state = newState;
  }
//#endregion

//#region Public event handlers
  @override
  bool canExitTerminal() => _commandsRepository.hasExitCommand();

  @override
  void exitTerminal() => _commandsRepository.executeExitCommand();

  @override
  void navigateToTerminalRepository() => _commandsRepository.executeOpenTerminalRepositoryCommand();

  @override
  void executeCommand(String commandLine) async {
    final newState = state;
    await _commandsRepository.executeCommandLine(commandLine, newState.output, newState.historyInput);
    state = newState;
    _historyRepository.saveTerminalHistory(newState.snapshot());
  }

  @override
  String? autocomplete(String commandLine) {
    return _commandsRepository.autocomplete(commandLine);
  }

  @override
  String? navigateHistoryBack(String commandLine) {
    _kLogger.fine("NavigateHistoryBack invoked with commandLine=$commandLine");
    final historyMap = _getHistoryMap();
    if (historyMap.isEmpty) {
      return null;
    }
    final currentEntryMatches = historyMap.entries.where((e) => commandLine == e.value);
    if (currentEntryMatches.isNotEmpty) {
      final nextBackIndex = currentEntryMatches.first.key - 1;
      return historyMap[nextBackIndex];
    } else {
      return historyMap[historyMap.length - 2];
    }
  }

  @override
  String? navigateHistoryForward(String commandLine) {
    _kLogger.fine("NavigateHistoryForward invoked with commandLine=$commandLine");
    final historyMap = _getHistoryMap();
    if (historyMap.isEmpty) {
      return null;
    }
    final currentEntryMatches = historyMap.entries.where((e) => commandLine == e.value);
    if (currentEntryMatches.isNotEmpty) {
      final nextForwardIndex = currentEntryMatches.first.key + 1;
      return historyMap[nextForwardIndex];
    } else {
      return null;
    }
  }
//#endregion

  Map<int, String> _getHistoryMap() {
    final historyMap = LinkedHashMap<int, String>();
    int index = 0;
    for (final historyEntry in state.historyInput) {
      historyMap[index] = "!$index $historyEntry";
      index++;
    }
    historyMap[index] = "";
    return historyMap;
  }
}
