package kr.ac.skuniv.springmvc.config;


import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;

import com.mysql.cj.jdbc.Driver;

@Configuration
@ComponentScan(basePackages= {"kr.ac.skuniv.springmvc.service","kr.ac.skuniv.springmvc.dao"})
@Import({MybatisConfig.class})
public class ApplicationConfig {
	@Bean
	public DataSource dataSource() {
		SimpleDriverDataSource dataSource = new SimpleDriverDataSource();
		dataSource.setDriverClass(Driver.class);
		dataSource.setUrl("jdbc:mysql://127.0.0.1:3306/food_db?serverTimezone=UTC");
		dataSource.setUsername("root");
		dataSource.setPassword("1234");
		return dataSource;
		
	}
	
	@Bean
	public JdbcTemplate jdbcTemplate() {
		return new JdbcTemplate(dataSource());
	}

}
