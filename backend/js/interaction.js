

const result = document.querySelector(".result");


// Add a click event listener to the body element
document.body.addEventListener('click', function (event) {
  var select = document.getElementById("ristorante");
  var ristoranteID = select.options[select.selectedIndex].value;
  var select = document.getElementById("owner");
  var owner = select.options[select.selectedIndex].value;

  // Check if the clicked element is a .homepost element
  let button = event.target;
  
  // Check if the clicked element is a li element
  if (button) {
    let buttonID = button.id;
    console.log("pressed: "+buttonID);
    if(buttonID){

      axios.post('./api.php', {
        query: buttonID,
        ristoranteID:ristoranteID,
        owner:owner,
      },  {
        headers: {
          'Content-Type': 'application/json'
        },
        responseType: 'json',
        timeout: 5000
      }).then(response => {
        console.log( response);
        result.innerHTML=response.data;
      });
    }
  }

});






