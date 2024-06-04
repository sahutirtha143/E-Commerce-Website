<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Image</title>

<style type="text/css">
h1 {
	color: red;
	text-align: center;
}

.conatiner {
display:flex;
width:100%;
justify-content:space-around;
	text-align: left;
	font-size: 30px;
}
</style>

</head>
<body>
<h1>ADD IMAGE</h1>
	<div class="conatiner">
		<form action="add-imgg" method="post" enctype="multipart/form-data">
		<label>P_Name: </label> <input type="text" name="name"> <br>
		<label>P_Category </label> <input type="text" name="category"> <br>
		<label>P_price </label> <input type="number" name="price"> <br>
		<label>Select Image :</label><input type="file" name="image"> <br>
			
			<input type="submit" name="" value="Add Image">
		</form>
	</div>

</body>
</html>