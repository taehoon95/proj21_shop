package proj21_shop.service.member.order;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.junit.After;
import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import proj21_shop.config.ContextRoot;
import proj21_shop.dto.cart.CartDTO;
import proj21_shop.dto.member.MemberDTO;
import proj21_shop.dto.product.ProductDTO;
import proj21_shop.service.order.CartService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class CartServiceTest {
	private static final Log log = LogFactory.getLog(CartServiceTest.class);
	
	@Autowired
	private CartService service;
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	//@Test
	public void test01ShowCartsByMemberId() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		MemberDTO newMem = new MemberDTO();
		newMem.setMemberId("test01");
		ProductDTO pro = new ProductDTO();
		
		CartDTO cart = new CartDTO();
		cart.setMemberId(newMem);
		List<CartDTO> list = service.showCartsByMemberId(cart);
		Assert.assertNotNull(list);
	}

	//@Test 
	public void test02InsertCart() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		MemberDTO newMem = new MemberDTO();
		newMem.setMemberId("test01");

		ProductDTO newPro = new ProductDTO();
		newPro.setProNum(1033);
		
		CartDTO cart = new CartDTO();
		cart.setMemberId(newMem);
		cart.setCartProNum(newPro);
		cart.setCartProQuantity(1);
		
		int res = service.insertCart(cart);
		Assert.assertEquals(1, res);
		log.debug("res memid, proNum, 수량 >>" + res);
	}

	//@Test
	public void test03DeleteCart() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		int res = service.deleteCart(70);
		Assert.assertEquals(1, res);
		log.debug("proNum >>" + res);
	}

	@Test
	public void test04useProductOrderBtn() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		MemberDTO member = new MemberDTO();
		member.setMemberId("test01");
		
		ProductDTO prod = new ProductDTO();
		prod.setProNum(6165);
		
		CartDTO cart = new CartDTO();
		cart.setCartNum(239);
		cart.setMemberId(member);
		cart.setCartProNum(prod);
		cart.setCartProQuantity(3);
		
		List<Integer> cartNum = service.useProductOrderBtn(cart);
		System.out.println(cartNum);
		Assert.assertNotNull(cartNum);
	}

}
