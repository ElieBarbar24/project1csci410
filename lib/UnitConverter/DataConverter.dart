class DataConverter{
  double value;
  Map<String, double> conversionRates = {
    'b': 1,
    'B': 8,
    'kb': 1000,
    'kB': 8000,
    'Mb': 1000000,
    'MB': 8000000,
    'Gb': 1000000000,
    'GB': 8000000000
  };
  DataConverter(this.value);

  double convert(String from,String to) {
    if(conversionRates.containsKey(from) && conversionRates.containsKey(to)) {
      double fromRate = conversionRates[from]!;
      double toRate = conversionRates[to]!;
      return(value * fromRate) / toRate;
    }
    return 0;
  }
}