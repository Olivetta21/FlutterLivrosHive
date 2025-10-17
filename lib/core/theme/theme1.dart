import 'package:flutter/material.dart';

class AppTheme {
	AppTheme._();

	static ThemeData get light {
		final primary = Colors.blue;
		final primaryDark = Colors.blue[800];
		final accent = Colors.blueAccent;

			final scheme = ColorScheme.fromSwatch(
				primarySwatch: Colors.blue,
				brightness: Brightness.light,
			).copyWith(
			secondary: accent,
		);

		return ThemeData(
			primaryColor: primaryDark,
			colorScheme: scheme,
					appBarTheme: const AppBarTheme(
						backgroundColor: Colors.blue,
						foregroundColor: Colors.white,
						elevation: 0,
						centerTitle: true,
						titleTextStyle: TextStyle(
							fontSize: 20,
							fontWeight: FontWeight.bold,
							color: Colors.white,
						),
					),
			floatingActionButtonTheme: const FloatingActionButtonThemeData(
				backgroundColor: Colors.blueAccent,
				foregroundColor: Colors.white,
				elevation: 4,
			),
			elevatedButtonTheme: ElevatedButtonThemeData(
				style: ElevatedButton.styleFrom(
					backgroundColor: Colors.blue,
					foregroundColor: Colors.white,
				),
			),
			inputDecorationTheme: const InputDecorationTheme(
				border: OutlineInputBorder(),
			),
			listTileTheme: const ListTileThemeData(
				iconColor: Colors.blue,
			),
		);
	}
}

