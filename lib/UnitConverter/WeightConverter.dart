class WeightConverter{
  double value;
  Map<String, double> conversionRates = {
    'mg': 1,
    'g': 1000,
    'kg': 1000000,
    't': 1000000000,
    'oz': 28349.5,
    'lb': 453592.37,
    'ust': 6350293.18,
    'ton': 1000000000,
  };
  WeightConverter(this.value);

  double convert(String from, String to){
    if(conversionRates.containsKey(from) && conversionRates.containsKey(to)){
      double fromRate = conversionRates[from]!;
      double toRate = conversionRates[to]!;
      return (value * fromRate) / toRate;
    }
    return 0;
  }
}