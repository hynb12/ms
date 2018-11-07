package com.bit.ms.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.bit.ms.member.model.ReplyVO;
import com.bit.ms.member.service.MemberReplyService;

@RestController
@RequestMapping("/reply")
public class MemberReplyCotroller {

	@Autowired
	MemberReplyService service;

	@RequestMapping(value = "/all/{noid}", method = RequestMethod.GET)
	public List<ReplyVO> replyList(@PathVariable("noid") int id) {

		List<ReplyVO> list = service.listReply(id);

		return list;
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public void replyInsert(ReplyVO vo) {

		service.insertReply(vo);

	}

	@RequestMapping(value = "/delete/{replyid}", method = RequestMethod.GET)
	public void replyDelete(@PathVariable("replyid") int id) {

		service.deleteReply(id);
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void replyModify(ReplyVO vo) {
		
		service.updateReply(vo);
	}
}