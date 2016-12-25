package com.drugstore.pdp.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="BUSSINES_DETAILS")
public class BussinesDetails {
	
	@Id
	@GeneratedValue
	private long id;
	
	@Column(name="LICENSE_NO_1")
	private String license1;
	@Column(name="LICENSE_NO_2")
	private String license2;
	@Column(name="LICENSE_NO_3")
	private String license3;
	@Column(name="LICENSE_NO_4")
	private String license4;
	@Column(name="TIN_NO")
	private String tinNo;
	@Column(name="DISCOUNT_PERCENTAGE")
	private Float discoutInPercentage;
	@Column(name="DISCOUNT_INR")
	private Float discountInINR;
	@Column(name="OTHER_CHARGES")
	private Float other_charges;
	@Column(name="VAT_RATE")
	private Float vat;
	@Column(name="notes")
	private String notes;
	
	

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getLicense1() {
		return license1;
	}

	public void setLicense1(String license1) {
		this.license1 = license1;
	}

	public String getLicense2() {
		return license2;
	}

	public void setLicense2(String license2) {
		this.license2 = license2;
	}

	public String getLicense3() {
		return license3;
	}

	public void setLicense3(String license3) {
		this.license3 = license3;
	}

	public String getLicense4() {
		return license4;
	}

	public void setLicense4(String license4) {
		this.license4 = license4;
	}

	public String getTinNo() {
		return tinNo;
	}

	public void setTinNo(String tinNo) {
		this.tinNo = tinNo;
	}

	public Float getDiscoutInPercentage() {
		return discoutInPercentage;
	}

	public void setDiscoutInPercentage(Float discoutInPercentage) {
		this.discoutInPercentage = discoutInPercentage;
	}

	public Float getDiscountInINR() {
		return discountInINR;
	}

	public void setDiscountInINR(Float discountInINR) {
		this.discountInINR = discountInINR;
	}

	public Float getOther_charges() {
		return other_charges;
	}

	public void setOther_charges(Float other_charges) {
		this.other_charges = other_charges;
	}

	public Float getVat() {
		return vat;
	}

	public void setVat(Float vat) {
		this.vat = vat;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}


	//@Column(name="user_id")
	//private long user_id;

	
	
	
}