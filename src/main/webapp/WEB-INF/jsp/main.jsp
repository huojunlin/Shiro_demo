<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>主页</title>
	<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
	<script type="text/javascript">
		function visit() {
			var url = "account/visit";
			var pars = {};
			$.post(url, pars, function(data) {
				if(data && data.errmsg) {
					alert(data.errmsg);
				} else {
					alert(data);
				}
			});
		}
	</script>
</head>

<body>
	<shiro:principal property="username"/>验证成功&nbsp;&nbsp;&nbsp;<a href = "logout.html">退出</a><br/><br/>
	<br/>
	<a href = "account/add.html">用户添加</a><br/>
	<a href = "account/update.html">用户修改</a><br/>
	<a href = "account/delete.html">用户删除</a><br/>
	<a href = "account/noauth.html">无需授权接口访问</a><br/>
	<a href = "javascript:void(0)" onclick="visit();">jquery ajax访问需要account:ajax权限接口</a><br/>
	<br/>
	<shiro:hasPermission name="account:add">
		用户拥有account:add权限<br/>
	</shiro:hasPermission>
	<shiro:hasPermission name="account:update">
		用户拥有account:update权限<br/>
	</shiro:hasPermission>
	<shiro:hasPermission name="account:delete">
		用户拥有account:delete权限<br/>
	</shiro:hasPermission>
	<shiro:hasPermission name="account:ajax">
		用户拥有account:ajax权限<br/>
	</shiro:hasPermission>
	
	<shiro:lacksPermission name="account:add">
		用户不拥有account:add权限<br/>
	</shiro:lacksPermission>
	<shiro:lacksPermission name="account:update">
		用户不拥有account:update权限<br/>
	</shiro:lacksPermission>
	<shiro:lacksPermission name="account:delete">
		用户不拥有account:delete权限<br/>
	</shiro:lacksPermission>
	<shiro:lacksPermission name="account:ajax">
		用户不拥有account:ajax权限<br/>
	</shiro:lacksPermission>
</body>
</html>
