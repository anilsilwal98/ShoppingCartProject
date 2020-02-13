package example.shop.service;

import java.util.List;

import example.shop.entity.CartItem;

public class ItemService {

	public float calculateTotal(List<CartItem> cartItems) {
		float result = 0.0f;
		for (CartItem cartItem: cartItems) {
			result += cartItem.getCartPrice();
		}
		return result;
	}
	
	public float calculateSubTotal(Float price, int quantity) {
		return price*quantity;
	}
	
	public CartItem checkIfCartExists(int id, List<CartItem> cartItems) {
		if(cartItems.size() == 0) {
			return null;
		}
		for(CartItem cartItem: cartItems) {
			if (cartItem.getId() == id) {
				return cartItem;
			}
		}
		return null;
	}
}
