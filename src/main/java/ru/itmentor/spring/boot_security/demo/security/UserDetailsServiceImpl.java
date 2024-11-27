package ru.itmentor.spring.boot_security.demo.security;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ru.itmentor.spring.boot_security.demo.repository.UserRepo;

import javax.transaction.Transactional;

@Transactional
@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    UserRepo userRepo;

    public UserDetailsServiceImpl(UserRepo userRepo){
        this.userRepo = userRepo;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        try {
            return userRepo.findByUsername(username);
        } catch (UsernameNotFoundException u) {
            throw new UsernameNotFoundException("User not found");
        }
    }
}
