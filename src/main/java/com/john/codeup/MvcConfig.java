package com.john.codeup;

import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfig implements WebMvcConfigurer{

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//		WebMvcConfigurer.super.addResourceHandlers(registry);
//		to expose file dir to client
//		create new path
		Path picUploadDir = Paths.get("./profile-pics/");
		String picUploadPath = picUploadDir.toFile().getAbsolutePath();
		
		registry.addResourceHandler("/profile-pics/**").addResourceLocations("file:/" + picUploadPath + "/");
	}

	
}
