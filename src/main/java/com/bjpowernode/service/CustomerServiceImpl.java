package com.bjpowernode.service;

import com.bjpowernode.dao.CustomerMapper;
import com.bjpowernode.user.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * ClassName:CustomerServiceImpl
 * Package:com.bjpowernode.service
 * Description:
 *
 * @Date:2020/3/15 19:50
 * @Author:mlc17607163664@163.com
 */
@Service("customerService")
@Transactional
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerMapper dao;

    @Override
    public List<Customer> findAll() {
        return dao.findAll();
    }
}
