void main() {
  List<double> cartItems = [25.0, 15.0, 45.0, 8.0, 60.0];

  // Filter out items below $10
  cartItems = cartItems.where((item) => item >= 10).toList();
  print("Filtered Cart Items: $cartItems");

  // Calculate total price before discount and tax
  double total = calculateTotal(cartItems);
  print("Total before discount and tax: \$${total.toStringAsFixed(2)}");

  // Apply a discount using the applyDiscount function
  double discountPercentage = 10.0; // Example discount of 10%
  total = applyDiscount(cartItems, (price) => price * (1 - discountPercentage / 100));
  print("Total after discount: \$${total.toStringAsFixed(2)}");

  // Apply tax (optional parameter)
  double totalWithTax = calculateTotal(cartItems, tax: 5.0); // 5% tax
  print("Total after tax: \$${totalWithTax.toStringAsFixed(2)}");

  // Apply the special factorial discount
  int itemCount = cartItems.length;
  double factorialDiscount = calculateFactorialDiscount(itemCount) / 100;
  totalWithTax *= (1 - factorialDiscount);
  print("Final Total after factorial discount: \$${totalWithTax.toStringAsFixed(2)}");
}

// Standard Function: Calculate total price with optional tax
double calculateTotal(List<double> prices, {double tax = 0}) {
  double total = prices.reduce((value, element) => value + element);
  return total * (1 + tax / 100);
}

// Higher-Order Function: Apply discount
double applyDiscount(List<double> prices, double Function(double) discountFunction) {
  return prices.map(discountFunction).reduce((value, element) => value + element);
}

// Recursive Function: Calculate factorial-based discount
int calculateFactorialDiscount(int n) {
  if (n == 1) {
    return 1;
  }
  return n * calculateFactorialDiscount(n - 1);
}
