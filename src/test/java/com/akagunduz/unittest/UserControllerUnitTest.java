package com.akagunduz.unittest;



import org.aspectj.lang.annotation.Before;
import static org.hamcrest.core.IsEqual.equalTo;
import static org.junit.Assert.assertThat;
import static org.mockito.Mockito.doNothing;

import static org.mockito.Mockito.when;


import org.junit.*;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.akagunduz.controller.UserController;
import com.akagunduz.model.User;
import com.akagunduz.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;


@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("file:C:/Users/SERKAN/Desktop/Akagunduz/src/main/webapp/WEB-INF/spring") 
public class UserControllerUnitTest {
	 
    @Mock
    private UserService userService;
 
    @InjectMocks
    private UserController userController;
 
    private MockMvc mockMvc;
 
    @Before(value = "")
    public void setup() {
 
        // Process mock annotations
        MockitoAnnotations.initMocks(this);
 
        // Setup Spring test in standalone mode
        this.mockMvc = MockMvcBuilders.standaloneSetup(userController).build();
 
    }
    
    @Test
    public void addUserTest() throws Exception {
     
    	User user = new User("SERKAN","AKAGÜNDÜZ","6547899087");
    	when(userService.findById(user.getId())).thenReturn(user);
        doNothing().when(userService).create(user);
    	

        User user1 = this.userService.findById(user.getId());
        assertThat(user1.getName(), equalTo("SERKAN"));
        assertThat(user1.getSurname(), equalTo("AKAGÜNDÜZ"));       
                
     
    }  
    
    public static String asJsonString(final Object obj) {
        try {
            return new ObjectMapper().writeValueAsString(obj);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
    
    
}
