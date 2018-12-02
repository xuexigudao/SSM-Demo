package com.atgugiu.crud.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.atguigu.crud.bean.Department;
import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.dao.DepartmentMapper;
import com.atguigu.crud.dao.EmployeeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:application.xml"})
public class CrudTest {
	
	@Autowired
	DepartmentMapper departmentMapper;
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	@Autowired
	SqlSession sqlSession;
	
	@Test
	public void test() {
		System.out.println(departmentMapper);
		
//		departmentMapper.insert(new Department(null, "开发部"));
//		departmentMapper.insert(new Department(null, "运营部"));
		
//		employeeMapper.insert(new Employee(null, "张三", "男", "zhangsan@qq.com", 1));
//		employeeMapper.insert(new Employee(null, "李四", "男", "zhangsan@qq.com", 1));
//		employeeMapper.insert(new Employee(null, "王二", "女", "zhangsan@qq.com", 1));
//		employeeMapper.insert(new Employee(null, "麻子", "女", "zhangsan@qq.com", 1));
		
		
		EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
		for (int i = 0; i < 100; i++) {
			String uuid = UUID.randomUUID().toString().substring(0, 5)+ i;
			mapper.insert(new Employee(null, uuid, "M", uuid +"atguigu@com", 1));
			
		}
		
		System.out.println("批量完成");
		
		
	}

}
