package kr.co.gudi.comMail.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.comMail.dao.ComMailDAO;
import kr.co.gudi.comMail.dto.ComMailDTO;

@Service
public class ComMailService {
	@Autowired ComMailDAO dao;
	
	Map<String, Object> map = new HashMap<String, Object>();
	
	@Value("${spring.servlet.multipart.location}") private String root;

	public int getReTotalMail(int member_no) {
		return dao.getReTotalMail(member_no);
	}

	public int getReUnreadMail(int member_no) {
		return dao.getReUnreadMail(member_no);
	}

	
	public Map<String, Object> receiveList(String page, int loginNo, String readOption) {
		int p = Integer.parseInt(page);
		int offset = (p - 1) * 10;
		
		ArrayList<ComMailDTO> list = new ArrayList<ComMailDTO>();
		
		if (readOption.equals("all")) {
			list = dao.receiveList(offset, loginNo);
		}else if(readOption.equals("read")) {
			list = dao.receiveListRead(offset,loginNo);
		}else if(readOption.equals("unread")) {
			list = dao.receiveListUnread(offset,loginNo);
		}
		
		map.put("list", list);
		
		int pages = dao.totalPage();
		map.put("pages", pages);
		
		if (p > pages) {
			p = pages;
		}
		map.put("currPage", p);
		
		return map;
	}

	public Map<String, Object> reMailSearch(String search_info, String page) {
		int p = Integer.parseInt(page);
		int offset = (p - 1) * 10;
		
		ArrayList<ComMailDTO> list = new ArrayList<>();
		list = dao.reMailSearch(search_info, offset);
		map.put("list", list);
		
		int pages = dao.totalPage();
		map.put("pages", pages);
		
		if (p > pages) {
			p = pages;
		}
		map.put("currPage", p);
		
		return map;
	}

	public void delReceive(ArrayList<String> delList) {
		for (String idx : delList) {
			dao.delReceive(idx);
		}
	}

	public ModelAndView receiveMailDetail(String note_no) {
		updateReState(note_no);
		ModelAndView mav = new ModelAndView();
		ComMailDTO dto = dao.receiveMailDetail(note_no);
		mav.addObject("reMailDetail", dto);
		// root 경로에 있는 파일 정보 가져오기
		ArrayList<ComMailDTO> fileList = dao.getFile(note_no);
		mav.addObject("list", fileList);
		mav.setViewName("/comMail/comMailReDetail");
		return mav;
	}

	private void updateReState(String note_no) {
		dao.updateReState(note_no);
	}

	public int getSeTotalMail(int member_no) {
		return dao.getSeTotalMail(member_no);
	}
	
	public int getSeUnreadMail(int member_no) {
		return dao.getSeUnreadMail(member_no);
	}
	
	public Map<String, Object> sendList(String page, int loginNo, String readOption) {
		int p = Integer.parseInt(page);
		int offset = (p - 1) * 10;
		
		ArrayList<ComMailDTO> list = new ArrayList<ComMailDTO>();
		
		if (readOption.equals("all")) {
			list = dao.sendList(offset, loginNo);
		}else if(readOption.equals("read")) {
			list = dao.sendListRead(offset,loginNo);
		}else if(readOption.equals("unread")) {
			list = dao.sendListUnread(offset,loginNo);
		}
		
		map.put("list", list);
		
		int pages = dao.totalPage();
		map.put("pages", pages);
		
		if (p > pages) {
			p = pages;
		}
		map.put("currPage", p);
		
		return map;
	}
	
	public Map<String, Object> seMailSearch(String search_info, String page) {
		int p = Integer.parseInt(page);
		int offset = (p - 1) * 10;
		
		ArrayList<ComMailDTO> list = new ArrayList<>();
		list = dao.seMailSearch(search_info, offset);
		map.put("list", list);
		
		int pages = dao.totalPage();
		map.put("pages", pages);
		
		if (p > pages) {
			p = pages;
		}
		map.put("currPage", p);
		
		return map;
	}
	
	public void delSend(ArrayList<String> delList) {
		for (String idx : delList) {
			dao.delSend(idx);
		}
	}
	
	public ModelAndView sendMailDetail(String note_no) {
		updateSeState(note_no);
		ModelAndView mav = new ModelAndView();
		ComMailDTO dto = dao.sendMailDetail(note_no);
		mav.addObject("seMailDetail", dto);
		// root 경로에 있는 파일 정보 가져오기
		ArrayList<ComMailDTO> fileList = dao.getFile(note_no);
		mav.addObject("list", fileList);
		mav.setViewName("/comMail/comMailSeDetail");
		return mav;
	}
	
	private void updateSeState(String note_no) {
		dao.updateSeState(note_no);
	}

	public void write(MultipartFile[] files, HashMap<String, String> param, int sender_no) {
		ComMailDTO dto = new ComMailDTO();
		String receiver_name = param.get("receiver");
		int receiver_no = dao.getReceiverNo(receiver_name);
		
		dto.setReceiver_no(receiver_no);
		dto.setSender_no(sender_no);
		dto.setNote_subject(param.get("note_subject"));
		dto.setNote_content(param.get("note_content"));
		
		dao.upload(dto);
	}
}
