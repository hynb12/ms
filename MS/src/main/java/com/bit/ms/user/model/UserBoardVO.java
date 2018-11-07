package com.bit.ms.user.model;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("UserBoardVO")
public class UserBoardVO {

	int uboard_id; // 유저게시판 번호
	String uboard_title; // 유저게시판 제목
	String uboard_con; // 유저게시판 내용
	Timestamp uboard_date; // 유저게시판 작성날짜
	String user_id; // 회원 아이디
	int store_id; // 매장 번호

	@Override
	public String toString() {
		return "UserBoardVO [uboard_id=" + uboard_id + ", uboard_title=" + uboard_title + ", uboard_con=" + uboard_con
				+ ", uboard_date=" + uboard_date + ", user_id=" + user_id + ", store_id=" + store_id + "]";
	}

	public UserBoardVO(int uboard_id, String uboard_title, String uboard_con, Timestamp uboard_date, String user_id,
			int store_id) {
		super();
		this.uboard_id = uboard_id;
		this.uboard_title = uboard_title;
		this.uboard_con = uboard_con;
		this.uboard_date = uboard_date;
		this.user_id = user_id;
		this.store_id = store_id;
	}

	public UserBoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getUboard_id() {
		return uboard_id;
	}

	public void setUboard_id(int uboard_id) {
		this.uboard_id = uboard_id;
	}

	public String getUboard_title() {
		return uboard_title;
	}

	public void setUboard_title(String uboard_title) {
		this.uboard_title = uboard_title;
	}

	public String getUboard_con() {
		return uboard_con;
	}

	public void setUboard_con(String uboard_con) {
		this.uboard_con = uboard_con;
	}

	public Timestamp getUboard_date() {
		return uboard_date;
	}

	public void setUboard_date(Timestamp uboard_date) {
		this.uboard_date = uboard_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getStore_id() {
		return store_id;
	}

	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}

}