
package com.salemtech.asset_management_system.utils;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;
import java.util.List;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration {

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
	    http
	       
	        .cors(cors -> cors.configurationSource(corsConfigurationSource()))
	        
	        .csrf(csrf -> csrf.disable())
	        
	        .authorizeHttpRequests(auth -> auth
	            .requestMatchers("/admin/login", "/admin/register").permitAll()
	            .requestMatchers("/asset/**", "/request/**", "/user/**").permitAll()
	            .requestMatchers("/assign/**","/admin/**","/email/**").permitAll()
	            .requestMatchers(org.springframework.http.HttpMethod.OPTIONS, "/**").permitAll()
	            
	            .anyRequest().authenticated()
	        );

	    return http.build();
	}

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(List.of("http://localhost:4200"));
        configuration.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "DELETE", "OPTIONS"));
        configuration.setAllowedHeaders(List.of("*"));
        configuration.setAllowCredentials(true);

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }
}