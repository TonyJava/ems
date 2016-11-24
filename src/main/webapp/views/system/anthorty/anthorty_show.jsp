<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>    
<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<title>员工管理</title>
    <jsp:include page="${pageContext.request.contextPath}/views/common/script.jsp"/>
    <script>
        function deleteById(id){
            $.get(
                    "anthorty/delete.do",
                    "anthortyId="+id,
                    function (data) {
                        alert(data.message);
                        if(data.state){
                            parent.loadTree(data.list);
                        }
                    },
                    "json"
            );
        };
    </script>
</head>
<body>
<form action="" class="form-horizontal">
 	<div class="row">
    	<div class="col-xs-9 ">
    	    <a  href="anthorty/loadAdd.do?anthortyId=${anth.anthortyId }" class="btn btn-success" >添加权限信息</a>
        <c:if test="${anth != null && anth.anthortyId != 1}">
            <a  href="anthorty/loadUpdate.do?anthortyId=${anth.anthortyId }" class="btn btn-info"  >修改权限信息 </a>
            <a  href="javascript:void (0)" onclick="deleteById(${anth.anthortyId })" class="btn btn-danger" >删除权限信息</a>
        </c:if>
        </div>
    </div>
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">基本信息</h5>
	<div class="row">
    	<div class="col-xs-5">
        	<div class="form-group">
            	<label class="col-xs-3 control-label">权限编号</label>
                <div class="col-xs-9">
                	<p class="form-control-static">${anth.anthortyId }</p>
                </div>
            </div>
        
        </div>
        <div class="col-xs-5">
            <div class="form-group">
            	<label class="col-xs-3 control-label">权限名称</label>
                <div class="col-xs-9">
                		<p class="form-control-static">${anth.anthortyName }</p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
    	<div class="col-xs-5">
        	<div class="form-group">
            	<label class="col-xs-3 control-label">上级权限</label>
                <div class="col-xs-9">
                	<p class="form-control-static">${panthortyName }</p>
                </div>
            </div>
        
        </div>
        <div class="col-xs-5">
            <div class="form-group">
            	<label class="col-xs-3 control-label">权限URL</label>
                <div class="col-xs-9">
                	<p class="form-control-static">${anth.anthortyUrl }</p>
                </div>
            </div>
        </div>
    </div>
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">备注信息</h5>
    	<div class="row">
    	<div class="col-xs-4">
        	<div class="form-group">
            	<label class="col-xs-3 control-label">备注</label>
                <div class="col-xs-9">
                	<p class="form-control-static">${anth.anthortyDesc }</p>
                </div>
            </div>
        
        </div>

    </div>


</form>

</body>
</html>