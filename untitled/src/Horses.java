import java.util.ArrayList;
import java.util.Date;

public class Horses extends PackAnimal{

    /**
     * @param type тип животного (домашнее или вьючное)
     * @param family семейство животного
     * @param name имя животного
     * @param order команды которые животное может выполнять
     * @param birthdate дата рождения животного
     */

    public Horses(int id,String type, String family, String name, ArrayList<String> order, Date birthdate) {
        super(id, type, family, name, order, birthdate);
    }
}
