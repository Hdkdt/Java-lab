import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

abstract class AquaticAnimal {
    String name;
    double basePrice;

    AquaticAnimal(String name, double basePrice) {
        this.name = name;
        this.basePrice = basePrice;
    }

    abstract double calculatePrice();
}

class Fish extends AquaticAnimal {
    Fish(String name, double basePrice) {
        super(name, basePrice);
    }

    @Override
    double calculatePrice() {
        return basePrice;
    }
}

class Reptile extends AquaticAnimal {
    Reptile(String name, double basePrice) {
        super(name, basePrice);
    }

    double calculatePrice() {
        return basePrice;
    }
}

class Aquarium {
    List<AquaticAnimal> animals;
    double accessoriesCost;

    Aquarium() {
        this.animals = new ArrayList<>();
        this.accessoriesCost = 0.0;
    }

    void addAnimal(AquaticAnimal animal) {
        animals.add(animal);
    }

    void addAccessories(double cost) {
        accessoriesCost += cost;
    }

    double calculateTotalPrice() {
        double total = accessoriesCost;

        for (AquaticAnimal animal : animals) {
            total += animal.calculatePrice();
        }

        return total;
    }
}

public class Main {
    public static void main(String[] args) {
        Aquarium myAquarium = new Aquarium();
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter first animal(name, price): ");
        String name1 = scanner.next();
        int price1 = scanner.nextInt();
        myAquarium.addAnimal(new Fish(name1, price1));

        System.out.print("Enter second animal(name, price): ");
        String name2 = scanner.next();
        int price2 = scanner.nextInt();
        myAquarium.addAnimal(new Fish(name2, price2));

        System.out.print("Enter third animal(name, price): ");
        String name3 = scanner.next();
        int price3 = scanner.nextInt();
        myAquarium.addAnimal(new Reptile(name3, price3));

        // Add accessories to the aquarium
        myAquarium.addAccessories(20000);

        // Calculate and display the total price
        double totalPrice = myAquarium.calculateTotalPrice();
        System.out.println("Total Price of the Aquarium: " + totalPrice);
    }
}
