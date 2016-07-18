package io.firesoft.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.ws.rs.NotAuthorizedException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;

import io.firesoft.model.RegistrationType;
import io.firesoft.model.User;
import io.firesoft.service.UserService;

@Component
public class GoogleAuthProvider implements AuthenticationProvider {

    private class UserInfo{
        public String email;
        public String fullName;
    }
    
    @Autowired
    UserService service;
    
    @Override
    public Authentication authenticate(Authentication authentication)
            throws AuthenticationException {
        String token = authentication.getCredentials().toString();
        // Check if the token is present
        if (token == null || token.isEmpty()) {
            throw new NotAuthorizedException("Token must be provided");
        }
        UserInfo userInfo = null;
        // Validate the token
        try {
            userInfo = validateToken(token);
        } catch (IOException e) {
            throw new NotAuthorizedException(e);
        }
        if (authentication.getPrincipal() != userInfo.email) {
            throw new NotAuthorizedException("Email and password doesn't match");
        }
        List<GrantedAuthority> grantedAuths = new ArrayList<>();
        UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(authentication, authentication);
        User user = service.findUserByEmail(userInfo.email);
        if (user == null) {
            user = new User();
            user.setEmail(userInfo.email);
            user.setFullName(userInfo.fullName);
            user.setRegType(RegistrationType.Google);
            grantedAuths.add(new SimpleGrantedAuthority("ROLE_USER"));
            return result;
        }
        // todo: use user.getRoles()
        grantedAuths.add(new SimpleGrantedAuthority("ROLE_USER"));
        result.setAuthenticated(true);
        return result;
    }

    @Override
    public boolean supports(Class<?> authentication) {
        // TODO Auto-generated method stub
        if (authentication.getClass().equals(UsernamePasswordAuthenticationToken.class))
            return true;
        return false;
    }
    
    private UserInfo validateToken(String token) throws IOException {

        GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier
            .Builder(new NetHttpTransport(), new GsonFactory())
                .setAudience(Arrays.asList("46727822461-4ljlensngrf1r741kn9jvlaenrdkf8jk.apps.googleusercontent.com"))
                .build();

        UserInfo result = new UserInfo();
        GoogleIdToken idToken;
        try {
            idToken = verifier.verify(token);
        } catch (GeneralSecurityException e) {
            throw new NotAuthorizedException(e);
        }
        if (idToken != null) {
            Payload payload = idToken.getPayload();
            result.email = payload.getEmail();
            result.fullName = payload.getSubject();
            System.out.println("User ID: " + payload.getSubject());
            return result;
        } 
        throw new NotAuthorizedException("Invalid token.");
    }

}
