package kr.co.gudi.resource.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("cr")
public class CopyrightDTO {

	
	String cr_no ;
	int perSong_no;
	int member_no;
	String cr_name;
	int cr_price;
	Date cr_regdate;
	Date cr_expdate;
	Date cr_contdate; 
	String cr_state;
	
	int perhis_no;
	int per_price;
	Date per_date;
	String per_member;
	String cr_member;
	String cr_namae;
	

	public String getPer_member() {
		return per_member;
	}
	public void setPer_member(String per_member) {
		this.per_member = per_member;
	}
	public String getCr_namae() {
		return cr_namae;
	}
	public void setCr_namae(String cr_namae) {
		this.cr_namae = cr_namae;
	}
	public String getCr_member() {
		return cr_member;
	}
	public void setCr_member(String cr_member) {
		this.cr_member = cr_member;
	}
	public String getCr_no() {
		return cr_no;
	}
	public void setCr_no(String cr_no) {
		this.cr_no = cr_no;
	}
	public int getPerSong_no() {
		return perSong_no;
	}
	public void setPerSong_no(int perSong_no) {
		this.perSong_no = perSong_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getCr_name() {
		return cr_name;
	}
	public void setCr_name(String cr_name) {
		this.cr_name = cr_name;
	}
	public int getCr_price() {
		return cr_price;
	}
	public void setCr_price(int cr_price) {
		this.cr_price = cr_price;
	}
	public Date getCr_regdate() {
		return cr_regdate;
	}
	public void setCr_regdate(Date cr_regdate) {
		this.cr_regdate = cr_regdate;
	}
	public Date getCr_expdate() {
		return cr_expdate;
	}
	public void setCr_expdate(Date cr_expdate) {
		this.cr_expdate = cr_expdate;
	}
	public Date getCr_contdate() {
		return cr_contdate;
	}
	public void setCr_contdate(Date cr_contdate) {
		this.cr_contdate = cr_contdate;
	}
	public String getCr_state() {
		return cr_state;
	}
	public void setCr_state(String cr_state) {
		this.cr_state = cr_state;
	}
	public int getPerhis_no() {
		return perhis_no;
	}
	public void setPerhis_no(int perhis_no) {
		this.perhis_no = perhis_no;
	}
	public int getPer_price() {
		return per_price;
	}
	public void setPer_price(int per_price) {
		this.per_price = per_price;
	}
	public Date getPer_date() {
		return per_date;
	}
	public void setPer_date(Date per_date) {
		this.per_date = per_date;
	}
	


}
