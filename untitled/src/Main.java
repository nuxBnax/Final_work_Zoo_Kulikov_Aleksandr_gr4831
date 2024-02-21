import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


public class Main {

    public static void main(String[] args) throws ParseException {
        data();
        menu();
    }

    public static List<Animals> nursery = new ArrayList<>();
    public static Map<Integer, String> animalType = new HashMap<>();
    public static Map<Integer, String> homeAnimalType = new HashMap<>();
    public static Map<Integer, String> packAnimalType = new HashMap<>();


    /**
     *  data() - Метод заполняет БД предварительными данными
     */
    public static void data() throws ParseException {
        animalType.put(1, "Домашнее животное");
        animalType.put(2, "Вьючное животное");
        homeAnimalType.put(1, "Собака");
        homeAnimalType.put(2, "Кот");
        homeAnimalType.put(3, "Хомяк");
        packAnimalType.put(1, "Лошадь");
        packAnimalType.put(2, "Верблюд");
        packAnimalType.put(3, "Ослик");

        SimpleDateFormat format = new SimpleDateFormat("dd.MM.yyyy");

        nursery.add(new Dogs(1, animalType.get(1), homeAnimalType.get(1), "Барбос",
                new ArrayList<>(Arrays.asList("кушать", "плавать", "спать")),
                format.parse("10.09.2010")));
        nursery.add(new Dogs(2, animalType.get(1), homeAnimalType.get(1), "Шарик",
                new ArrayList<>(Arrays.asList("кушать", "плавать", "спать")),
                format.parse("11.05.2011")));
        nursery.add(new Cats(3, animalType.get(1), homeAnimalType.get(2), "Мурка",
                new ArrayList<>(Arrays.asList("кушать", "плавать", "спать")),
                format.parse("16.12.2009")));
        nursery.add(new Cats(4, animalType.get(1), homeAnimalType.get(2), "Белка",
                new ArrayList<>(Arrays.asList("кушать", "плавать", "спать")),
                format.parse("28.04.2017")));
        nursery.add(new Hamsters(5, animalType.get(1), homeAnimalType.get(3), "Пухлик",
                new ArrayList<>(Arrays.asList("кушать", "плавать", "спать")),
                format.parse("18.10.2013")));
        nursery.add(new Hamsters(6, animalType.get(1), homeAnimalType.get(3), "Чарли",
                new ArrayList<>(Arrays.asList("кушать", "плавать", "спать")),
                format.parse("28.08.2014")));
        nursery.add(new Horses(7, animalType.get(2), packAnimalType.get(1), "Молния",
                new ArrayList<>(Arrays.asList("скакать", "рысью", "лежать")),
                format.parse("08.02.2015")));
        nursery.add(new Horses(8, animalType.get(2), packAnimalType.get(1), "Буцефал",
                new ArrayList<>(Arrays.asList("скакать", "рысью", "лежать")),
                format.parse("18.12.2011")));
        nursery.add(new Camels(9, animalType.get(2), packAnimalType.get(2), "Барос",
                new ArrayList<>(Arrays.asList("скакать", "рысью", "лежать")),
                format.parse("28.10.2012")));
        nursery.add(new Camels(10, animalType.get(2), packAnimalType.get(2), "Каминол",
                new ArrayList<>(Arrays.asList("скакать", "рысью", "лежать")),
                format.parse("28.11.2009")));
        nursery.add(new Donkeys(11, animalType.get(2), packAnimalType.get(3), "Иа",
                new ArrayList<>(Arrays.asList("скакать", "рысью", "лежать")),
                format.parse("15.12.2006")));
        nursery.add(new Donkeys(12, animalType.get(2), packAnimalType.get(3), "Упертый",
                new ArrayList<>(Arrays.asList("скакать", "рысью", "лежать")),
                format.parse("28.03.2016")));
    }
    /**
     *  menu() - Метод выводит в консоль меню
     */
    public static void menu() throws ParseException {

        Scanner cs = new Scanner(System.in);

        boolean flag = true;
        while (flag) {

            System.out.println("Добро пожаловать в наш питомник\n" +
                    "Выберите цифру с командой для навигации по меню: \n" +
                    "1 - Добавить новое животное в реестр\n" +
                    "2 - Просмотреть список команд, которые может выполнять животное\n" +
                    "3 - Показать список животных по дате рождения\n" +
                    "4 - Показать сколько всего животных в питомнике\n" +
                    "5 - Добавить команду животному\n" +
                    "6 - Выход\n");

            int num = cs.nextInt();

            switch (num) {
                case 1 -> inputAnimal();
                case 2 -> animalOrders();
                case 3 -> {
                    for (Animals animals : animalDateSort(nursery)) {
                        System.out.println(animals);
                    }
                }
                case 4 -> {
                    animalCount();
                }
                case 5 -> addOrdersToAnimal();
                case 6 -> flag = false;
                default -> System.out.println("Ошибка! Введите цифру среди предложенных в меню!");
            }
        }
        cs.close();
    }
    /**
     *  inputAnimal() - Метод позволяет добавить новое животное в питомник
     */
    public static List<Animals> inputAnimal() throws ParseException {

        String animalName;
        String orderForAnimal;
        int family = 0;
        ArrayList<String> arrayOrder = null;
        String birth;

        Scanner cs = new Scanner(System.in);
        System.out.println("Введите цифру отвечающую за тип животного:");

        for (Map.Entry<Integer, String> entry : animalType.entrySet()) {
            System.out.println(entry.getKey() + " - " + entry.getValue());
        }

        int type = cs.nextInt();
        System.out.println("Вы добавили тип животного - " + animalType.get(type));

        System.out.println("Введите цифру отвечающую за семейство животного:");

        switch (type) {
            case 1 -> {
                for (Map.Entry<Integer, String> entry : homeAnimalType.entrySet()) {
                    System.out.println(entry.getKey() + " - " + entry.getValue());
                }
                family = cs.nextInt();
                System.out.println("Вы добавили тип животного - " + homeAnimalType.get(family));
            }
            case 2 -> {
                for (Map.Entry<Integer, String> entry : packAnimalType.entrySet()) {
                    System.out.println(entry.getKey() + " - " + entry.getValue());
                }
                family = cs.nextInt();
                System.out.println("Вы добавили тип животного - " + packAnimalType.get(family));
            }
            default -> System.out.println("Ошибка! Введите цифру среди предложенных в меню!");
        }

        System.out.println("Введите имя животного:");
        animalName = cs.next();
        System.out.println("Вы назвали животного " + animalName);

        System.out.println("Введите команду для животного:");
        orderForAnimal = cs.next();
        arrayOrder = new ArrayList<>(List.of(orderForAnimal.strip().split(" ")));
        System.out.println("Вы создали команду для животного " + arrayOrder);

        SimpleDateFormat format = new SimpleDateFormat("dd.MM.yyyy");
        System.out.println("Введите дату рождения вашего животного в формате dd.MM.yyyy :");
        birth = cs.next();
        Date birthOfAnimal = format.parse(birth);
        System.out.println("Вы задали дату рождения животного " + format.format(birthOfAnimal));

        switch (type) {
            case 1 -> {
                switch (family) {
                    case 1 -> nursery.add(new Dogs(nursery.size() + 1, animalType.get(type),
                            homeAnimalType.get(family), animalName, arrayOrder, birthOfAnimal));
                    case 2 -> nursery.add(new Cats(nursery.size() + 1, animalType.get(type),
                            homeAnimalType.get(family), animalName, arrayOrder, birthOfAnimal));
                    case 3 -> nursery.add(new Hamsters(nursery.size() + 1, animalType.get(type),
                            homeAnimalType.get(family), animalName, arrayOrder, birthOfAnimal));
                    default -> System.out.println("Ошибка! Введите цифру среди предложенных в меню!");
                }
            }
            case 2 -> {
                switch (family) {
                    case 1 -> nursery.add(new Horses(nursery.size() + 1, animalType.get(type),
                            packAnimalType.get(family), animalName, arrayOrder, birthOfAnimal));
                    case 2 -> nursery.add(new Camels(nursery.size() + 1, animalType.get(type),
                            packAnimalType.get(family), animalName, arrayOrder, birthOfAnimal));
                    case 3 -> nursery.add(new Donkeys(nursery.size() + 1, animalType.get(type),
                            packAnimalType.get(family), animalName, arrayOrder, birthOfAnimal));
                    default -> System.out.println("Ошибка! Введите цифру среди предложенных в меню!");
                }
            }
        }
        return nursery;
    }
    /**
     *  animalCount() - Метод показывает общее количество животных в питомнике
     */
    public static void animalCount() {
        System.out.println("**************************************************************************************");
        System.out.println("Всего в питомнике - " + nursery.size());
    }
    /**
     *  animalOrders() - Метод позволяет просмотреть команды которое может выполнять животное
     */
    public static void animalOrders() {

        Scanner cs = new Scanner(System.in);

        for (Animals animals : nursery) {
            System.out.println(animals);
        }
        System.out.println("**************************************************************************************");
        System.out.println("Введите номер животного из списка выше: ");
        int animalId = cs.nextInt();

        Animals animal = nursery.get(animalId - 1);
        ArrayList<String> orders = animal.getOrder();
        System.out.println(orders);
    }
    /**
     *  animalDateSort() - Метод позволяет добавить новое животное в питомник
     */
    public static List<Animals> animalDateSort(List<Animals> animalList) {

        List<Animals> tempNursery = new ArrayList<>(List.copyOf(animalList));

        Collections.sort(tempNursery);
        return tempNursery;
    }
    /**
     *  addOrdersToAnimal() - Метод позволяет добавить новые команды для животного по id из списка
     */
    public static void addOrdersToAnimal() {

        Scanner cs = new Scanner(System.in);

        for (Animals animals : nursery) {
            System.out.println(animals);
        }
        System.out.println("Введите номер животного из списка выше: ");
        int animalId = cs.nextInt();

        Animals animal = nursery.get(animalId - 1);

        System.out.println("Введите команду для добавления списка команд: ");
        String command = cs.next();
        ArrayList<String> orders = animal.getOrder();
        System.out.println(orders.add(command));
        System.out.println("Результат добавления команды: ");
        System.out.println("**************************************************************************************");
        System.out.println(animal);
        System.out.println("**************************************************************************************");
    }
}


















