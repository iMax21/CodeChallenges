# 2. Packages delivery allocation
A delivery company has a fleet of trucks that transport packages from a central warehouse to various locations. Each truck has a limited capacity, and packages vary in size. Packages also have priority levels indicating their urgency, and we aim to maximize the delivery of higher-priority packages within the truck capacities.

# Objective
Write a program to allocate packages to trucks, prioritizing the delivery of higher-priority packages while respecting each truck’s capacity limit. The program should find an optimal way to load the trucks to ensure the highest-priority packages are assigned whenever possible.

# Requirements
## Truck Capacity
Each truck has a maximum weight capacity it can carry.

## Package Information
- **Weight**: Each package has a specific weight.
- **Priority**: Each package has a priority level (e.g., high, medium, low).

## Allocation Goal
- Maximize the loading of high-priority packages.
- If multiple high-priority packages cannot fit due to weight limits, then select a feasible combination of medium and low-priority packages that fits within the remaining capacity.

# Input
You will receive:
- A list of trucks with their respective maximum capacities.
- A list of packages with each package’s weight and priority level.

# Expected Output
Your program should output an allocation plan that shows which packages should go on which trucks to maximize the delivery of higher-priority packages.

# Constraints
- **Capacity Constraint**: The total weight of packages on each truck must not exceed its maximum capacity.
- **Priority-Based Allocation**: Packages with higher priority should be considered first, followed by medium and low priorities if capacity allows.

# Example

**Input:**

**Trucks:**
- Truck A: Capacity = 1000 kg
- Truck B: Capacity = 750 kg

**Packages:**
- Package 1: Weight = 300 kg, Priority = High
- Package 2: Weight = 500 kg, Priority = High
- Package 3: Weight = 200 kg, Priority = Medium
- Package 4: Weight = 100 kg, Priority = Low
- Package 5: Weight = 250 kg, Priority = Medium
- Package 6: Weight = 150 kg, Priority = High

**Output:**
An optimal allocation plan that shows which packages should be loaded onto each truck to maximize the number of high-priority packages delivered within the capacity limits.

# Notes
- If a truck has remaining capacity after loading all high-priority packages that can fit, the program should attempt to fill the remaining space with medium or low-priority packages.
- The solution should aim for the highest-priority packages and then move down the priority list if needed.
