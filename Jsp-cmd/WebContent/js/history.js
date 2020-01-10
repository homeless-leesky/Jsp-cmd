
const inputCmdForm = document.querySelector(".js-inputCmdForm");
const cmdInput = inputCmdForm.querySelector(".js-inputCmd");
const orderList = document.querySelector(".js-ol");


const history_LS = `history`;
let history= [];



function loadHistory(){
    const loadedHistory = localStorage.getItem(history_LS);
    if (loadedHistory !== null){
        const parsedHistory  = JSON.parse(loadedHistory);
        parsedHistory.forEach(function(temp){
            printHistory(temp.text);
        });
    }
}

function saveHistory(){
    localStorage.setItem(history_LS, JSON.stringify(history));
}

function printHistory(text){
    const li = document.createElement("li");
    const span = document.createElement("span");
    span.innerText = `${text}`;

    li.appendChild(span);
    orderList.appendChild(li);

    const history_obj ={
        text : text,
    }
    
    history.push(history_obj);
    saveHistory();
}


function handleCmdSubmit(event){
    const currentValue = cmdInput.value;
    console.log(currentValue);
    printHistory(currentValue);
}


function init(){
    loadHistory();
    inputCmdForm.addEventListener("submit", handleCmdSubmit);
}

init();
