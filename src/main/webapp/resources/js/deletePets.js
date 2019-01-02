function deletePetFromMarket() {
    var deleteIds = document.getElementsByName("deleteId");
    var len = deleteIds.length;
    for (var i = 0; i < len; i++) {
        if (deleteIds[i].checked) {
            return true;
        }
    }
    alert("请选择要删除的狗狗！");
    return false;
}