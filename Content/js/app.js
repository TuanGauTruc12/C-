const handleAnswer = function handleAnswer(questionNumber) {
    const answers = document.querySelectorAll(".answer");
    var array = [];
    for (let answer of answers) {
        array.push(answer.value);
    }
    $.post("/Video/Answer", {
        data: array, questionNumber: questionNumber
    }, function (data) {
        let result = JSON.parse(data);
        for (let i = 0; i < answers.length; i++)
        {
            if (answers[i].classList.contains("border"))
            {
                answers[i].classList.remove("border");
            }
            if (answers[i].classList.contains("border-success")) {
                answers[i].classList.remove("border-success");
            }
            if (answers[i].classList.contains("border")) {
                answers[i].classList.remove("border-4");
            }
            if (answers[i].classList.contains("border-danger")) {
                answers[i].classList.remove("border-danger");
            }
            if (result[i].Message == true) {
                answers[i].classList.add("border", "border-success", "border-4");
            }
            else {
                answers[i].classList.add("border", "border-danger","border-4");

            }
        }
    });
}

const closeModal = (e) => { 
    e.classList.remove("open");
}

const openModel = (e) => {
    e.classList.add("open");
/*
    modalContainer[index].addEventListener("click", (event) => {
        event.stopPropagation();
    });
*/

}

const removeClass = (idPrev) => {
    for (let i = 0; i < idPrev.length; i++) {
        const elementPrev = document.getElementById(`${idPrev[i]}`);
        const elementPrevParent = elementPrev.parentNode;
        const elementTempPrev = elementPrevParent.childNodes;
        if (
            elementTempPrev[elementTempPrev.length - 1].nodeName.toLowerCase() ===
            "span"
        ) {
            elementTempPrev[1].removeAttribute("style");
            elementPrevParent.removeChild(
                elementTempPrev[elementTempPrev.length - 1]
            );
        }
    }
};


const renderError = (idPrev, idInput, errorMessage) => {
    if (idPrev === undefined) {
        const element = document.getElementById(`${idInput}`);
        element.style.border = "1px solid red";
        element.scrollIntoView({ behavior: "smooth" });
        const parent = element.parentNode;
        const span = document.createElement("span");
        span.className = "text-3xl text-red-500 mt-2";
        span.innerHTML = errorMessage;

        const elementTemp = parent.childNodes;
        if (
            elementTemp[elementTemp.length - 1].nodeName.toLowerCase() === "span"
        ) {
            element.parentNode.removeChild(elementTemp[elementTemp.length - 1]);
        }
        parent.appendChild(span);
        return;
    }

    if (idPrev.length === 0) {
        const arr = ["name", "emailRegister", "passwordRegister", "repassword", 'phoneNumber'];
        removeClass(arr);
        return;
    }

    const element = document.getElementById(`${idInput}`);
    element.style.border = "1px solid red";
    element.scrollIntoView({ behavior: "smooth" });
    const parent = element.parentNode;
    const span = document.createElement("span");
    span.className = "text-3xl text-red-500 mt-2";
    span.innerHTML = errorMessage;

    const elementTemp = parent.childNodes;
    if (elementTemp[elementTemp.length - 1].nodeName.toLowerCase() === "span") {
        element.parentNode.removeChild(elementTemp[elementTemp.length - 1]);
    }
    if (idPrev) {
        removeClass(idPrev);
    }
    parent.appendChild(span);
};

const registerElement = document.getElementById('register');
const loginElement = document.getElementById('login');

var login = function () {

    if (loginElement.classList.contains('d-none') || registerElement.classList.contains('d-none')) {
        loginElement.classList.remove('d-none');
        registerElement.classList.remove('d-none');
    }
    registerElement.classList.add('d-none');
    loginElement.classList.add('d-flex');
}

var register = function() {

    if (registerElement.classList.contains('d-none') || loginElement.classList.contains('d-none') ){
        registerElement.classList.remove('d-none');
        loginElement.classList.remove('d-none');
    }
    loginElement.classList.add('d-none');
    registerElement.classList.add('d-flex');
}

const checkIsEmail = (email) => {
    return String(email)
        .toLowerCase()
        .match(
            /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
        );
};

var handleRegister = function() {
    //  formData;
    const name = document.getElementById('name');
    const emailRegister = document.getElementById('emailRegister');
    const passwordRegister = document.getElementById('passwordRegister');
    const repassword = document.getElementById('repassword');
    const phoneNumber = document.getElementById('phoneNumber');

    if (name.value.length === 0) {
        renderError(undefined, "name", "Tên không được bỏ trống");
    }else if (!checkIsEmail(emailRegister.value)) {
        renderError(["name"], "emailRegister", "Không phải email!");
    } else if (passwordRegister.value.length < 8) {
        renderError(["name", 'emailRegister'], "passwordRegister", "Mật khẩu phải đủ 8 ký tự trở lên");
    } else if (passwordRegister.value != repassword.value) {
        renderError(['name', "emailRegister", "passwordRegister"], "repassword", "Mật khẩu không trùng khớp");
    } else if (phoneNumber.value.length !== 10) {
        console.log(123);
        renderError(["name", "emailRegister", "passwordRegister", "repassword"], "phoneNumber", "Số điện thoại không đúng");
    } else {
        //api
        renderError([]);
        $.post("/Account/Login", {
            name: name, emailRegister: emailRegister, passwordRegister: passwordRegister, phoneNumber: phoneNumber
        }, function (data) {

        });
    }
}