class Priority
    LOW = 3
    MEDIUM = 2
    HIGH = 1

    # Class method to get the name of the priority based on its value
    def self.name(value)
        case value
        when HIGH then "HIGH"
        when MEDIUM then "MEDIUM"
        when LOW then "LOW"
        else "UNKNOWN"
        end
    end
end
  
class Package
    attr_reader :id, :weight, :priority

    def initialize(id, weight, priority)
        @id = id
        @weight = weight
        @priority = priority
    end

    def describe
        "Package #{@id}, weight #{@weight}, priority #{Priority.name(@priority)}"
    end
end
  
class Truck
    attr_reader :id, :capacity, :packages

    def initialize(id, capacity)
        @id = id
        @capacity = capacity
        @packages = []
    end

    def describe
        if @packages.any?
        package_list = @packages.map(&:describe).join(", ")
        "Truck #{@id}, Capacity: #{@capacity}, Packages: [#{package_list}]"
        else
        "Truck #{@id}, Capacity: #{@capacity}, no packages."
        end
    end

    def load(package)
        @packages << package
        @capacity -= package.weight
    end
end
  
class Allocator
    def self.allocate_packages(trucks, packages)
        # Sort packages by priority (ascending order)
        packages = packages.sort_by(&:priority)
        packages.each do |package|
            allocated = false
            trucks.each do |truck|
                if truck.capacity >= package.weight
                    truck.load(package)
                    allocated = true
                    break
                end
            end
            puts "Package #{package.id} could not be allocated due to insufficient capacity." unless allocated
        end
    end
end
  

packages = [
    Package.new("1", 200, Priority::HIGH),
    Package.new("2", 100, Priority::HIGH),
    Package.new("3", 300, Priority::HIGH),
    Package.new("4", 400, Priority::LOW),
    Package.new("5", 80, Priority::LOW),
    Package.new("6", 205, Priority::MEDIUM),
    Package.new("7", 345, Priority::HIGH),
    Package.new("8", 90, Priority::MEDIUM),
    Package.new("9", 200, Priority::HIGH),
    Package.new("10", 200, Priority::HIGH),
    Package.new("11", 100, Priority::HIGH),
    Package.new("12", 300, Priority::HIGH)
]

trucks = [
    Truck.new("A", 750),
    Truck.new("B", 250),
    Truck.new("C", 500),
    Truck.new("D", 950)
]

# Allocate packages to trucks
Allocator.allocate_packages(trucks, packages)

# Output truck descriptions
trucks.each { |truck| puts truck.describe }
