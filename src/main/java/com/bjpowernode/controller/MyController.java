package com.bjpowernode.controller;

import com.bjpowernode.service.CustomerService;
import com.bjpowernode.user.Customer;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
     *
     * @return
     */
    @RequestMapping("/list.do")
    @ResponseBody
    public List<Customer> list() {
        List<Customer> list = service.findAll();
        return list;
    }

    //设计Map集合存储需要给页面的对象数据
    private Map<String, Object> result = new HashMap<>();

    /**
     * 分页查询
     * page:当前页面
     * rows：每页显示的记录条数
     *
     * @return
     */
    @RequestMapping("/listByPage.do")
    @ResponseBody
    public Map<String, Object> listByPage(Integer page, Integer rows) {
        //设置分页参数
        PageHelper.startPage(page, rows);
        //查询所有数据
        List<Customer> list = service.findAll();

        //使用PageInfo封装查询结果
        PageInfo<Customer> pageInfo = new PageInfo<Customer>(list);

        //从PageInfo对象取出查询结果
        long total = pageInfo.getTotal();
        //当前页数数据列表
        List<Customer> customersList = pageInfo.getList();
        result.put("total", total);
        result.put("rows", customersList);

        return result;
    }

    /**
     * 保存数据
     *
     * @param customer
     * @return
     */
    @RequestMapping("save.do")
    @ResponseBody
    public Map<String, Object> save(Customer customer) {
        try {
            service.save(customer);
            //若保存成功，返回true
            result.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            //若保存失败,返回false，并打印错误信息
            result.put("success", false);
            result.put("msg", e.getMessage());
        }
        return result;
    }

    /**
     * 根据id来查询数据
     *
     * @param id 用户的编号
     * @return 返回值：Customer对象
     */
    @RequestMapping("/findById.do")
    @ResponseBody
    public Customer findById(Integer id) {
        Customer cus = service.findById(id);
        return cus;
    }

    @RequestMapping("delete.do")
    @ResponseBody
    public Map<String, Object> delete(Integer[] id) {
        try {
            service.delete(id);
            result.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("msg", e.getMessage());
        }
        return result;
    }
}
