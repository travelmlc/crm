package com.bjpowernode.dao;

import com.bjpowernode.user.Customer;

import java.util.List;

/**
 * ClassName:CustomerMapper
 * Package:com.bjpowernode.dao
 * Description:
 *
 * @Date:2020/3/15 18:12
 * @Author:mlc17607163664@163.com
 */
public interface CustomerMapper {

    /**
     * 查询所有的数据
     */
    public List<Customer> findAll();
}
