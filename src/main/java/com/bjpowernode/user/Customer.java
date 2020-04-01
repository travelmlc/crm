package com.bjpowernode.user;

/**
 * ClassName:Customer
 * Package:com.bjpowernode.user
 * Description:
 *
 * @Date:2020/3/15 18:10
 * @Author:mlc17607163664@163.com
 *
 * 实体类
 */
public class Customer {
    private Integer id;
    private String name;
    private String gender;
    private String telephone;
    private String addres;

    public Customer() {
    }

    public Customer(String name, String gender, String telephone, String addres) {
        this.name = name;
        this.gender = gender;
        this.telephone = telephone;
        this.addres = addres;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getAddres() {
        return addres;
    }

    public void setAddres(String addres) {
        this.addres = addres;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", telephone='" + telephone + '\'' +
                ", addres='" + addres + '\'' +
                '}';
    }
}
