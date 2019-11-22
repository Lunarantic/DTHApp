package pojo;

public class ProspectiveBill implements Bill {
	
	private Double price, discount, installationCharge, deposit;
	
	private ProspectiveBill() {	}
	
	public ProspectiveBill(Double price, Double discount, Double installationCharge, Double deposit) {
		this();
		this.price = price;
		this.discount = discount;
		this.installationCharge = installationCharge;
		this.deposit = deposit;
	}

	@Override
	public Double getTotalDoubleAmount() {
		return getTaxAmount() + price + installationCharge + deposit - discount;
	}

	@Override
	public Double getTaxAmount() {
		return tax * (price + installationCharge + deposit - discount) / 100;
	}
}
