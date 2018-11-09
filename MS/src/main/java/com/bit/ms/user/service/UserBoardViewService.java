package com.bit.ms.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.dao.UserDaoInterface;
import com.bit.ms.user.model.UserBoardVO;

@Service
public class UserBoardViewService {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	private UserDaoInterface userDaoInterface;

	public UserBoardVO getUserBoardViewS(int uboard_id) {

		userDaoInterface = sessionTemplate.getMapper(UserDaoInterface.class);

		UserBoardVO userBoardVO = userDaoInterface.getUserBoardViewI(uboard_id);

		return userBoardVO;
	}
}