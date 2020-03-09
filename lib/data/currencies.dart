import 'package:bethriftytoday/models/models.dart';
import 'package:flutter/material.dart';

final List<Currency> baseCurrencies = [
  Currency(
    id: UniqueKey().toString(),
    name: 'Singapore Dollar',
    symbol: 'S\$',
  ),
  Currency(
    id: UniqueKey().toString(),
    name: 'Dollar',
    symbol: '\$',
  ),
  Currency(
    id: UniqueKey().toString(),
    name: 'Pound',
    symbol: '£',
  ),
  Currency(
    id: UniqueKey().toString(),
    name: 'Euro',
    symbol: '€',
  ),
  Currency(
    id: UniqueKey().toString(),
    name: 'Rupee',
    symbol: '₹',
  ),
  Currency(
    id: UniqueKey().toString(),
    name: 'Yen',
    symbol: '¥',
  ),
];
