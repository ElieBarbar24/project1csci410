class TimeConverter{
  double value;
  Map<String, double> conversionRates = {
    'ns': 1,
    'µs': 1000,
    'ms': 1000000,
    's': 1000000000,
    'min': 60000000000,
    'h': 3600000000000,
    'd': 86400000000000,
    'wk': 604800000000000
  };
  TimeConverter(this.value);

  double convert(String from, String to) {
    if(conversionRates.containsKey(from) && conversionRates.containsKey(to)) {
      double fromRate = conversionRates[from]!;
      double toRate = conversionRates[to]!;
      return (value * fromRate) / toRate;
    }
    return 0;
  }
}