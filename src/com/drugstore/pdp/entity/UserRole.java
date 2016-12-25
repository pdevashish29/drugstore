package com.drugstore.pdp.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="USER_ROLE")
public class UserRole {
	@Id
	private long id;// user_role_id in user
	@Column(name="ROLE_NAME")
	private String roleName;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	@Override
	public String toString() {
		return "UserRole [id=" + id + ", roleName=" + roleName + "]";
	}

	
	
}
