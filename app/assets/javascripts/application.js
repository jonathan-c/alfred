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

// find out where application.js is being loaded up.

$(document).ready(function(){
$(".addNewIngredient").on('click', function(e){
  e.preventDefault();
  $(".ingredientField").append($("#new_ingredients_form").html());

  $(".select_ingredient").autocomplete({
          minLength: 2,
          source: '/ingredients',
          focus: function(event, ui) {
              $('.select_ingredient').val(ui.item.name);
              return false;
          },
          select: function(event, ui) {
            $('.select_ingredient').val(ui.item.name);
            $('.link_ingredient_id').val(ui.item.id);
            return false;
          }
      })
      .data( "ui-autocomplete" )._renderItem = function( ul, item ) {
          return $( "<li></li>" )
              .data( "ui-autocomplete-item", item )
              .append( "<a>" + item.name + "</a>" )
              .appendTo( ul );
      };
});


$(".removeIngredient").on('click', function(e){
  e.preventDefault();
$(".ingredientField #new_ingredients_form").empty();
});
});
