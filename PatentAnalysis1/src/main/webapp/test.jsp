<%@ page language="java" pageEncoding="UTF-8"%> 

<!DOCTYPE html>
<html>
<head lang="en">
	<meta charset="UTF-8">
	<title>test</title>
	<meta name="viewport" content="width=device-width,initial-scale=1">
</head>
<body>
	<form action="patent/queryApplyData" method="post">
		<input type="text" name="year" >
		<input type="text" name="company">
		<input type="submit" value="test">
	</form>
	<form action="company/companyList" method="post">
		<input type="submit" value="testcompany">
	</form>
	
</body>
</html>