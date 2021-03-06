<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<title>营销活动</title>
    <jsp:include page="${pageContext.request.contextPath}/views/common/script.jsp"/>
    <script src="${pageContext.request.contextPath}/resources/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript">

	function setText(obj){
	
		$("#emailTitle").val($(obj).find("option:selected").text());
		$("#emailContent").val(obj.value);
		if(obj.value ==''){
			$("#emailTitle").val('')
		}
	}

</script>
</head>
<body>

<div style="padding:0px; margin:0px;">
 <ul class="breadcrumb" style="  margin:0px; " >
    	<li>营销管理</li>
        <li>营销活动</li>
        <li>修改活动</li>
    </ul>
</div>

<form action="marketactive/update.do" method="post" class="form-horizontal">
    <input type="hidden" name="_method" value="PUT"/>
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">基本信息</h5>
	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">编号</label>
                <div class="col-sm-9">
                	<input type="text" readonly="readonly" name="activeId" value="${market.activeId }" class="form-control input-sm" placeholder="请输入编号"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">活动名称</label>
                <div class="col-sm-9">
                	<input type="text" name="activeName" value="${market.activeName }"  class="form-control input-sm" placeholder="请输入活动名称"/>
                </div>
            </div>
        </div>
    </div>
    	<!--开始 -->
    	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">开始时间</label>
                <div class="col-sm-9">
                	<input type="text" name="activeStart" value="<fmt:formatDate value="${market.activeStart }" type="both"  pattern="yyyy-MM-dd" />"  onClick="WdatePicker()" readonly="readonly" class="form-control input-sm" placeholder="请输入开始时间"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">活动状态</label>
                <div class="col-sm-5">
                <select type="active_state" name="activeState">
                    <c:forEach items="${dataDictionaryStateList}" var="s" >

                            <c:if test="${s.dataId eq market.dataDictionary.dataId}">
                            <option value="${s.dataId}" selected="selected">${s.dataContent}</option>
                            </c:if>
                                <option value="${s.dataId}">${s.dataContent}</option>
                    </c:forEach>
                    </select>
                </div>
            </div>
        </div>
    </div>
   <!--结束 -->
       	<!--开始 -->
    	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">结束时间</label>
                <div class="col-sm-9">
                	<input type="text" name="activeEnd" value="<fmt:formatDate value="${market.activeEnd }" type="both"  pattern="yyyy-MM-dd" />" onClick="WdatePicker()" readonly="readonly" class="form-control input-sm" placeholder="请输入结束时间"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">活动类型</label>
                <div class="col-sm-5">
                	<select type="active_type"  name="activeType"  >
                        <c:forEach items="${dataDictionaryTypeList}" var="t">
                            <c:if test="${t.dataId == market.activeType}">
                                <option value="${t.dataId}" selected="selected">${t.dataContent}</option>
                            </c:if>
                            <option value="${t.dataId}">${t.dataContent}</option>
                        </c:forEach>
                        </select>
                </div>
            </div>
        </div>
    </div>
   <!--结束 -->
    <!--开始 -->
    	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">成本预算</label>
                <div class="col-sm-6">
                	<input type="text" name="activeCosteEmtimate"  value="${market.activeCosteEmtimate }" class="form-control input-sm" placeholder="请输入成本预算"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">实际成本</label>
                <div class="col-sm-6">
                	<input type="text" name="activeCoste"  value="${market.activeCoste }" class="form-control input-sm" placeholder="请输入实际成本"/>
                </div>
            </div>
        </div>
    </div>
   <!--结束 -->
   <!--开始 -->
    	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">预期反应</label>
                <div class="col-sm-6">
                	 <select type="active_refect_estimate"   name="activeRefectEstimate" selectedId="${market.activeRefectEstimate }" >
                        <s:forEach items="${dataDictionaryStudent_sate}" var="s">
                                <c:if test="${s.dataId == market.activeRefectEstimate}">
                                    <option value="${s.dataId}" selected="selected">${s.dataContent}</option>
                                </c:if>
                            <option value="${s.dataId}">${s.dataContent}</option>
                        </s:forEach>
                         </select>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">预期学员</label>
                <div class="col-sm-6">
                	<input type="text" name="activeStudent"  value="${market.activeStudent }" class="form-control input-sm" placeholder="请输入预期学员"/>
                </div>
            </div>
        </div>
    </div>
   <!--结束 -->
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">描述信息</h5>
    	<div class="row">
    	<div class="col-sm-10">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">描述信息</label>
                <div class="col-sm-9">
                	<textarea name="activeContent" class="form-control">${market.activeContent }</textarea>
                </div>
            </div>
        
        </div>

    </div>
 
   	<div class="row">
    	<div class="col-sm-3 col-sm-offset-4">
        	<input  type="submit" class="btn btn-success" value="保存"/>
            <a class="btn btn-warning" href="marketactive/list.do">返回上一级</a>
        </div>
    </div>
</form>
</body>
</html>