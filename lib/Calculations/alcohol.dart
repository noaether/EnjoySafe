double calculateAlcoholMass(
    double volumeMilliliters, double alcoholPercentage) {
  // Convert volume from milliliters to liters
  final volumeLiters = volumeMilliliters / 1000;

  // Calculate the alcohol mass in grams using the formula: volume (liters) * alcohol percentage * density
  final alcoholMass = volumeLiters * alcoholPercentage * 0.78945;

  return alcoholMass;
}

double calculateBAC(double alcoholMassGrams, double bodyWaterRatio,
    double bodyWeightKg, double timeSinceConsumptionMinutes) {
  const alcoholMetabolismRate = 0.017;

  // Calculate the alcohol elimination factor based on body water ratio and body weight
  final eliminationFactor = bodyWaterRatio * bodyWeightKg;

  // Calculate the alcohol concentration in the blood
  final alcoholConcentration = (alcoholMassGrams / eliminationFactor) * 100;

  // Calculate the elapsed time in hours
  final elapsedTimeHours = timeSinceConsumptionMinutes / 60;

  // Calculate the estimated BAC using the Widmark formula
  final estimatedBAC =
      alcoholConcentration - (alcoholMetabolismRate * elapsedTimeHours);

  return estimatedBAC;
}

double calculateTotalAlcoholMass(List<List<double>> alcoholData) {
  double totalAlcoholMass = 0.0;

  for (var data in alcoholData) {
    final volume = data[0];
    final percentage = data[1];

    final alcoholMass = calculateAlcoholMass(volume, percentage);
    totalAlcoholMass += alcoholMass;
  }

  return totalAlcoholMass;
}
