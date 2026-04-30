package com.salemtech.asset_management_system.utils;

import java.sql.Date;

import org.springframework.stereotype.Component;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;

@Component
public class JwtUtil {
	    private static final String SECRET_KEY = "your_very_long_and_very_secure_secret_key_here";
	    private static final long EXPIRATION_TIME = 86400000; // 24 hours

	    public String generateToken(String email) {
	        return Jwts.builder()
	                .subject(email)
	                .issuedAt(new Date(0))
	                .expiration(new Date(System.currentTimeMillis() + EXPIRATION_TIME))
	                .signWith(Keys.hmacShaKeyFor(SECRET_KEY.getBytes()))
	                .compact();
	    }
	}

