package org.example.portfolio.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {

    @GetMapping({"","/", "/home"})
    public String showHomePage(){
        return "home";

    }

    // Add this for testing
    @GetMapping("/health")
    @ResponseBody
    public String health() {
        return "App is running on port: " + System.getenv("PORT");
    }
}
