package example.shop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import example.shop.entity.User;
import example.shop.entity.Cart;
import example.shop.entity.CartItem;
import example.shop.entity.Product;
import example.shop.service.AuthenticationService;
import example.shop.service.ItemService;
import example.shop.service.ProductRepository;
import example.shop.service.UserRepository;

public class ControllerServlet extends HttpServlet {

	private UserRepository userList;
	private ProductRepository productList;
	private AuthenticationService authService;
	private ItemService itemService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.userList = new UserRepository();
		this.productList = new ProductRepository();
		this.authService = new AuthenticationService();
		this.itemService = new ItemService();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(true);

		String requestPage = req.getParameter("page");
		String nextPage = "/login.jsp";

		if (requestPage != null && requestPage.equalsIgnoreCase("login")) {
			nextPage = loginAuthentication(req, session);
		}

		else if (requestPage != null && requestPage.equalsIgnoreCase("checkout")) {
			String action = req.getParameter("action");
			String[] ids = req.getParameterValues("itemsChecked");
			Cart cart = null;
			if(ids != null) {
				 cart = addToCart(req, ids);
			}
			session.setAttribute("cart", cart);	
			if(action.equalsIgnoreCase("addtocart")) {
				req.setAttribute("productList", productList.getProductList());
				req.setAttribute("cartSuccess", "Added To Cart Successfully!");			
				nextPage = "/itemList.jsp";
			}
			else if(action.equalsIgnoreCase("checkout"))  {
				nextPage = "/checkout.jsp";				
			}
		}
		
		else if (requestPage != null && requestPage.equalsIgnoreCase("mycart")) {
			req.setAttribute("productList", productList.getProductList());
			nextPage = "/itemList.jsp";
		}
		
		else if (requestPage != null && requestPage.equalsIgnoreCase("logout")) {
			session.removeAttribute("user");
			session.removeAttribute("cart");
			nextPage = "/login.jsp";
		}
		
		RequestDispatcher rd = req.getRequestDispatcher(nextPage);
		rd.forward(req, resp);

	}

	private Cart addToCart(HttpServletRequest req, String[] ids) {
		List<CartItem> selectedItems = new ArrayList<>();
		Map<Integer,Product> db = productList.getAll();
		for (String id : ids) {
			Product product = db.get(Integer.parseInt(id));
			int quantity = Integer.parseInt(req.getParameter("quantity" + id));
			float price = itemService.calculateSubTotal(product.getPrice(), quantity);
			CartItem cartItem = new CartItem(Integer.parseInt(id), product.getName(), product.getDescription(),
					price, quantity);
			selectedItems.add(cartItem);
		}
		Cart cart = new Cart(selectedItems, itemService.calculateTotal(selectedItems));
		return cart;
	}

	private String loginAuthentication(HttpServletRequest req, HttpSession session) {
		String nextPage;
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		User user = this.authService.checkLogin(this.userList, username, password);
		if (user != null) {
			session.setAttribute("user", user);
			nextPage = "/itemList.jsp";
			req.setAttribute("productList", productList.getProductList());
			req.setAttribute("loginSuccess", "Welcome! " + username);
		} else {
			nextPage = "/login.jsp";
			req.setAttribute("loginError", "Invalid Username/Password!");
		}
		return nextPage;
	}

}
