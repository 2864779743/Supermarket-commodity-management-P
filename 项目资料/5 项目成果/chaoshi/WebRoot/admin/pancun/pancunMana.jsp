<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		<script type="text/javascript" src="<%=path %>/js/public.js"></script>
		<script type="text/javascript" src="<%=path %>/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
        <script language="javascript">
           function pancunDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/pancun?type=pancunDel&id="+id;
               }
           }
           function pancunAdd()
           {
                 var url="<%=path %>/admin/pancun/pancunAdd.jsp";
                 //var n="";
                 //var w="480px";
                 //var h="500px";
                 //var s="resizable:no;help:no;status:no;scroll:yes";
				 //openWin(url,n,w,h,s);
				 window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="11" background="<%=path %>/images/tbg.gif">&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="10%">商品名称</td>
					<td width="10%">盘存时间</td>
					<td width="15%">实际数量</td>
					<td width="15%">系统数量</td>
					<td width="15%">盘盈（盘亏）</td>
					<td width="15%">备注</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.pancunList}" var="pancun">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${pancun.goods_name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   ${pancun.shijian}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${pancun.shijishuliang}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   ${pancun.xitongshuliang}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${pancun.type1}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${pancun.beizhu}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<form action="" name="formAdd" method="post">
						   <input type="button" value="删除" onclick="pancunDel(${pancun.id})"/>
						</form>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="pancunAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
