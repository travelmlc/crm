package com.bjpowernode.service;

import com.bjpowernode.user.Customer;

import java.util.List;

/**
 * ClassName:CustomerService
 * Package:com.bjpowernode.service
 * Description:
 *
 * @Date:2020/3/15 19:49
 * @Author:mlc17607163664@163.com
 */
public interface CustomerService {

    //查询所有数据
    public List<Customer> findAll();

    //保存数据
    void save(Customer customer);

    Customer findById(Integer id);

    //删除数据
    void delete(Integer[] id);
}
