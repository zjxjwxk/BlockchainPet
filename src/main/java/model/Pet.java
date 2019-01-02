package model;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * @author zjxjwxk
 */
public class Pet {

    private String name;
    private Integer id;
    private String quality;
    private Integer generation;
    private String imgPath;

    private String bodyType;
    private String eye;
    private String mouth;
    private String bodyColor;
    private String pattern;
    private String eyeColor;
    private String bellyColor;
    private String patternColor;

    /**
     * 基本属性对应的稀有度，1代表稀有，0代表普通
     */
    private Map<String, Integer> basicQualitys;

    public Pet() {
        Random random = new Random();

        this.name = "小莱";
        // id 为 1~99999999
        this.id = random.nextInt(99999999) + 1;
        this.quality = "普通";
        this.generation = 0;
        // img为1~13.png
        this.imgPath = "resources/img/" + (random.nextInt(13) + 1) + ".png";
        this.bodyType = "招风耳";
        this.eye = "小惊讶";
        this.mouth = "达利胡";
        this.bodyColor = "鹅黄";
        this.pattern = "斑马纹";
        this.eyeColor = "眼睛色";
        this.bellyColor = "异光蓝";
        this.patternColor = "紫灰";

        basicQualitys = new HashMap<>();
        this.basicQualitys = new HashMap<>();
        basicQualitys.put("bodyType", 0);
        basicQualitys.put("eye", 0);
        basicQualitys.put("mouth", 1);
        basicQualitys.put("bodyColor", 0);
        basicQualitys.put("pattern", 1);
        basicQualitys.put("eyeColor", 0);
        basicQualitys.put("bellyColor", 1);
        basicQualitys.put("patternColor", 0);
    }

    public Pet(String name, Integer id, String quality, Integer generation,
               String imgPath, String bodyType, String eye, String mouth,
               String bodyColor, String pattern, String eyeColor, String bellyColor,
               String patternColor) {
        this.name = name;
        this.id = id;
        this.quality = quality;
        this.generation = generation;
        this.imgPath = imgPath;
        this.bodyType = bodyType;
        this.eye = eye;
        this.mouth = mouth;
        this.bodyColor = bodyColor;
        this.pattern = pattern;
        this.eyeColor = eyeColor;
        this.bellyColor = bellyColor;
        this.patternColor = patternColor;

        // 初始化为3个基本属性为稀有
        this.basicQualitys = new HashMap<>();
        basicQualitys.put("bodyType", 0);
        basicQualitys.put("eye", 0);
        basicQualitys.put("mouth", 1);
        basicQualitys.put("bodyColor", 0);
        basicQualitys.put("pattern", 1);
        basicQualitys.put("eyeColor", 0);
        basicQualitys.put("bellyColor", 1);
        basicQualitys.put("patternColor", 0);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQuality() {
        return quality;
    }

    public void setQuality(String quality) {
        this.quality = quality;
    }

    public Integer getGeneration() {
        return generation;
    }

    public void setGeneration(Integer generation) {
        this.generation = generation;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getBodyType() {
        return bodyType;
    }

    public void setBodyType(String bodyType) {
        this.bodyType = bodyType;
    }

    public String getEye() {
        return eye;
    }

    public void setEye(String eye) {
        this.eye = eye;
    }

    public String getMouth() {
        return mouth;
    }

    public void setMouth(String mouth) {
        this.mouth = mouth;
    }

    public String getBodyColor() {
        return bodyColor;
    }

    public void setBodyColor(String bodyColor) {
        this.bodyColor = bodyColor;
    }

    public String getPattern() {
        return pattern;
    }

    public void setPattern(String pattern) {
        this.pattern = pattern;
    }

    public String getEyeColor() {
        return eyeColor;
    }

    public void setEyeColor(String eyeColor) {
        this.eyeColor = eyeColor;
    }

    public String getBellyColor() {
        return bellyColor;
    }

    public void setBellyColor(String bellyColor) {
        this.bellyColor = bellyColor;
    }

    public String getPatternColor() {
        return patternColor;
    }

    public void setPatternColor(String patternColor) {
        this.patternColor = patternColor;
    }

    public Map<String, Integer> getBasicQualitys() {
        return basicQualitys;
    }

    public void setBasicQualitys(Map<String, Integer> basicQualitys) {
        this.basicQualitys = basicQualitys;
    }
}
