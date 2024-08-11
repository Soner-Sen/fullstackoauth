import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:fullstackoauth/core/l10n/generated/l10n.dart';
import 'package:fullstackoauth/core/l10n/locale_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appTitle),
        actions: [
          IconButton(
            onPressed: () => context.go('/login'),
            icon: const Icon(Icons.logout_outlined),
          ),
          DropdownButton<String>(
            value: localeProvider.locale.languageCode,
            underline: Container(),
            icon: const Icon(Icons.language, color: Colors.white),
            selectedItemBuilder: (BuildContext context) {
              return ['en', 'de'].map<Widget>((String item) {
                return Center(
                  child: CountryFlag.fromCountryCode(
                    item == 'en' ? 'GB' : item.toUpperCase(),
                    width: 60,
                    shape: const Circle(),
                  ),
                );
              }).toList();
            },
            items: [
              DropdownMenuItem(
                value: 'en',
                child: Row(
                  children: [
                    CountryFlag.fromCountryCode(
                      'GB',
                      height: 20,
                      width: 20,
                      shape: const Circle(),
                    ),
                    const SizedBox(width: 10),
                    const Text('English'),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: 'de',
                child: Row(
                  children: [
                    CountryFlag.fromCountryCode(
                      'DE',
                      height: 20,
                      width: 20,
                      shape: const Circle(),
                    ),
                    const SizedBox(width: 10),
                    const Text('Deutsch'),
                  ],
                ),
              ),
            ],
            onChanged: (String? newValue) {
              if (newValue != null) {
                localeProvider.setLocale(Locale(newValue));
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(S.of(context).greeting('Flutter')),
            Text(S.of(context).itemCount(3)),
          ],
        ),
      ),
    );
  }
}
