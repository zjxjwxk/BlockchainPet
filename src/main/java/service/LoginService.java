package service;

import java.util.HashMap;
import java.util.Map;

/**
 * @author zjxjwxk
 */
public class LoginService {

    private Map<String, String> account = new HashMap<>();

    public LoginService() {
        account.put("wuxinkang", "123456");
    }

    public boolean checkLogin(String username, String password) {
        if (!password.equals(account.get(username))) {
            return false;
        } else {
            return true;
        }
    }
}
