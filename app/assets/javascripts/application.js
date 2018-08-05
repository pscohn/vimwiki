// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// require turbolinks
//= require_tree .
//

document.addEventListener("DOMContentLoaded", function() {
  var contentDiv = document.getElementById('content');
  if (contentDiv) {
    var content = contentDiv.innerHTML;
    var exp_match = /\[\[(.+?)\]\]/ig;
    var element_content=content.replace(exp_match, "<a href=\"/pages/$1\">$1</a>");
    contentDiv.innerHTML = element_content;
  }
});
