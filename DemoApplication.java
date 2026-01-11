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
      String buildTool = "Unknown";
      // Check if Maven pom.properties exists in classpath
      if (getClass().getResource("/META-INF/maven/com.example/demo/pom.properties") != null) {
          buildTool = "Maven";
      } else if (getClass().getResource("/META-INF/gradle/") != null) {
          buildTool = "Gradle";
      } else {
          buildTool = "Unpackaged/IDE";
      }
      
      String springVersion = SpringApplication.class.getPackage().getImplementationVersion();
      if (springVersion == null) {
          springVersion = "Unknown";
      }
      
      return String.format("Hello %s!<br>(Spring Version: %s)<br>(Build Tool: %s)", name, springVersion, buildTool);
    }
}
