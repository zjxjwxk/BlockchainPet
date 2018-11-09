package service;

/**
 * @author zjxjwxk
 */
public class ExamService {

    static String[][] correctAnswers = {
            {"4"},
            {"2"},
            {"1", "2"},
            {"1", "2", "4"},
            {"10240m"},
            {"finally finished"},
            {"2"},
            {"2"}
    };

    public int checkAnswer(String[][] answers) {
        int score = 0;
        for (int i = 0; i < answers.length; i++) {
            // 判断该题用户的回答和正确答案的选项数是否相等（用于判断多选题）
            if (answers[i].length == correctAnswers[i].length) {
                // 判断该题用户的每个选项是否和正确答案相匹配
                boolean correct = true;
                for (int j = 0; j < answers[i].length; j++) {
                    if (!answers[i][j].equals(correctAnswers[i][j])) {
                        correct = false;
                        break;
                    }
                }
                if (correct) {
                    if (correctAnswers[i].length > 1) {
                        score += 20;
                    } else {
                        score += 10;
                    }
                }
            }
        }
        return score;
    }
}
