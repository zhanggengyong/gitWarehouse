package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("test")
public class testController {

    @RequestMapping("test")
    public String test(){

       /* Map<String ,Object> map = new HashMap<>();
        map.put("name","王海洋");
        map.put("age",20);*/
        return "index";
    }


}
