package com.chby;

import com.chby.filter.UpdateFilter;
import com.chby.filter.UserFilter;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;


@ServletComponentScan
@SpringBootApplication
public class DemoApplication {
    @Bean
    public FilterRegistrationBean setFilter(){
        FilterRegistrationBean filterBean = new FilterRegistrationBean();
//        filterBean.setFilter(new UserFilter());
//        filterBean.setName("UserFilter");
//        filterBean.addUrlPatterns("/paper/*");
//        filterBean.addUrlPatterns("/teacher/*");

        filterBean.setFilter(new UpdateFilter());
        filterBean.setName("UpdateFilter");
        filterBean.addUrlPatterns("/user/toUpdate");
        return filterBean;
    }

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }
}
