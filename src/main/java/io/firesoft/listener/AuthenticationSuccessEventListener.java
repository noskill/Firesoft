package io.firesoft.listener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Component;

import io.firesoft.service.LoginAttemptService;
import io.firesoft.service.SampleUserDetails;

@Component
public class AuthenticationSuccessEventListener 
  implements ApplicationListener<AuthenticationSuccessEvent> {

    @Autowired
    private LoginAttemptService loginAttemptService;

    public void onApplicationEvent(AuthenticationSuccessEvent e) {
        SampleUserDetails details =  (SampleUserDetails) e.getAuthentication().getPrincipal();
        String userName = details.getUsername();
        loginAttemptService.loginSucceeded(userName);
    }
}