package example.shop.entity;

public class CartItem {
	private int id;
	private String name;
	private String description;
	private float cartPrice;
	private int cartQuantity;
	
	public CartItem(int id, String name, String description, float cartPrice, int cartQuantity) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.cartPrice = cartPrice;
		this.cartQuantity = cartQuantity;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public float getCartPrice() {
		return cartPrice;
	}
	public void setCartPrice(float cartPrice) {
		this.cartPrice = cartPrice;
	}
	public int getCartQuantity() {
		return cartQuantity;
	}
	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity = cartQuantity;
	}
}
