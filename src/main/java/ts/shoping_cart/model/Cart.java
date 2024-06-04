package ts.shoping_cart.model;

public class Cart extends product{
	private int quantity;
	 
	public Cart() {
		
	}
	
	public int getQuantity() {
		return quantity;
		
	}
	public void setQuantity(int quantity) {
		this.quantity=quantity;
	}

}
