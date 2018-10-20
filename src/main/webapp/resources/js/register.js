function register() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirm-password").value;
    var email = document.getElementById("email").value;
    var realUsername = document.getElementById("real-username").value;
    var phone = document.getElementById("phone").value;
    if (checkUsername(username) && checkPassword(password) && checkConfirmPassword(password, confirmPassword)
    && checkEmail(email) && checkRealUsername(realUsername) && checkPhone(phone)) {
        alert("注册成功！");
        return true;
    }
    return false;
}

function checkUsername(username){
    if (username === "") {
        alert("用户名不能为空");
        return false;
    }
    var length = username.length;
    if (length < 6 || length > 16) {
        alert("用户名应为6——16个字符！");
        return false;
    }
    return true;
}

function checkPassword(password) {
    if (password === "") {
        alert("密码不能为空");
        return false;
    }
    var length = password.length;
    if (length < 1) {
        alert("密码长度至少为1位！");
        return false;
    }
    return true;
}

function checkConfirmPassword(password, confirmPassword) {
    if (confirmPassword === "") {
        alert("确认密码不能为空");
        return false;
    }
    if (confirmPassword !== password) {
        alert("确认密码不一致");
        return false;
    }
    return true;
}

function checkEmail(email) {
    if (email === "") {
        alert("邮箱地址不能为空！");
        return false;
    }
    // 正则表达式
    var reg = /^\w+((.\w+)|(-\w+))@[A-Za-z0-9]+((.|-)[A-Za-z0-9]+).[A-Za-z0-9]+$/;
    if (!reg.test(email)) {
        alert("邮箱地址格式错误！");
        return false;
    }
    return true;
}

function checkRealUsername(realUsername) {
    if (realUsername === "") {
        alert("真实姓名不能为空！");
        return false;
    }
    var count = 0;
    for (var i = 0; i < realUsername.length; i ++){
        if (realUsername.charCodeAt(i) > 127 || realUsername.charCodeAt(i) === 94) {
            count++;
        } else {
            alert("真实姓名必须为3——8个中文字符！");
            return false;
        }
    }
    if (count < 3 || count > 8) {
        alert("真实姓名必须为3——8个中文字符！");
        return false;
    }
    return true;
}

function checkPhone(phone) {
    if (phone === "") {
        alert("联系电话不能为空！");
        return false;
    }
    if (phone.length > 15) {
        alert("联系电话不能超过15位");
        return false;
    }
    return true;
}