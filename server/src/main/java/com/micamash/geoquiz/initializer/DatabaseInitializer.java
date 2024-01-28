package com.micamash.geoquiz.initializer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

@Component
public class DatabaseInitializer {

    private final JdbcTemplate jdbcTemplate;
    private final ResourceLoader resourceLoader;

    @Autowired
    public DatabaseInitializer(JdbcTemplate jdbcTemplate, ResourceLoader resourceLoader) {
        this.jdbcTemplate = jdbcTemplate;
        this.resourceLoader = resourceLoader;
    }

    @PostConstruct
    public void initializeDatabase() throws IOException {

        Resource resource = resourceLoader.getResource("classpath:geo-quiz-database.sql");

        try (BufferedReader reader = new BufferedReader(new InputStreamReader(resource.getInputStream()))) {
            StringBuilder scriptContent = new StringBuilder();
            String line;

            while ((line = reader.readLine()) != null) {
                scriptContent.append(line);
                scriptContent.append("\n");
            }

            jdbcTemplate.execute(scriptContent.toString());
        }
    }
}
