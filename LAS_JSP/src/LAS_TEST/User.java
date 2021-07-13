package LAS_TEST;

import java.sql.Date;

public class User {
	private String ID;
	private String PW;
	private String Name;
	private Date Birth;
	private String phone;
	private String Address;
	private Date Loan;
	private String AD_Level;
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getPW() {
		return PW;
	}
	public void setPW(String pW) {
		PW = pW;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public Date getBirth() {
		return Birth;
	}
	public void setBirth(Date birth) {
		Birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public Date getLoan() {
		return Loan;
	}
	public void setLoan(Date loan) {
		Loan = loan;
	}
	public String getAD_Level() {
		return AD_Level;
	}
	public void setAD_Level(String aD_Level) {
		AD_Level = aD_Level;
	}
	
	
}
