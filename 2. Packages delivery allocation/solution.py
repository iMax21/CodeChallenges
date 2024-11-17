from enum import Enum

class Priority(Enum):
    LOW = 3
    MEDIUM = 2
    HIGH = 1

class Package:
    def __init__(self, id, weight: int, priority: Priority):
        self.id = id
        self.weight = weight
        self.priority = priority
    
    def describe(self):
        return f"Package {self.id}, weight {self.weight}, priority {self.priority.name}"


class Truck:
    def __init__(self, id, capacity: int):
        self.id = id
        self.capacity = capacity
        self.packages = []

    def describe(self):
        if len(self.packages) > 0:
            package_list = ", ".join(pkg.describe() for pkg in self.packages)
            return f"Truck {self.id}, Capacity: {self.capacity}, Packages: [{package_list}]"
        
        return f"Truck {self.id}, Capacity: {self.capacity}, no packages."

    def load(self, package):
        self.packages.append(package)
        self.capacity -= package.weight


class Allocator():
    @staticmethod
    def allocate_packages(trucks, packages):
        packages = sorted(packages, key=lambda x: x.priority.value)
        for package in packages:
            allocated = False
            for truck in trucks:
                if truck.capacity >= package.weight:
                    truck.load(package)
                    allocated = True
                    break
            if not allocated:
                print(f"Package {package.id} could not be allocated due to insufficient capacity.")

def main():
    packages = [
        Package("1", 200, Priority.HIGH),
        Package("2", 100, Priority.HIGH),
        Package("3", 300, Priority.HIGH),
        Package("4", 400, Priority.LOW),
        Package("5", 80, Priority.LOW),
        Package("6", 205, Priority.MEDIUM),
        Package("7", 345, Priority.HIGH),
        Package("8", 90, Priority.MEDIUM),
        Package("9", 200, Priority.HIGH),
        Package("10", 200, Priority.HIGH),
        Package("11", 100, Priority.HIGH),
        Package("12", 300, Priority.HIGH)
    ]

    trucks = [
        Truck("A", 750),
        Truck("B", 250),
        Truck("C", 500),
        Truck("D", 950),
    ]
    
    # Allocate packages to trucks
    Allocator.allocate_packages(trucks, packages)

    # Output truck descriptions
    for truck in trucks:
        print(truck.describe())


if __name__ == "__main__":
    main()
