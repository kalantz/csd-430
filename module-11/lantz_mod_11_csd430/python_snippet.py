"""
Kypton Lantz
October 3, 2025
CSD430-O307 Server Side Development (2261-DD)
Module 11 Assignment: Coding Standards (Python)
"""

def compute_total_price(unit_price: float, quantity: int) -> float:
    """
    Compute the total price for a given quantity of items.

    Coding Standards Demonstrated:
    - Function names use snake_case.
    - Docstring clearly describes purpose and parameters.
    - Type hints specify expected input and output types.
    - Readable formatting with consistent indentation.
    - Descriptive variable names instead of generic names (e.g., 'a', 'b').

    Args:
        unit_price (float): Price of a single unit.
        quantity (int): Number of units to purchase.

    Returns:
        float: Total price calculated as unit_price * quantity.
    """
    # Calculating total using clear, readable operation
    total_price = unit_price * quantity
    return total_price


def format_customer_name(first_name: str, last_name: str) -> str:
    """
    Format a customer's name in "Last, First" order.

    Coding Standards Demonstrated:
    - Function naming conveys clear action.
    - Proper spacing and readability inside operations.
    - Single-responsibility principle: function does one clear task.
    """
    return f"{last_name}, {first_name}"


# Example usage
if __name__ == "__main__":
    price = compute_total_price(19.99, 5)
    print(f"Total Price: ${price:.2f}")

    name = format_customer_name("Alice", "Johnson")
    print(f"Customer Name: {name}")
