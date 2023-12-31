package kr.co.gudi.notification.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.member.vo.MemberVO;
import kr.co.gudi.notification.dto.NotiDTO;

@Mapper
public interface NotiDAO {

	ArrayList<NotiDTO> notiList(String member_no);

	void stateUpdate(String unique_no, String locate);

	int notiCount(String member_no);


}
