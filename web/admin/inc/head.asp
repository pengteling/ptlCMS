<!--#include virtual="/inc/inc.asp" -->
<!--#include virtual="/admin/admin.asp" -->
<!--#include virtual="/admin/inc/privilege.asp" -->
<%
if groupid=2 then
	'sql_sonid_page = "0"
	sql_sonid_page=""
else
	rs.open "select sonid_page from zh_adminGroup where id="&groupid
	if not rs.eof then
		my_sonid_page =rs(0)
		if my_sonid_page="" then my_sonid_page="0"
		sql_sonid_page=" and cateid in ("&my_sonid_page&")"
	end if
	rs.close
end if
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>后台管理 - <%=sitetitle%></title>

    <!-- Bootstrap Core CSS -->
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- Custom CSS -->
    <link href="../dist/css/admin.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<iframe src="/admin/keepsession.asp" frameborder="0" width="0" height="0"></iframe>