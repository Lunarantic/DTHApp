package pojo;

public class StbBuyPojo {
	
	private Integer id;
	private String customerName;
	private String stbType;
	private String stbMacId;
	private String stbSerialNumber;
	private StbTypePojo typePojo;
	private Double deposit;
	private Double tax;
	private Double amountPayable;
	
	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	
	public String getStbType() {
		return stbType;
	}

	public void setStbType(String stbType) {
		this.stbType = stbType;
	}
	
	public String getStbMacId() {
		return stbMacId;
	}

	public void setStbMacId(String stbMacId) {
		this.stbMacId = stbMacId;
	}
	
	public String getStbSerialNumber() {
		return stbSerialNumber;
	}

	public void setStbSerialNumber(String stbSerialNumber) {
		this.stbSerialNumber = stbSerialNumber;
	}
	
	public Double getDeposit() {
		return deposit;
	}

	public void setDeposit(Double deposit) {
		this.deposit = deposit;
	}
	
	public Double getTax() {
		return tax;
	}

	public void setTax(Double tax) {
		this.tax = tax;
	}
	
	public Double getAmountPayable() {
		return amountPayable;
	}

	public void setAmountPayable(Double amountPayable) {
		this.amountPayable = amountPayable;
	}

	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public StbTypePojo getTypePojo() {
		return typePojo;
	}
	
	public void setTypePojo(StbTypePojo typePojo) {
		this.typePojo = typePojo;
	}
	
	
}
