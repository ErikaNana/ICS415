<html>
<body>
 	<?php
 		$size = 0;
		// Open the file
		$fp = fopen("comments.txt", 'r'); 

		if ($fp) {
		   //split the file into strings
		   $array = explode("\n", fread($fp, filesize("comments.txt")));
		   $size = filesize("comments.txt");
		   //display each line in the array
		   	foreach ($array as $value) {
	    		echo "$value<br>\n";
			}
		}

		//check if the form is submitted by checking the post variables
		if(isset($_POST["submit"])){
		   	$comment = $_POST["comment"];
			$comment = "\n".$comment;
			//add the comment to the file
			file_put_contents("comments.txt", $comment, FILE_APPEND);
			//clear the previous echoes
			ob_end_clean();
			$lines = file("comments.txt");
			foreach($lines as $value){
				echo $value;
				echo "<br>";
			}
		} 
	?> 
	<form name= "exampleform" action= "" method="post">
		<p>Add A Comment: <input type= "text" name="comment"></p>
		<input type = "submit" value = "click" name = "submit">
	</form> 
</body>
</html>