if (document.URL.match( /sign_up/ )) {
  window.addEventListener('load',function(){
    const nickName = document.getElementById("registration-nickname");
    const eMail = document.getElementById("registration-email");
    const passWord = document.getElementById("registration-password");
    const passWordConfirmation = document.getElementById("registration-password-confirmation");

    nickName.addEventListener("blur", e => { 
      const nickNameError = document.getElementById("nickname-error")
      if (nickName.value != ""){
        nickNameError.setAttribute("hidden", true)
      } else {
        nickNameError.removeAttribute("hidden")
      }
    })

    eMail.addEventListener("blur", e => { 
      const eMailError = document.getElementById("email-error")
      const eMailValidate = /^[a-z]+@[a-z]$/;
      if (eMailValidate.test(eMail.value)){
        eMailError.setAttribute("hidden", true)
      } else {
        eMailError.removeAttribute("hidden")
      }
    })

    passWord.addEventListener("blur", e => { 
      const passWordError = document.getElementById("password-error")
      const passWordValidate = /^(?=.*[a-z])(?=.*[0-9])[0-9a-z]{6,}$/;
      if (passWordValidate.test(passWord.value)){
        passWordError.setAttribute("hidden", true)
      } else {
        passWordError.removeAttribute("hidden")
      }
    })

    passWordConfirmation.addEventListener("blur", e => { 
      const passWordConfirmationError = document.getElementById("password-confirmation-error")
      if (passWord.value == passWordConfirmation.value){
        passWordConfirmationError.setAttribute("hidden", true)
      } else {
        passWordConfirmationError.removeAttribute("hidden")
      }
    })

  });
}