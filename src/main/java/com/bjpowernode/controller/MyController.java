package com.bjpowernode.controller;

import com.bjpowernode.service.CustomerService;
import com.bjpowernode.user.Customer;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ClassName:MyController
 * Package:com.bjpowernode.controller
 * Description:
 *
 * @Date:2020/3/15 20:28
 * @Author:mlc17607163664@163.com
 */
@Controller
@RequestMapping("/customer")
public class MyController {

    //注入service对象
    @Autowired
    private CustomerService service;

    /**
     * 查询所有数据，给页面返回json格式的数据
     * easyUI的datagrid组件，需要展示数据提供json数据：[{id:1,name:xxx},{id:2,name:xxx}...]
     * @return
     */
    @RequestMapping("/list.do")
    @ResponseBody
    public List<Customer> list(){
        List<Customer> list = service.findAll();
        return list;
    }

    //设计Map集合存储需要给页面的对象数据
    private Map<String,Object> result = new HashMap<>();

    /**
     * 分页查询
     * page:当前页面
     * rows：每页显示的记录条数
     * @return
     */
    @RequestMapping("/listByPage.do")
    @ResponseBody
    public Map<String,Object> listByPage(Integer page,Integer rows){
        //设置分页参数
        PageHelper.startPage(page,rows);
        //查询所有数据
        List<Customer> list = service.findAll();

        //使用PageInfo封装查询结果
        PageInfo<Customer> pageInfo = new PageInfo<Customer>(list);

        //从PageInfo对象取出查询结果
        long total = pageInfo.getTotal();
        //当前页数数据列表
        List<Customer> customersList = pageInfo.getList();
        result.put("total",total);
        result.put("rows",customersList);

        return result;
    }
}
