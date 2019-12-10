package kr.ac.skuniv.springmvc.config;

import java.io.IOException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import kr.ac.skuniv.springmvc.mapper.Mapper;

@Configuration
@MapperScan(annotationClass=Mapper.class, basePackages= "kr.ac.skuniv.springmvc.dao",
			sqlSessionFactoryRef="sqlSessionFactoryBean")
public class MybatisConfig {
	
	@Bean
	public SqlSessionFactoryBean sqlSessionFactoryBean(DataSource dataSource, ApplicationContext context)
				throws IOException{
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(dataSource);
		factoryBean.setTypeAliasesPackage("com.lge.apip.mgmt.ocpo.policy.model");
		factoryBean.setConfigLocation(context.getResource("classpath:mybatis/configuration.xml"));  // 설정파일을 알려줌
		factoryBean.setMapperLocations(context.getResources("classpath:mybatis/mappers/**/*.xml"));   // mappers밑의 모든 파일 및 하위폴더의 모든 xml파일을 읽어오도록
		return factoryBean;
	}
	
	@Bean
	public SqlSessionTemplate sqlSession(SqlSessionFactory sqlSessionFactory) {
		return new SqlSessionTemplate(sqlSessionFactory);
	}
	

}
