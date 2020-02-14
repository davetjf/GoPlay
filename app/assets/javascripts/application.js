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
//= require rails-ujs
//= require turbolinks
//= require_tree .
$(document).ready(function(){ 


$(function(){
	$("#gamesButton").hover(function(){
    $('#gb1').fadeIn(100);
    },function(){
    $('#gb1').fadeOut(300);
    });        
});
$(function(){
	$("#gamesButton").hover(function(){
    $('#gb2').fadeIn(200);
    },function(){
    $('#gb2').fadeOut(200);
    });        
});
$(function(){
	$("#gamesButton").hover(function(){
    $('#gb3').fadeIn(300);
    },function(){
    $('#gb3').fadeOut(100);
    });        
});


$(function(){
	$("#informationButton").hover(function(){
    $('#ib1').fadeIn(100);
    },function(){
    $('#ib1').fadeOut(300);
    });        
});
$(function(){
	$("#informationButton").hover(function(){
    $('#ib2').fadeIn(200);
    },function(){
    $('#ib2').fadeOut(200);
    });        
});
$(function(){
	$("#informationButton").hover(function(){
    $('#ib3').fadeIn(300);
    },function(){
    $('#ib3').fadeOut(100);
    });        
});

$(function(){
	$("#loginButton").hover(function(){
    $('#lb1').fadeIn(100);
    },function(){
    $('#lb1').fadeOut(300);
    });        
});
$(function(){
	$("#loginButton").hover(function(){
    $('#lb2').fadeIn(200);
    },function(){
    $('#lb2').fadeOut(200);
    });        
});
$(function(){
	$("#loginButton").hover(function(){
    $('#lb3').fadeIn(300);
    },function(){
    $('#lb3').fadeOut(100);
    });        
});

$(function(){
	$("#registerButton").hover(function(){
    $('#rb1').fadeIn(100);
    },function(){
    $('#rb1').fadeOut(300);
    });        
});
$(function(){
	$("#registerButton").hover(function(){
    $('#rb2').fadeIn(200);
    },function(){
    $('#rb2').fadeOut(200);
    });        
});
$(function(){
	$("#registerButton").hover(function(){
    $('#rb3').fadeIn(300);
    },function(){
    $('#rb3').fadeOut(100);
    });        
});





});