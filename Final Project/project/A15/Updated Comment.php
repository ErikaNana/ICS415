<html>
<body>
 	<?php
 		//function that gets all of comments of the given user
 		//also echoes the comment if specified in $justCount
 		function getComments($connection,$user,$justCount){
 			$counter = 0;
			$getUserComments = mysqli_query($connection, "SELECT * FROM UpdatedComments WHERE User = '$user'");
			while ($row = mysqli_fetch_array($getUserComments)){
				if ($justCount == 0){
					echo $row['Comment']."<br>";			
				}
				$counter +=1;
			}
			return $counter;
 		}
 		$conn = new mysqli("localhost", "erika", "tangent11", "db");

 		if ($conn -> connect_errno){
 			echo "Failed to connect to MySQL: ("
 				.$conn->connect_errno.")".$conn->connect_error;
 		}
 		else{ //Successful connection
/* 			echo "<font color = 'red'>Successful connection! </font>";
 			echo "<br>";*/
  			$table = "CREATE TABLE UpdatedComments (
			 		 PID INT NOT NULL AUTO_INCREMENT,
			 		 PRIMARY KEY(PID),
			 		 Comment TEXT,
			 		 User    TEXT)";

			//check if the table was already created
	 		if (mysqli_query($conn,$table)) {
			  echo "Table of comments created successfully";
			}
			else{ //The table exists
				//echo "Error creating table: " . mysqli_error($mysqli);
				//check if the form is submitted by checking the post variables
				if(isset($_POST["submit"])){
					//store username in a cookie if it is not already
					$inputName = $_POST["userName"];
					echo "<b>Showing comments for ".$inputName.": </b><br>";
					$sql="INSERT INTO UpdatedComments (Comment,User) VALUES ('$_POST[comment]','$_POST[userName]')";
					if (!mysqli_query($conn,$sql)){
						echo('Error: ' . mysqli_error($conn));
					}
					//set the cookie
					setcookie("user", $inputName);
					getComments($conn,$inputName,0);
				}
			}
		}
	?>
	<br>
	 <form name= "exampleform" action= "" method="post">
		<b>Enter your username: </b><input type= "text" name="userName"><br>
		<b>Add a Comment: </b><input type= "text" name="comment">
		<input type = "submit" value = "click" name = "submit">
	</form>
	<?php
		//statistics summary
		echo "<b>Statistics summary: </b><br>";
		$users = "SELECT DISTINCT User FROM UpdatedComments";
		$getUsers = mysqli_query($conn, $users);
		//get the distinct users
		while ($user = mysqli_fetch_array($getUsers)){
			$distinctUser = $user['User'];
			echo $distinctUser.": ".getComments($conn,$distinctUser,1)." comments<br>";
		}
	?>
</body>
</html>