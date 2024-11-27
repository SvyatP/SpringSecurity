package ru.itmentor.spring.boot_security.demo.exception;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Data
@NoArgsConstructor
@Scope("prototype")
public class ExceptionInfo {
    private String info;

    public ExceptionInfo(String info) {
        this.info = info;
    }
}
