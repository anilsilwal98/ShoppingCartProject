package example.shop.entity;
import java.util.List;

//POJO Class
public class User {
	private int id;
	private String name;
	private String username;
	private String password;
	private List<Product> productList;
	
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<Product> getProductList() {
		return productList;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}
	
	public int addProduct(Product p) {
		this.getProductList().add(p);
		return p.getId();	
	}
	
	public int removeProduct(Product p) {
		this.getProductList().remove(p);
		return p.getId();
	
	}
	
	@Override
	public String toString() {
		return "Id:"+getId()+ "Name:"+ getName()+"\nProductList"+ getProductList();
	}
	
}