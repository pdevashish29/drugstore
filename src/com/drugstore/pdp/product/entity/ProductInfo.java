package com.drugstore.pdp.product.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="PRODUCT_INFO")
public class ProductInfo {
	@Id
	@GeneratedValue
	private long id;
	@Column(name="PRODUCTNAME")
	private String productName;
	@Column(name="COST_PRICE")
	private float costPrice;
	@Column(name="SELLING_PRICE")
	private float sellingPrice;
	@Column(name="PRODUCT_CATEGORY_NAME")
	private String productCategoryName;
	@Column(name="COMPANY_NAME")
	private String companyName;
	@Column(name="MFG_DATE")
	private Date mfgDate;
	@Column(name="EXP_DATE")
	private Date expDate;
	@Column(name="PACKAGING")
	private String packaging;
	@Column(name="QUANTITY")
	private long quantity;
	@Column(name="LASTUPDATED_DATE")
	Date lastUpdatedDate;
	@Column(name="LASTUPDATED_BY")
	String lastUpdatedBy;
	@Column(name="CREATION_DATE")
	Date creationDate;
	@Column(name="CREATED_BY")
	String createdBy;
	@Column(name="INVALID_FLAG")
	char invalidFlag;
	@Column(name="DELETE_FLAG")
	char deleteFlag;
	
	private String searchKeyOfProduct;
	
	public void setSearchKeyOfProduct(String searchKeyOfProduct) {
		this.searchKeyOfProduct = searchKeyOfProduct;
	}
	public String getSearchKeyOfProduct() {
		return searchKeyOfProduct;
	}
	
	public ProductInfo() {
		// TODO Auto-generated constructor stub
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public float getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(float costPrice) {
		this.costPrice = costPrice;
	}

	public float getSellingPrice() {
		return sellingPrice;
	}

	public void setSellingPrice(float sellingPrice) {
		this.sellingPrice = sellingPrice;
	}

	public String getProductCategoryName() {
		return productCategoryName;
	}

	public void setProductCategoryName(String productCategoryName) {
		this.productCategoryName = productCategoryName;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Date getMfgDate() {
		return mfgDate;
	}

	public void setMfgDate(Date mfgDate) {
		this.mfgDate = mfgDate;
	}

	public Date getExpDate() {
		return expDate;
	}

	public void setExpDate(Date expDate) {
		this.expDate = expDate;
	}

	public String getPackaging() {
		return packaging;
	}

	public void setPackaging(String packaging) {
		this.packaging = packaging;
	}

	public long getQuantity() {
		return quantity;
	}

	public void setQuantity(long quantity) {
		this.quantity = quantity;
	}

	public Date getLastUpdatedDate() {
		return lastUpdatedDate;
	}

	public void setLastUpdatedDate(Date lastUpdatedDate) {
		this.lastUpdatedDate = lastUpdatedDate;
	}

	public String getLastUpdatedBy() {
		return lastUpdatedBy;
	}

	public void setLastUpdatedBy(String lastUpdatedBy) {
		this.lastUpdatedBy = lastUpdatedBy;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public char getInvalidFlag() {
		return invalidFlag;
	}

	public void setInvalidFlag(char invalidFlag) {
		this.invalidFlag = invalidFlag;
	}

	public char getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(char deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	
	

}
