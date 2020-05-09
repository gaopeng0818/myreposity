<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>校园宿舍管理系统</title>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="Style/Style.css" rel="stylesheet" type="text/css" />
</head>
<script language="JavaScript">


function mycheck(){
   
   if(isNull(form1.Building_ID.value)){
   alert("请选择楼宇！");
   return false;
   }
   if(isNull(form1.Domitory_ID.value)){
   alert("请选择寝室！");
   return false;
   }

}

function isNull(str){
if ( str == "" ) return true;
var regu = "^[ ]+$";
var re = new RegExp(regu);
return re.test(str);
}
   
   
</script>
<body>
<center>
  <table width="900" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="60" bgcolor="#E6F5FF" style="color:#06F; font-size:19px; font-weight:bolder; padding-left:50px;">校园宿舍管理系统</td>
    </tr>
    <tr>
      <td height="30" background="Images/MenuBg.jpg">&nbsp;</td>
    </tr>
    <tr>
      <td height="500" align="center" valign="top"><table width="900" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="191" height="500" align="center" valign="top" background="Images/leftbg.jpg">
          <%@ include file="Left.jsp"%>
          </td>
          <td width="709" align="center" valign="top" bgcolor="#F6F9FE"><table width="709" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" background="Images/mainMenuBg.jpg" style="padding-left:25px;">学生寝室调换</td>
            </tr>
            <tr>
              <td height="470" align="center" valign="top" bgcolor="#F6F9FE">
              <form name="form1" method="post" action="StudentTHSave.action" onSubmit="return mycheck()" >
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="30" align="right">学生学号：</td>
                    <td><s:property value='cnbean.Student_Username'/></td>
                  </tr>
                  <tr>
                    <td height="30" align="right">学生姓名：</td>
                    <td><s:property value='cnbean.Student_Name'/></td>
                  </tr>
                  <tr>
                    <td height="30" align="right">学生性别：</td>
                    <td><s:property value='cnbean.Student_Sex'/></td>
                  </tr>
                  <tr>
                    <td height="30" align="right">目前楼宇：</td>
                    <td><s:property value='cnbean.Building_Name'/></td>
                  </tr>
                  <tr>
                    <td width="33%" height="30" align="right">目前寝室：</td>
                    <td width="67%"><s:property value='cnbean.Domitory_Number'/></td>
                  </tr>
                  <tr>
                    <td height="30" align="right"><span style="color:red;">*</span>调换到楼宇：</td>
                    <td>
                      <select name="Building_ID" id="Building_ID" onChange="javascript:window.location='StudentTH.action?Student_Username=<s:property value='cnbean.Student_Username'/>&BuildingID='+this.value;">
                      <option value="">请选择</option>
                      <s:iterator value="buildinglist">
                      <option value="${Building_ID}" <s:if test="BuildingID==Building_ID">selected</s:if>>${Building_Name}</option>
                      </s:iterator>
                      </select>
                    </td>
                  </tr>
                  <tr>
                    <td height="30" align="right"><span style="color:red;">*</span>调换到寝室：</td>
                    <td>
                      <%--<select name="Domitory_ID" id="Domitory_ID" onChange="javascript:window.location='StudentTH.action?Student_Username=<s:property value='cnbean.Student_Username'/>">--%>
                      <%--<option value="">请选择</option>--%>
                      <%--<s:iterator value="domitorylist">--%>
                        <%--<option value="${Domitory_ID}"  <s:if test="BuildingID==Building_ID">selected</s:if>>${Domitory_Name}</option>--%>
                      <%--</s:iterator>--%>
                    <%--</select>--%>
                        <select name="Domitory_ID" id="Domitory_ID">
                          <option value="">请选择</option>
                          <s:iterator value="domitorylist1">
                            <option value="${Domitory_ID}">${Domitory_Number}</option>
                          </s:iterator>
                        </select>
                    </td>
                  </tr>
                  <tr>
                    <td height="30"><input name="Student_ID" type="text" class="noshow" id="Student_ID" value="<s:property value='cnbean.Student_ID'/>"></td>
                    <td><input type="submit" name="button" id="button" value="确定调换">
                      &nbsp;&nbsp;
                      <input type="button" name="button2" id="button2" value="返回上页" onClick="javascript:history.back(-1);"></td>
                  </tr>
                </table>
              </form></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td height="35" background="Images/bootBg.jpg">&nbsp;</td>
    </tr>
  </table>

</center>
</body>
</html>
