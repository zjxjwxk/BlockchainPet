function login() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    if (username === "") {
        alert("用户名不能为空!");
        return false;
    }
    if (password === "") {
        alert("密码不能为空!");
        return false;
    }
    return true;
}