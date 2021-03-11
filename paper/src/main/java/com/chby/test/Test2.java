package com.chby.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author Lenovo
 */
public class Test2 {

    public static void main(String[] args) {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:spring/spring-shiro.xml");

        Object shiroRealm = applicationContext.getBean("shiroRealm");

        System.out.println(shiroRealm);
    }
}
