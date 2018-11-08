package com.bit.ms.dao;

import java.util.List;

import com.bit.ms.admin.model.AdminVO;
import com.bit.ms.admin.model.StoreVO;
import com.bit.ms.user.model.UserVO;

public interface AdminDaoInterface {

	/*관리자정보관련*/
	public int regAdmin(AdminVO adminVO);// admin 회원가입
	public int checkOverId(String admin_id);// admin 아이디 중복 검사
	public AdminVO loginAdmin(String admin_id);// admin 로그인
	public List<UserVO> getUserList();// User List 출력
	public List<AdminVO> getAdminMyage(String admin_id);// 관리자 마이페이지(매장은 다르나 동일한관리자를 배열로 다 받아옴)
	public List<StoreVO> getStore(String admin_id);	// 관리자의 해당 매장정보를 가져오는
	public int editAdmin(AdminVO adminVo);	// 관리자 수정
	public int deleteAdmin(String admin_id);// 관리자 삭제

}
