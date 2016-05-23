<!--#include virtual="/admin/inc/head.asp"-->


<body>

    <div id="wrapper">
    <!--#include virtual="/admin/inc/top.asp"-->

<!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">添加信息</h1>
                    </div>
                    <!-- /.col-lg-12 -->
</div>
                     <!-- /.row -->
                <div class="row">
                  <div class="panel panel-default">
                       <!--  <div class="panel-heading">
                            Kitchen Sink
                        </div> -->
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
<!-- #include file="news_config.asp" -->
<%
dim ID,Action,sqlDel,rsDel,FoundErr,ErrMsg,ObjInstalled
ID=trim(request("ID"))
Action=Trim(Request("Action"))
cateid=strToNum(Request("cateid"))

FoundErr=False


if ID<>"" and (Action="Del" or action="move") then

else
	FoundErr=True
	ErrMsg=ErrMsg & "<br><li>请选择至少一条信息！</li><li>参数不足！</li>"
end if
if FoundErr=False then
	if instr(ID,",")>0 then
		dim idarr,i
		idArr=split(ID)
		for i = 0 to ubound(idArr)
			if Action="Del" then
				call DelNews(clng(idarr(i)))
			elseif action="move" then
				call MoveNews(clng(idarr(i)))
			end if
		next
	else
		if Action="Del" then
			call DelNews(clng(ID))
		elseif action="move" then
			call MoveNews(clng(ID))
		end if
	end if
end if
if FoundErr=False then
	call CloseConn()
	Response.Redirect Request.ServerVariables("HTTP_REFERER")
else
	call CloseConn()
	call WriteErrMsg()
end if

sub DelNews(ID)
	
	sqlDel="select * from "&news_table&" where ID=" & CLng(ID)
	Set rsDel= Server.CreateObject("ADODB.Recordset")
	rsDel.open sqlDel,conn,1,3
	
	if not rsDel.eof then
		Call p_cate(rsDel("cateid"),8) '判断删除权限
	rsDel("isdel")=1
		rsDel.update
		set rsDel=nothing		
	end if
end sub


sub MoveNews(ID)
	
	sqlDel="select * from "&news_table&" where ID=" & CLng(ID)
	Set rsDel= Server.CreateObject("ADODB.Recordset")
	rsDel.open sqlDel,conn,1,3
	
	if not rsDel.eof then
		if Clng(rsDel("cateid")) = cateid then
			wrongMsg("移出栏目和移入栏目相同了！")
			response.End()
		end if
	Call p_cate(rsDel("cateid"),32) '判断移出栏目的权限
	Call p_cate(cateid,32) '判断移入栏目的权限
	rsDel("cateid")=cateid
		rsDel.update
		set rsDel=nothing		
	end if
end sub
%>
</div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                </div>

                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->




</body>
</html>