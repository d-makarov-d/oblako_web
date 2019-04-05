// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require icheck
//= require select2
//= reuire_ujs
//= require activestorage
//= require_tree .

$(document).on("click", "#submit_link", function(){
    event.preventDefault();
   $("#form_id").submit();
});

$(document).on("click", "#cancell_link", function(){
    event.preventDefault();
   $(".glob").hide();
});

$(document).ready(function() {
    $(".glob").hide();
    $("#new_btn").click(function(){
        event.preventDefault();
        $(".glob").show();
    });
    $('select#project_id').select2({
        minimumResultsForSearch: -1
    });
});

function icheck(){
  if($(".icheck-me").length > 0){
    $(".icheck-me").each(function(){
      var $el = $(this);
      var skin = ($el.attr('data-skin') !== undefined) ? "_" + $el.attr('data-skin') : "",
      color = ($el.attr('data-color') !== undefined) ? "-" + $el.attr('data-color') : "";
      var opt = {
        checkboxClass: 'icheckbox' + skin + color,
        radioClass: 'iradio' + skin + color,
      }
      $el.iCheck(opt);
      var li_id = ($el.attr('li_id') !== undefined) ? $el.attr('li_id') : "";
      $("#todo" + li_id).on('click', function(){
          $("#todo" + li_id).submit();
      })
      $el.on('ifChecked', function(event){
          $("#" + li_id).css({
              "text-decoration": "line-through"
          })
          $("#todo" + li_id).submit();
      });
      $el.on('ifUnchecked', function(event){
          $("#" + li_id).css({
              "text-decoration": "none"
          })
          $("#todo" + li_id).submit();
      });
    });
  }
}

$(function(){
  icheck();
})
