package com.example.cs3200yang.hello;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class helloController {
    @GetMapping("/api/sayhello/string")
    public String sayhello() {
        return "Hello World!";
    }

    @GetMapping("/api/sayhello/object")
    public hello sayhelloobject(){
        hello h = new hello();
        h.setMessage("Hello from object");
        return h;
    }
}
