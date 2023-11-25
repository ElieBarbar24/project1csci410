class LengthConverter {
  double value;
  Map<String, double> conversionRates = {
    'mm': 1,
    'cm': 10,
    'm': 1000,
    'km': 1000000,
    'in': 25.4,
    'ft': 304.8,
    'yd': 914.4,
    'mi': 1609344
  };
  LengthConverter(this.value);

  double convert(String from, String to) {
    if(conversionRates.containsKey(from) && conversionRates.containsKey(to)){
      double fromRate = conversionRates[from]!;
      double toRate = conversionRates[to]!;
      return  (value * fromRate) / toRate;
    }
    return 0;
  }
}