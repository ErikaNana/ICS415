$(document.getElementById('body')).ready(function() {
	var url;
	$("#stage").hide();
 	$("#one").click(function(){
	 	url = $("input[name=urlField]").val();
		//clear display
		$("#display").empty();
		$("#display").append("<br>|    Tag     |    Count    |");
		$('#stage').load(url, function (){
	
	    var all = $(this).find("*");
	    //find each tag and number of times it occurs
	    for (i = 0; i < all.length; i++) {
	    	var tag = all.get(i).tagName.toLowerCase();
	    	var tagChildren = $(this).find(tag).length;
	        var full = "| " + tag + " | " + tagChildren;
	        		 
	        var truth = $("#display:contains('" + full + "')").length;
	        if (truth == 0){
	        	$("#display").append("<br>" + full); 
	        }
	    }
		});
    });
    $("#two").click(function(){
    	//clear display
    	$("#display").empty();
    	$("#display").append("Scripts:  ");
    	url = $("input[name=urlField]").val();
    	
        $('#stage').load(url, function (){
        	var scripts = $(this).find("script[type='text/javascript']");
        	for (i = 0; i < scripts.length; i++){
        		var script = scripts.get(i).getAttribute("src");
        		$("#display").append("<br>" + script);
        	 }        	 
        });
    });
});