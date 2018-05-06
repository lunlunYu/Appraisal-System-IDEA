package model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseTbUser<M extends BaseTbUser<M>> extends Model<M> implements IBean {

	public void setUserid(java.lang.Integer userid) {
		set("userid", userid);
	}
	
	public java.lang.Integer getUserid() {
		return getInt("userid");
	}

	public void setUsername(java.lang.String username) {
		set("username", username);
	}
	
	public java.lang.String getUsername() {
		return getStr("username");
	}

	public void setPassword(java.lang.String password) {
		set("password", password);
	}
	
	public java.lang.String getPassword() {
		return getStr("password");
	}

	public void setSex(java.lang.Boolean sex) {
		set("sex", sex);
	}
	
	public java.lang.Boolean getSex() {
		return get("sex");
	}

}