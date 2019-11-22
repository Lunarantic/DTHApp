package pojo;

public class Customer {

	private Integer id;
	private String firstName;
	private String lastName;
	private String email;
	private String state;
	private String password;
	private Integer retailerID;
	private Double amount;
	
	private Customer() {
		
	}
	
	public Customer(Integer id, String firstName, String lastName, String email, String state, String password, Integer retailerId, Double amount) {
		this();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.state = state; 
		this.password = password;
		this.retailerID = retailerId;
		this.amount = amount;
	}
	
	public String getName( ) {
		return firstName + " " + lastName;
	}
	
	public Integer getId( ) {
		return id;
	}
	
	@Override
	public String toString() {
		return String.valueOf(id);
	}

	public Integer getRetailerID() {
		return retailerID;
	}
	
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	
	public Double getAmount() {
		return this.amount;
	}
}
