package example.shop.entity;

import java.util.ArrayList;
import java.util.List;

public class Cart {

	private List<CartItem> cartItems;
	private float total;

	public Cart() {
		this.cartItems = new ArrayList<>();
		this.total = 0.0f;
	}

	public Cart(List<CartItem> cartItems,float total) {
		this.cartItems = cartItems;
		this.total = total;
	}
	
	public List<CartItem> getItems(){
		return this.cartItems;
	}
	
	public float getTotal() {
		return this.total;
	}
}
