class TemperatureConverter{
  double value;
  Map<String, double> conversionRates = {
    '°C': 1,
    '°F': 33.8,
    'K': 274.15,
  };
  TemperatureConverter(this.value);

  double convert(String from, String to){
    if(conversionRates.containsKey(from) && conversionRates.containsKey(to)){
      double fromRate = conversionRates[from]!;
      double toRate = conversionRates[to]!;
      return (value * fromRate) / toRate;
    }else{
      throw Exception('Invalid units');
    }
  }
}