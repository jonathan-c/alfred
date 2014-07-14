// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function(){

  var MaxInputs       = 8; //maximum input boxes allowed
  var InputsWrapper   = $(".ingredientField"); //Input boxes wrapper ID
  var AddButton       = $(".addNewIngredient"); //Add button ID

  var x = InputsWrapper.length; //initlal text box count
  var FieldCount=1; //to keep track of text box added

  $(AddButton).click(function (e)  //on add input button click
  {
    if(x <= MaxInputs) //max input box allowed
    {
        FieldCount++; //text box added increment
        //add input box
        $(InputsWrapper).append('<div class="ingredientsForm"><label for="ingredients">Ingredients</label><input class="select_ingredient"><input class="link_ingredient_id" name="link[ingredient_id]" type="hidden"><label for="servings">Servings</label><input id="servings_" name="servings[]" type="text"></div>');

        x++; //text box increment
    }
  return false;
  });

  $("body").on("click",".removeIngredient", function(e){ //user click on remove text
    if( x > 1 ) {
            e.preventDefault();
            $(".ingredientField").children("div[class=ingredientsForm]:last").remove();
            x--; //decrement textbox
    }
  return false;
})

});
