function validateForm(){
    var input = document.getElementsByTagName("input");
    var password = input[2].value;
    var confirmPassword = input[3].value;
    var errorMessage = "";
    var textNode = "";

    for (var x = 0; x < input.length -1; x++){
        var nameOfField = input[x].getAttribute("name");
        
        if (nameOfField == "confirm"){ //check name of the field
            if (confirmPassword != password){
                errorMessage = "Passwords don't match";
                input[x].setAttribute("style", "background-color: red");
                setErrorMessage(errorMessage);
                return false;
            }
        }
        if (input[x].value == ""){ //check if field is empty
            input[x].setAttribute("style", "background-color: red");
            errorMessage = "Please enter your ".concat(nameOfField);
            if (nameOfField == "confirm"){
                errorMessage = "Please confirm your password";
            }
            setErrorMessage(errorMessage);
            return false;
        }
        else{
            input[x].removeAttribute("style");
        }
    }
}

function setErrorMessage(errorMessage){ //set up error messages
    var textNode = "";
    var form = document.getElementsByTagName("form");
    form = form[0];
    textNode=document.createTextNode(errorMessage);
    var displayError = document.createElement("div");
    displayError.appendChild(textNode);
    if (form.firstChild.nodeType == 1){
        form.replaceChild(displayError, form.firstChild);
    }
    else{
        form.insertBefore(displayError, form.firstChild);
    }
}