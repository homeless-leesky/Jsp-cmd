const USER_LS ="UserId"; //current uesr local storage var
const SHOWING_CN = "show";
const getUserIdContainer = document.querySelector(".js-getUserIdContainer");
const getUserIdForm = getUserIdContainer.querySelector(".js-getUserIdForm");
const input = getUserIdForm.querySelector("input");
const shellContainer = document.querySelector(".js-shellContain");
const setUserSpan = shellContainer.querySelector(".js-setUserIdSpan");



function setUserId(text){
    getUserIdContainer.classList.remove(SHOWING_CN);
    shellContainer.classList.add(SHOWING_CN);
    setUserSpan.innerText = `${text} `;
}

function saveUserId(text){
    localStorage.setItem(USER_LS, text);
}

function handleSubmit(event){
    event.preventDefault();
    const currentValue = input.value;
    setUserId(currentValue);
    saveUserId(currentValue);
}

function askForUserId(){
    getUserIdContainer.classList.add(SHOWING_CN);
    getUserIdForm.addEventListener("submit", handleSubmit);
}

function loadUserId(){
    const currentUser = localStorage.getItem(USER_LS);
    if(currentUser === null){
        askForUserId();
    }
    else{
        setUserId(currentUser);      
    }
}

function init(){
    loadUserId();
}
init();