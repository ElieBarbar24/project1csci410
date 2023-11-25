class AreaConverter{
  double value;
  Map<String, double> conversionRates = {
    'mm²': 1,
    'cm²': 100,
    'm²': 1000000,
    'ha': 10000000000,
    'km²': 1000000000000,
    'in²': 645.16,
    'ft²': 92903.04,
    'yd²': 836127.36
  };
  AreaConverter(this.value);

  double convert(String from, String to) {
    if(conversionRates.containsKey(from) && conversionRates.containsKey(to)){
      double fromRate = conversionRates[from]!;
      double toRate = conversionRates[to]!;
      return (value * fromRate) / toRate;
    }
    return 0;
  }
}