package kr.co.gudi.member.service;

import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.member.dao.MemberDAO;
import kr.co.gudi.member.dto.Department;
import kr.co.gudi.member.dto.MemberDTO;
import kr.co.gudi.member.vo.MemberVO;

@Service
public class MemberService implements UserDetailsService{
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired PasswordEncoder encoder;
	@Autowired
	private MemberDAO dao;
	
	@Value("${spring.servlet.multipart.location}") private String root; //C:/upload/
	
	public MemberVO selectMemberByParam(Map<String, Object> param) {
		return dao.selectMemberByParam(param);
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberVO loginMember = dao.selectMemberByParam(Map.of("member_id", username));
		if(loginMember==null) return null;
		return loginMember;
	}

	public MemberVO selectApprovMember(String member_id) {
		return dao.selectApprovMember(member_id);
	}

	public void updateProfileImg(Map<String, Object> param, Model model, String path) {

		int member_no = (int) param.get("member_no");
		int file_no =  dao.searchFileNo(member_no);
		param.put("file_no", file_no);
		dao.updateProfileImg(param);
		//String new_name = dao.findPhoto(file_no);
		logger.info(path);
		model.addAttribute("photo", path);
	}

	public MemberVO getMember() {
		return dao.getMember();
	}
	
	public List<Department> getAllDepartments() {
		return dao.getAllDepartments();
	}

	public List<MemberDTO> getTeamList(int depart_no) {
		return dao.getTeamList(depart_no);
	}

	public List<MemberDTO> getMemberList(int depart_no) {
		return dao.getMemberList(depart_no);
	}
	
	public List<MemberDTO> getMemberDetail(int member_no) {
		return dao.getMemberDetail(member_no);
	}
	
	public void join(HashMap<String, String> params, MultipartFile uploadFile) {
		
		String pain_pw =params.get("pw");
		String enc_pw = encoder.encode(pain_pw);
		logger.info("암호화 : "+enc_pw);
		params.put("pw", enc_pw);
		String depart_no=dao.getDepart(params);
		params.put("depart_no", depart_no);
		dao.join(params);
		
		String oriFileName = uploadFile.getOriginalFilename(); // 파일명 추출
		String ext = oriFileName.substring(oriFileName.lastIndexOf(".")); // 확장자 추출 
		String newFileName = System.currentTimeMillis()+ext; // 새파일명생성+확장자
		String file_location = "p";
		int file_unique_no=dao.getMember_id();
		int member_no=dao.getMember_id();

		try {
			byte[] bytes= uploadFile.getBytes();
			double fileSizeInKB = bytes.length / 1024.0;  // 바이트에서 킬로바이트로 변환
			int size=(int) fileSizeInKB;
			logger.info("파일크기"+fileSizeInKB+"KB");
			Path path = Paths.get(root+newFileName);
			Files.write(path, bytes);
			// 파일위치(p),해당테이블pk(member_no),오리네임,뉴네임,사이즈
			dao.uploadProfile(file_location,file_unique_no,oriFileName,newFileName,size);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}


	public String getMember_id() {
		int member_no =dao.getMember_id()+1;
		return "hoony"+member_no;
	}


	public HashMap<String, Object> list(String member_state, int depart_no) {
		ArrayList<MemberDTO> dto = new ArrayList<MemberDTO>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		dto=dao.list(member_state,depart_no);
		map.put("list",dto);
		
		return map;
	}


	public ModelAndView detail(String member_no){
		ModelAndView mav = new ModelAndView();
		ArrayList<MemberDTO> detail=dao.detail(member_no);
		mav.addObject("dto", detail);
		int depart_no=dao.getDepartNo(member_no);
		String team_name=dao.teamName(depart_no);		
		String depart_name = dao.depart_name(depart_no);
		String file_name=dao.file(member_no,"p");
		mav.addObject("team_name", team_name);
		mav.addObject("depart_name", depart_name);
		// C:/upload 에 있는 파일 정보 가져오기
		String filePath = root+file_name;
		Resource resource;
		try {
			resource = new UrlResource("file:" + filePath);
			logger.info("URL 파일경로 : "+resource);
			mav.addObject("file", resource);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		logger.info("상세보기 파일명 : "+file_name);
		logger.info("상세보기 파일경로 : "+filePath);

		return mav;
	}


	public void updateDo(String member_no, HashMap<String, Object> params, MultipartFile uploadFile) {
		params.put("member_no", member_no);
		dao.updateDo(params);
		dao.updateDepart(params);
		dao.updateTeam(params);		
		logger.info("사진 : "+uploadFile);
		String oriFileName = uploadFile.getOriginalFilename(); // 파일명 추출
		String ext = oriFileName.substring(oriFileName.lastIndexOf(".")); // 확장자 추출 
		String newFileName = System.currentTimeMillis()+ext; // 새파일명생성+확장자
		String file_location = "p";

		try {
			byte[] bytes= uploadFile.getBytes();
			double fileSizeInKB = bytes.length / 1024.0;  // 바이트에서 킬로바이트로 변환
			int size=(int) fileSizeInKB;
			logger.info("파일크기"+fileSizeInKB+"KB");
			Path path = Paths.get(root+"/"+newFileName);
			Files.write(path, bytes);
			// 파일위치(p),해당테이블pk(member_no),오리네임,뉴네임,사이즈
			dao.updateProfile(file_location,member_no,oriFileName,newFileName,size);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}



	public HashMap<String, Object> departList(String departState) {
		String depart_state="";
		if(departState.equals("existence")) {
			depart_state="0";
		}else {
			depart_state="1";
		}
		
		return dao.departList(depart_state);
	}


	public List<MemberDTO> getDepartList() {
		
		return dao.getDepartList();
	}


	public HashMap<String, Object> teamList(int depart_no) {
		HashMap<String, Object> list = new HashMap<String, Object>();
		List<MemberDTO> team =dao.teamList(depart_no);
		list.put("team", team);
		return list;
	}
	
	// 연차 스케줄링
	public void updateLeave(String formattedDate) {
		dao.updateLeave(formattedDate);
		
	}
}