class SpeedConverter{
  double value;
  Map<String, double> conversionRates = {
    'mm/s': 0.001,
    'cm/s': 0.01,
    'm/s': 1,
    'km/h': 1 / 3.6,
    'in/s': 1 / 39.37,
    'ft/s': 1 / 3.281,
    'yd/s': 1 / 1.094,
    'mph': 1 / 2.237
  };
  SpeedConverter(this.value);

  double convert(String from, String to){
    if(conversionRates.containsKey(from) && conversionRates.containsKey(to)){
      double fromRate = conversionRates[from]!;
      double toRate = conversionRates[to]!;
      return (value * fromRate) / toRate;
    }
    return 0;
  }
}