import java.text.SimpleDateFormat;
import java.util.*;

public abstract class Animals implements Comparable<Animals> {
    int id;
    String type;
    String family;
    String name;
    ArrayList<String> order;
    Date birthdate;

    /**
     * @param type тип животного (домашнее или вьючное)
     * @param family семейство животного
     * @param name имя животного
     * @param order команды которые животное может выполнять
     * @param birthdate дата рождения животного
     */
    public Animals(int id,String type, String family, String name, ArrayList<String> order, Date birthdate) {
        this.id = id;
        this.type = type;
        this.family = family;
        this.name = name;
        this.order = order;
        this.birthdate = birthdate;
    }

    public ArrayList<String> getOrder() {
        return order;
    }

    public void setOrder(ArrayList<String> order) {
        this.order = order;
    }

    public String getName() {
        return name;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    @Override
    public String toString() {

        Animals animal = Main.nursery.get(getId() - 1);
        ArrayList<String> orders = animal.getOrder();

        SimpleDateFormat format = new SimpleDateFormat("dd.MM.yyyy");
        return  id + " - " + type +
                ", Семейство - " + family +
                ", Имя - " + name +
                ", Команды - " + orders +
                ", День рождения - " + format.format(birthdate);
    }

    @Override
    public boolean equals(Object obj) {
        return ((Animals) obj).getName().equals(getName());
    }

    @Override
    public int compareTo(Animals o) {
        return this.getBirthdate().after(o.getBirthdate()) ? 1 :
                o.getBirthdate().after(this.getBirthdate()) ? -1 : 0;
    }
}














