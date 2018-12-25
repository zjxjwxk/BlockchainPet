package service;

import model.Pet;
import servlet.InformationServlet;

import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @author zjxjwxk
 */
public class MultiplicationService {

    /**
     * 由两只莱茨狗繁衍下一代莱茨狗算法
     * @param pet1 莱茨狗1
     * @param pet2 莱茨狗2
     * @return 下一代莱茨狗
     */
    public Pet multiplication(Pet pet1, Pet pet2){
        List<Map.Entry<String, Integer>> basicQualitysList1 = new ArrayList<>(pet1.getBasicQualitys().entrySet());
        List<Map.Entry<String, Integer>> basicQualitysList2 = new ArrayList<>(pet2.getBasicQualitys().entrySet());

        int len = basicQualitysList1.size();
        Pet retPet = new Pet();

        Random random = new Random();
        // 随机一个1~1000的数
        int randomNum = random.nextInt(1000) + 1;

        Map<String, Integer> basicQualityList = new HashMap<>();
        // 若为素数
        if (ifPrime(randomNum)) {
            for (int i = 0; i < len; i++) {
                Map.Entry<String, Integer> entry1 = basicQualitysList1.get(i);
                Map.Entry<String, Integer> entry2 = basicQualitysList2.get(i);
                // 若该属性都为稀有，下一代稀有的概率为85%
                if (entry1.getValue() == 1 && entry2.getValue() == 1) {
                    randomNum = random.nextInt(100) + 1;
                    if (1 <= randomNum && randomNum <= 85) {
                        basicQualityList.put(entry1.getKey(), 1);
                    } else {
                        basicQualityList.put(entry2.getKey(), 0);
                    }
                    // 若该属性都为普通，下一代稀有的概率为25%
                } else if (entry1.getValue() == 0 && entry2.getValue() == 0) {
                    randomNum = random.nextInt(100) + 1;
                    if (1 <= randomNum && randomNum <= 25) {
                        basicQualityList.put(entry1.getKey(), 1);
                    } else {
                        basicQualityList.put(entry2.getKey(), 0);
                    }
                    // 若该属性有一个是稀有，下一代稀有的概率为60%
                } else {
                    randomNum = random.nextInt(100) + 1;
                    if (1 <= randomNum && randomNum <= 60) {
                        basicQualityList.put(entry1.getKey(), 1);
                    } else {
                        basicQualityList.put(entry2.getKey(), 0);
                    }
                }
            }
            // 若不为素数
        } else {
            for (int i = 0; i < len; i++) {
                Map.Entry<String, Integer> entry1 = basicQualitysList1.get(i);
                Map.Entry<String, Integer> entry2 = basicQualitysList2.get(i);
                // 若该属性都为稀有，下一代稀有的概率为75%
                if (entry1.getValue() == 1 && entry2.getValue() == 1) {
                    randomNum = random.nextInt(100) + 1;
                    if (1 <= randomNum && randomNum <= 75) {
                        basicQualityList.put(entry1.getKey(), 1);
                    } else {
                        basicQualityList.put(entry2.getKey(), 0);
                    }
                    // 若该属性都为普通，下一代稀有的概率为15%
                } else if (entry1.getValue() == 0 && entry2.getValue() == 0) {
                    randomNum = random.nextInt(100) + 1;
                    if (1 <= randomNum && randomNum <= 15) {
                        basicQualityList.put(entry1.getKey(), 1);
                    } else {
                        basicQualityList.put(entry2.getKey(), 0);
                    }
                    // 若该属性有一个是稀有，下一代稀有的概率为50%
                } else {
                    randomNum = random.nextInt(100) + 1;
                    if (1 <= randomNum && randomNum <= 50) {
                        basicQualityList.put(entry1.getKey(), 1);
                    } else {
                        basicQualityList.put(entry2.getKey(), 0);
                    }
                }
            }
        }

        retPet.setBasicQualitys(basicQualityList);
        return retPet;
    }

    /**
     * 判断一个数是否为素数
     * @param n 判断的数
     * @return 是否为素数
     */
    private boolean ifPrime(int n) {
        for (int i = 2; i <= Math.sqrt(n); i++) {
            if (n % i == 0) {
                return false;
            }
        }
        return true;
    }
}
