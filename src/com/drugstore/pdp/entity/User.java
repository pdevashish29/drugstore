package com.drugstore.pdp.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="USERS")
public class User {
	@Id
	@GeneratedValue
	private long id ;
	private String firstName;
	private String  middleName;
	private String lastName;
	private String gender;
	private Date dateOfBirth;
	private String userName;
	private String password;
	private String email;
	private String phoneNo;
	private String mobileNo;
	private String bussinessName;
	@Column(updatable=false)
	private Date creationDate;
	@Column(updatable=false)
	private long createdBy;
	private Date lastUpdated= new Date();
	private long lastUpdatedBy;
	private String deleteFlag ;
	private String invalidFlag;

	@OneToOne(targetEntity=Address.class,cascade=CascadeType.ALL)
	@JoinColumn(name ="address_id")
	private Address  address;
	
	
	@OneToOne(targetEntity=UserRole.class,cascade=CascadeType.ALL)
	@JoinColumn(name ="user_role_id",referencedColumnName="id")
	private  UserRole  userRole;
	
	
	@OneToOne(targetEntity=BussinesDetails.class,cascade=CascadeType.ALL)
	@JoinColumn(name ="bussines_details_id",referencedColumnName="id")
	private  BussinesDetails  bussinesDetails;
	
	
	public void setBussinesDetails(BussinesDetails bussinesDetails) {
		this.bussinesDetails = bussinesDetails;
	}
	public BussinesDetails getBussinesDetails() {
		return bussinesDetails;
	}
	
	
	public void setUserRole(UserRole userRole) {
		this.userRole = userRole;
	}
	public UserRole getUserRole() {
		return userRole;
	}
	
	
	public void setAddress(Address address) {
		this.address = address;
	}
	public Address getAddress() {
		return address;
	}

	
	
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getBussinessName() {
		return bussinessName;
	}

	public void setBussinessName(String bussinessName) {
		this.bussinessName = bussinessName;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public long getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(long createdBy) {
		this.createdBy = createdBy;
	}

	public Date getLastUpdated() {
		return lastUpdated;
	}

	public void setLastUpdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

	public long getLastUpdatedBy() {
		return lastUpdatedBy;
	}

	public void setLastUpdatedBy(long lastUpdatedBy) {
		this.lastUpdatedBy = lastUpdatedBy;
	}

	public String getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public String getInvalidFlag() {
		return invalidFlag;
	}

	public void setInvalidFlag(String invalidFlag) {
		this.invalidFlag = invalidFlag;
	}


	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	
	
	
	
}