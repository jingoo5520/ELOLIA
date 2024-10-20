package com.finalProject.controller.cart;

import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.finalProject.model.LoginDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CartController {
	@GetMapping("/cart")
	public String cartPage(HttpSession session) {
		LoginDTO loginMember = (LoginDTO) session.getAttribute("loginMember");
		if (loginMember != null) {
			System.out.println("cart : �α��� ����, ȸ�����̵� : " + loginMember.getMember_id());
		} else {
			System.out.println("cart : �α��� ������");
		}
		
		return "user/cart/cart";
	}
}
