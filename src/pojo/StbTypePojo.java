package pojo;

public class StbTypePojo {

	private Integer id;
	private String stbType;
	private String stbFeatures;
	private String dimensions;
	private Integer price;
	private Integer installationCharges;
	private Integer upgradtionCharges;
	private Integer discount;
	private String billingType;
	private Integer refundableAmount;
	
	private StbTypePojo() {}
	
	public StbTypePojo(Integer id, String type, String features, String dim, Integer price, Integer instChrg, Integer upgrdChrg, Integer discount,
						String billType, Integer refund) {
		this();
		this.id = id;
		stbType = type;
		stbFeatures = features;
		dimensions = dim;
		this.price = price;
		installationCharges = instChrg;
		upgradtionCharges = upgrdChrg;
		this.discount = discount;
		billingType = billType;
		refundableAmount = refund;
	}
	
	public String getStbType() {
		return stbType;
	}

	public void setStbType(String stbType) {
		this.stbType = stbType;
	}
	
	public String getDimensions() {
		return dimensions;
	}

	public void setDimensions(String dimensions) {
		this.dimensions = dimensions;
	}
	
	public long getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}
	
	public long getInstallationCharges() {
		return installationCharges;
	}

	public void setInstallationCharges(Integer installationCharges) {
		this.installationCharges = installationCharges;
	}
	
	public long getUpgradtionCharges() {
		return upgradtionCharges;
	}

	public void setUpgradtionCharges(Integer upgradtionCharges) {
		this.upgradtionCharges = upgradtionCharges;
	}
	
	public long getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}
	
	public String getBillingType() {
		return billingType;
	}

	public void setBillingType(String billingType) {
		this.billingType = billingType;
	}
	
	public long getRefundableAmount() {
		return refundableAmount;
	}

	public void setRefundableAmount(Integer refundableAmount) {
		this.refundableAmount = refundableAmount;
	}
	
	public String getStbFeatures() {
		return stbFeatures;
	}
	
	public void setStbFeatures(String stbFeatures) {
		this.stbFeatures = stbFeatures;
	}
	
	@Override
	public String toString() {
		return id.toString();
	}
}
