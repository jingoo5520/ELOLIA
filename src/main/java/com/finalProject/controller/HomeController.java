package com.finalProject.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.util.WebUtils;

import com.finalProject.model.admin.homepage.BannerDTO;
import com.finalProject.model.LoginDTO;
import com.finalProject.model.MemberDTO;
import com.finalProject.service.home.HomeService;
import com.finalProject.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {

	@Inject
	HomeService hService;

	@Inject
	private MemberService memberService;

	@GetMapping("/")
	public String homePage(Model model, HttpServletResponse response, HttpServletRequest request) {
		
		HttpSession ses = request.getSession();
		ses.removeAttribute("rememberPath");
		LoginDTO loginMember = (LoginDTO) ses.getAttribute("loginMember");
		Cookie cookie = WebUtils.getCookie(request, "al"); // 자동 로그인 쿠키 받아옴.
		if (loginMember == null) { // 로그인 상태가 아니라면
			if (cookie != null) { // 자동 로그인 쿠키가 있다면
				String autologin_code = cookie.getValue(); // 쿠키 벨류 저장
				try {
					if (memberService.getAutoLogin(autologin_code) != null) {
						response.sendRedirect("/member/viewLogin"); // 일치하는 자동로그인 값이 있으니, viewLogin페이지로 보내서 인터셉터가 자동로그인
																	// 시키도록 처리
					} else {
						cookie.setMaxAge(0); // 유효기간 0초
						cookie.setPath("/"); // 쿠키의 Path를 "/"로 설정
						response.addCookie(cookie); // 쿠키 덮어씌우기(쿠키삭제처리)
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		Map<String, Object> data = new HashMap<String, Object>();
		List<BannerDTO> mainBannerList = new ArrayList<BannerDTO>();
		List<BannerDTO> subBannerList = new ArrayList<BannerDTO>();

		try {
			data = hService.getHomeData();

			List<BannerDTO> bannerList = (List<BannerDTO>) data.get("bannerList");

			System.out.println(bannerList);

			for (BannerDTO banner : bannerList) {
				if (banner.getBanner_type().equals("M")) {
					mainBannerList.add(banner);
				} else {
					subBannerList.add(banner);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println(data);

		model.addAttribute("newProducts", data.get("newProducts"));
		model.addAttribute("mainBannerList", mainBannerList);
		model.addAttribute("subBannerList", subBannerList);

		return "/user/index";
	}

}
