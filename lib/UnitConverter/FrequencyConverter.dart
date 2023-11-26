class FrequencyConverter{
  double value;
  Map<String, double> conversionRates = {
    'Hz': 1, // Base unit is Hertz
    'kHz': 1000, // Conversion rate from Hertz to kilohertz
    'MHz': 1000000, // Conversion rate from Hertz to megahertz
    'GHz': 1000000000, // Conversion rate from Hertz to gigahertz
  };
  FrequencyConverter(this.value);

  double convert(String from,String to) {
    if(conversionRates.containsKey(from) && conversionRates.containsKey(to)) {
      double fromRate = conversionRates[from]!;
      double toRate = conversionRates[to]!;
      return (value * fromRate) / toRate;
    }else{
      throw Exception('Invalid units');
    }
  }
}