package com.project.finalProject.service;

import java.util.ArrayList;
import java.util.Date;

import com.project.finalProject.model.ChatVO;

public interface IChatService {
	ArrayList<ChatVO> listAllChat(int postNo); 
	void insertChat(ChatVO vo);

}
