class VolumeConverter{
  double value;
  Map<String, double> conversionRates = {
    'mm³': 1,
    'cm³': 1000,
    'ml': 1000,
    'l': 1000000,
    'm³': 1000000000,
    'in³': 16387.064,
    'ft³': 28316846.592,
    'yd³': 764554857.984
  };
  VolumeConverter(this.value);

  double convert(String from, String to){
    if(conversionRates.containsKey(from) && conversionRates.containsKey(to)){
      double fromRate = conversionRates[from]!;
      double toRate = conversionRates[to]!;
      return (value * fromRate) / toRate;
    }
    return 0;
  }
}