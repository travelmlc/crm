<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>客户管理</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!-- 导入easyui的资源文件 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js" charset="UTF-8"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
    <link id="themeLink" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
</head>

<body>
<table id="list"></table>
<script type="text/javascript">

    //页面加载完毕后执行此代码，展示用户信息
        $(function () {
            $("#list").datagrid({
                //url:后台数据查询的地址
                url:"customer/listByPage.do",
                //columns:填充的列数据
                columns:[[
                    {
                        field:"id",                 //field:后台对象的属性
                        title:"客户编号",           //title:列标题名称
                        width:100,                  //width:宽度
                        checkbox:true               //复选框，将客户编号放入复选框
                    },
                    {
                        field:"name",
                        title:"客户名称",
                        width:200
                    },
                    {
                        field:"gender",
                        title:"客户性别",
                        width:100
                    },
                    {
                        field:"telephone",
                        title:"手机号码",
                        width:300
                    },
                    {
                        field:"addres",
                        title:"客户地址",
                        width:500
                    }
                ]],
                //显示分页
                pagination:true
            });

            var p = $('#list').datagrid('getPager');
            $(p).pagination({
                pageSize: 10,//每页显示的记录条数，默认为10
                pageList: [5, 10, 15],//可以设置每页记录条数的列表
                beforePageText: '第',//页数文本框前显示的汉字
                afterPageText: '页    共 {pages} 页',
                displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
            });
        });

</script>
</body>
</html>
