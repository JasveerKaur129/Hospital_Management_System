package model;

public class User {
	private long uid;
	private String pwd;
	private String role;
	private String username;
	private String reg_status;
	
	
	
	@Override
	public String toString() {
		return " uid=" + uid + ", pwd=" + pwd + ", role=" + role + ", username=" + username + ", reg_status="
				+ reg_status ;
	}


	public User(long uid, String pwd, String role, String username, String reg_status) {
		 
		this.uid = uid;
		this.pwd = pwd;
		this.role = role;
		this.username = username;
		this.reg_status = reg_status;
	}
	
	
	public long getUid() {
		return uid;
	}
	public void setUid(long uid) {
		this.uid = uid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getReg_status() {
		return reg_status;
	}
	public void setReg_status(String reg_status) {
		this.reg_status = reg_status;
	}
	
}
