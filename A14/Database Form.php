<html>
<body>
 	<?php
 		$table = NULL;
 		$mysqli = new mysqli("localhost", "erika", "tangent11", "db");

 		if ($mysqli -> connect_errno){
 			echo "Failed to connect to MySQL: ("
 				.$mysqli->connect_errno.")".$mysqli->connect_error;
 		}
 		else{ //Successful connection
  			$table = "CREATE TABLE Comments (
			 		 PID INT NOT NULL AUTO_INCREMENT,
			 		 PRIMARY KEY(PID),
			 		 Comment TEXT)";

			//check if the table was already created
	 		if (mysqli_query($mysqli,$table)) {
			  echo "Table of comments created successfully";
			}
			else{ //The table exists
				//check if the form is submitted by checking the post variables
				if(isset($_POST["submit"])){
					$sql="INSERT INTO Comments (Comment) VALUES ('$_POST[comment]')";
					if (!mysqli_query($mysqli,$sql)){
						echo('Error: ' . mysqli_error($mysqli));
					}
				}

				//read comments from the table and display them
				echo"List of Comments In Database: <br>";
				$allComments = mysqli_query($mysqli, "SELECT * FROM Comments");
				while ($row = mysqli_fetch_array($allComments)){
					echo $row['Comment']."<br>";
				} 
			}
		}
	?> 
 	<form name= "exampleform" action= "" method="post">
		<p>Add A Comment: <input type= "text" name="comment"></p>
		<input type = "submit" value = "click" name = "submit">
	</form> 
	<?php

	?>
</body>
</html>