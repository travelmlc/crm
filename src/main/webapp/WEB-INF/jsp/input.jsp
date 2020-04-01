<%--
  Created by IntelliJ IDEA.
  User: mlc123
  Date: 2020/3/15
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客户添加</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/customer/save.do" method="post">
        用户名：<input type="text" name="name"/><br>
        性别：<input type="radio" name="gender" value="男"/>男
              <input type="radio" name="gender" value="女"/>女<br>
        手机号：<input type="text" name="telephone"/><br>
        地址：<input type="text" name="addres"/><br>
        <input type="submit" value="注册">
    </form>
</body>
</html>
