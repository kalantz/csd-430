/**
 * Kypton Lantz
 * October 3, 2025
 * File: CodingStandardsExample.java
 * CSD430-O307 Server Side Development (2261-DD)
 * Module 11 Assignment: Coding Standards (Java)
 */
public class CodingStandardsExample {

    /**
     * Compute the sum of two integers.
     *
     * Coding Standards Demonstrated:
     * - Method names use camelCase.
     * - Javadoc clearly describes the method purpose and parameters.
     * - Consistent indentation (4 spaces).
     * - Meaningful parameter names.
     * - Avoid magic numbers; values passed as arguments or constants.
     *
     * @param firstOperand  First integer to add.
     * @param secondOperand Second integer to add.
     * @return Sum of firstOperand and secondOperand.
     */
    public int addIntegers(int firstOperand, int secondOperand) {
        return firstOperand + secondOperand;
    }

    /**
     * Format a customer's full name.
     *
     * Coding Standards Demonstrated:
     * - Method naming communicates clear action.
     * - String concatenation readability.
     * - Single responsibility: performs only one task.
     *
     * @param firstName Customer's first name.
     * @param lastName  Customer's last name.
     * @return Formatted name as "Last, First".
     */
    public String formatCustomerName(String firstName, String lastName) {
        return lastName + ", " + firstName;
    }

    public static void main(String[] args) {
        CodingStandardsExample example = new CodingStandardsExample();

        int total = example.addIntegers(12, 30);
        System.out.println("Sum: " + total);

        String name = example.formatCustomerName("Alice", "Johnson");
        System.out.println("Customer Name: " + name);
    }
}
