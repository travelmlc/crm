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
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"
            charset="UTF-8"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
    <link id="themeLink" rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
</head>

<body>
<table id="list"></table>

<div id="tb">
    <a id="addBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
    <a id="editBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
    <a id="deleteBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
</div>

<!--编译窗口 closed:默认关闭-->
<div id="win" class="easyui-window" title="客户数据编译" style="width:400px; height:300px"
     data-options="iconCls:'icon-save',modal:true,closed:true" align="center">

    <form id="editForm" method="post">
        <!--提供id的隐藏域-->
        <input type="hidden" name="id"/>

        用户名：<input type="text" name="name" class="easyui-validatebox" data-options="required:true"/><br>
        性别：<input type="radio" name="gender" value="男"/>男
        <input type="radio" name="gender" value="女"/>女<br>
        手机号：<input type="text" name="telephone" class="easyui-validatebox" data-options="required:true"/><br>
        地址：<input type="text" name="addres" class="easyui-validatebox" data-options="required:true"/><br>
        <a id="saveBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">保存</a>
    </form>
</div>

<script type="text/javascript">

    //页面加载完毕后执行此代码，展示用户信息
    $(function () {
        $("#list").datagrid({
            //url:后台数据查询的地址
            url: "customer/listByPage.do",
            //columns:填充的列数据
            columns: [[
                {
                    field: "id",                 //field:后台对象的属性
                    title: "客户编号",           //title:列标题名称
                    width: 100,                  //width:宽度
                    checkbox: true               //复选框，将客户编号放入复选框
                },
                {
                    field: "name",
                    title: "客户名称",
                    width: 200
                },
                {
                    field: "gender",
                    title: "客户性别",
                    width: 100
                },
                {
                    field: "telephone",
                    title: "手机号码",
                    width: 300
                },
                {
                    field: "addres",
                    title: "客户地址",
                    width: 500
                }
            ]],
            //显示分页
            pagination: true,
            //工具条
            toolbar: "#tb"
        });

        //打开编译窗口
        $("#addBtn").click(function () {
            //每次打开添加按钮时，清空数据
            $("#editForm").form("clear");
            $("#win").window("open");
        });

        //保存数据(添加数据)
        $("#saveBtn").click(function () {
            $("#editForm").form("submit", {
                //将保存的数据提交到后台的地址
                url: "customer/save.do",
                //onSubmit：表单提交前的回调函数，true：提交表单   false：不提交表单
                onSubmit: function () {
                    //判断表单的验证是否都通过了   validate:当所有的数据都通过了返回true
                    return $("#editForm").form("validate");
                },
                //提交成功之后的回调函数
                success: function (data) {//data：服务器返回的数据，类型为字符串
                    //要求Controller返回的数据格式
                    //成功：{success:true}   失败：{success:false,msg:错误的信息}

                    //把data字符串类型转换为对象类型
                    //eval函数的作用是：将字符串当做一段JS代码解释并执行
                    data = eval("(" + data + ")");

                    if (data.success) {
                        //保存成功的同时，关闭添加窗口
                        $("#win").window("close");
                        //刷新数据
                        $("#list").datagrid("reload");

                        $.messager.alert("提示", "保存成功", "info");
                    } else {
                        $.messager.alert("提示", "保存失败:" + data.msg, "error");
                    }
                }
            });
        });

        //修改数据
        $("#editBtn").click(function () {
            //判断修改时，只能选择一行数据
            var rows = $("#list").datagrid("getSelections");
            if (rows.length != 1) {
                $.messager.alert("提示", "修改操作只能选择一行", "warning");
                return;
            }

            //表单回显，通过编号id来查询数据，也就是选中行数据的id，传递给后台,load会将hidden中的id填充给后台，用于区分修改和添加
            $("#editForm").form("load", "customer/findById.do?id=" + rows[0].id);

            $("#win").window("open");
        });

        //删除
        $("#deleteBtn").click(function () {
            var rows = $("#list").datagrid("getSelections");
            if (rows.length == 0) {
                $.messager.alert("提示", "删除操作至少选择一行", "warning");
                return;
            }

            //格式： id=1&id=2&id=3
            $.messager.confirm("提示", "确认删除数据吗?", function (value) {
                if (value) {
                    var idStr = "";
                    //遍历数据
                    $(rows).each(function (i) {
                        idStr += ("id=" + rows[i].id + "&");
                    });
                    idStr = idStr.substring(0, idStr.length - 1);

                    //传递到后台
                    $.post("customer/delete.do", idStr, function (data) {
                        if (data.success) {
                            //刷新datagrid
                            $("#list").datagrid("reload");

                            $.messager.alert("提示", "删除成功", "info");
                        } else {
                            $.messager.alert("提示", "删除失败：" + data.msg, "error");
                        }
                    }, "json");
                }
            });
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
