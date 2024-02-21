import java.util.*;

public class HomeAnimal extends Animals{

    /**
     * @param type тип животного (домашнее или вьючное)
     * @param family семейство животного
     * @param name имя животного
     * @param order команды которые животное может выполнять
     * @param birthdate дата рождения животного
     */

    public HomeAnimal(int id, String type, String family, String name, ArrayList<String> order, Date birthdate) {
        super(id,type, family, name, order, birthdate);
    }

}
