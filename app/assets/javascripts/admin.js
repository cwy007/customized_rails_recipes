//= require jquery
//= require jquery.autosize
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require select2
//= require nested_form_fields
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN
//= require ckeditor/init
//= require jquery-ui
//= require validator.min
//= require bootstrap-filestyle.min

$(document).on('turbolinks:load', function() {
  $("textarea").autosize();
});
