<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<title>短信管理</title>
	<jsp:include page="${pageContext.request.contextPath}/views/common/script.jsp"/>
<script type="text/javascript">

	function setText(obj){
		$("#messafeContent").val(obj.value);
		
	}

</script>
</head>
<body>

<div style="padding:0px; margin:0px;">
 <ul class="breadcrumb" style="  margin:0px; " >
    	<li>营销管理</li>
        <li>短信管理</li>
        <li>发送信息</li>
    </ul>
</div>

<form action="messafeinfo/send.do" method="post" class="form-horizontal">

    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">基本信息</h5>
	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">模板</label>
                <div class="col-sm-9">
                	<select name="" onchange="setText(this)" class="form-control input-sm">
                		<option value="">请选择</option>
                		<c:forEach items="${templist }" var="temp">
                    	<option value="${temp.templateContent }">${temp.templateTitle }</option>
               		    </c:forEach>
                    </select>
                </div>
            </div>
        
        </div>
    </div>
    
    	<div class="row">
                <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">接收人</label>
                <div class="col-sm-9">
                	<input type="text" name="messafeMan" class="form-control input-sm" placeholder="请输入接收人"/>
                </div>
            </div>
        </div>
        
        </div>
    
    	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">电话号码</label>
                <div class="col-sm-9">
                	<input type="text" name="messafePhone" class="form-control input-sm"  placeholder="请输入电话号码"/>
                </div>
            </div>
        
        </div>


    </div>
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">短信内容信息</h5>
    	<div class="row">
    	<div class="col-sm-10">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">短信内容</label>
                <div class="col-sm-9">
                	<textarea id="messafeContent" name="messafeContent" class="form-control"></textarea>
                </div>
            </div>
        
        </div>

    </div>
 
   	<div class="row">
    	<div class="col-sm-3 col-sm-offset-4">
        	<input  type="submit" class="btn btn-success" value="发送"/>

              <a class="btn btn-warning" href="/messafeinfo/list.do">返回上一级</a>
        </div>
    </div>
</form>
</body>
</html>