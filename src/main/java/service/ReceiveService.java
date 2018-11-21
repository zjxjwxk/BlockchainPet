package service;

import java.util.Random;

/**
 * @author zjxjwxk
 */
public class ReceiveService {

    public String getRandomFilename() {
        Random random = new Random();
        return String.valueOf(random.nextInt(6) + 1) + ".png";
    }
}
