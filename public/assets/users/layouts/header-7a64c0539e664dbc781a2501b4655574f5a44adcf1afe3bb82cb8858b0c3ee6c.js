function search(e){if(e.length>0){var t="/search.json?query="+e;$.get(t,function(e,t){"success"===t&&$("#autocomplete").html($(e.html_data))})}else $("#autocomplete").html("")}$(".search-toggle").click(function(){$(this).hasClass("active")?($(this).removeClass("active"),$(".search-form").removeClass("open"),setTimeout(function(){$(".navbar-nav").removeClass("hide")},300)):($(this).addClass("active"),$(".search-form").addClass("open"),$(".navbar-right").addClass("hide"))});var timer;$("#search").keyup(function(){$("#autocomplete").html($("#searching").html()),clearTimeout(timer);var e=this.value;timer=setTimeout(function(){search(e)},500)}),$(document).ready(function(){$(".announcement-icon").on("click",function(){$(".announcements").toggleClass("hide")})});