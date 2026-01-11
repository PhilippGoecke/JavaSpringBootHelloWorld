package com.example.demo;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class DemoApplication {
    public static void main(String[] args) {
      SpringApplication.run(DemoApplication.class, args);
    }
    @GetMapping("/hello")
    public String hello(@RequestParam(value = "name", defaultValue = "World") String name) {
      String buildToolVersion = "Unknown";
      String mavenVersion = DemoApplication.class.getPackage().getImplementationVersion();
      if (mavenVersion != null) {
          buildToolVersion = "Maven: " + mavenVersion;
      } else {
          // This is a rough heuristic, often Gradle versions aren't easily available at runtime 
          // without specific manifest entries, but we can check for common system properties 
          // or just default if not found.
          buildToolVersion = "Gradle (or unpackaged)"; 
      }
      
      return String.format("Hello %s!<br>(Spring Version: %s)<br>(Build Tool Version: %s)", name, SpringApplication.class.getPackage().getImplementationVersion(), buildToolVersion);
    }
}
