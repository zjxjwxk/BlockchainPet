function examSubmit() {
    for (var i = 1; i <= 8; i++){
        // 获得第i个问题的选项
        var valueArr = document.getElementsByName("answer" + i);
        // 判断该问题选项是否为空
        if (valueArr[0].type === 'radio'){
            if (!checkRadioOrCheckbox(valueArr)){
                alert("问题" + i + "不能为空!");
                return false;
            }
        } else if (valueArr[0].type === 'checkbox'){
            if (!checkRadioOrCheckbox(valueArr)){
                alert("问题" + i + "不能为空!");
                return false;
            }
        } else if (valueArr[0].type === 'text'){
            if (!checkText(valueArr)){
                alert("问题" + i + "不能为空!");
                return false;
            }
        } 
    }
    return true;
}

// 检查不同类型选项是否为空，若为空返回false
function checkRadioOrCheckbox(valueArr) {
    for (var i = 0; i < valueArr.length; i++){
        if (valueArr[i].checked){
            return true;
        }
    }
    return false;
}

function checkText(valueArr) {
    for (var i = 0; i < valueArr.length; i++){
        if (valueArr[i].value === "") {
            return false;
        }
    }
    return true;
}