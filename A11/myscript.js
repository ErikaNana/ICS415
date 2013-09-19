$(document).ready(function() {
	//hide teh answers first
	$("b+div").hide();
	$("div").click(function(){
	    //check if the answer is hidden
	    if ($(this).children("div").is(":visible")){
	        //hide the answer
	        $(this).find("span").text("+");
	        $(this).children("div").hide();
	    }
	    else{
	        $(this).find("span").html("-");
	        $(this).children("div").show();
	    }

	});
});