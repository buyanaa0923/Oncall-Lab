class TestType {
  final String id;
  final String name;
  final String description;
  final double price;
  final String sampleType;
  final String preparationInstructions;

  const TestType({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.sampleType,
    required this.preparationInstructions,
  });
}

// Common lab test types in Mongolia
final List<TestType> labTestTypes = [
  TestType(
    id: '1',
    name: 'Complete Blood Count (CBC)',
    description: 'Measures different components of blood',
    price: 15000,
    sampleType: 'Blood',
    preparationInstructions: 'No special preparation needed',
  ),
  TestType(
    id: '2',
    name: 'Blood Glucose',
    description: 'Measures blood sugar level',
    price: 8000,
    sampleType: 'Blood',
    preparationInstructions: 'Fasting for 8-12 hours required',
  ),
  TestType(
    id: '3',
    name: 'Lipid Profile',
    description: 'Measures cholesterol and triglycerides',
    price: 20000,
    sampleType: 'Blood',
    preparationInstructions: 'Fasting for 12 hours required',
  ),
  TestType(
    id: '4',
    name: 'Liver Function Test',
    description: 'Checks how well your liver is working',
    price: 25000,
    sampleType: 'Blood',
    preparationInstructions: 'No special preparation needed',
  ),
  TestType(
    id: '5',
    name: 'Kidney Function Test',
    description: 'Measures kidney health',
    price: 22000,
    sampleType: 'Blood',
    preparationInstructions: 'No special preparation needed',
  ),
  TestType(
    id: '6',
    name: 'Urinalysis',
    description: 'Analyzes urine for various conditions',
    price: 10000,
    sampleType: 'Urine',
    preparationInstructions: 'First morning sample preferred',
  ),
  TestType(
    id: '7',
    name: 'Thyroid Function Test',
    description: 'Measures thyroid hormone levels',
    price: 30000,
    sampleType: 'Blood',
    preparationInstructions: 'No special preparation needed',
  ),
  TestType(
    id: '8',
    name: 'HbA1c (Diabetes Test)',
    description: 'Measures average blood sugar over 3 months',
    price: 18000,
    sampleType: 'Blood',
    preparationInstructions: 'No fasting required',
  ),
];
