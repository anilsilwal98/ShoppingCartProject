package example.shop.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import example.shop.entity.Product;

public class ProductRepository {
	private Map<Integer,Product> db;

	public Product add(int id, String name, String description, float price) {
		Product p = new Product();
		p.setId(id);
		p.setName(name);
		p.setDescription(description);
		p.setPrice(price);
		return p;
	}

	public ProductRepository() {
		
		db = new HashMap<>();
		String dummyDescription = "Forem Forem Forem Forem Forem Forem Forem Forem Forem Forem Forem Forem Forem Forem Forem Forem Forem Forem ";
		db.put(1,this.add(1, "Table", dummyDescription, 10.0f));
		db.put(2,this.add(2, "Lamp", dummyDescription, 5.0f));
		db.put(3,this.add(3, "Couch", dummyDescription, 100.0f));
		db.put(4,this.add(4, "Chair", dummyDescription, 20.0f));

	}

	public List<Product> getProductList() {
		return new ArrayList(db.values());
	}

	public Map<Integer,Product> getAll() {
		return this.db;
	}

}
