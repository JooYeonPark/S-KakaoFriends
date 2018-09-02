package com.kakaoix.mall.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kakaoix.mall.interceptor.AuthorityInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer  {

	@Autowired
	private AuthorityInterceptor interceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(interceptor)
				.addPathPatterns("/orders/**");
//				.excludePathPatterns("/member/**", "");
	}
}
