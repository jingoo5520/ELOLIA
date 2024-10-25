package com.finalProject.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.finalProject.util.RememberPath;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("AuthInterceptor의 prehandle 동작");

		boolean result = false;

		HttpSession ses = request.getSession();
		new RememberPath().rememberPath(request); // 호출한 페이지 주소 저장.
		String uri = request.getRequestURI();
		if (ses.getAttribute("loginMember") == null) { // 로그인이 안된경우
			System.out.println("로그인 안됨");
			response.sendRedirect("/member/viewLogin"); // 로그인 페이지로 이동
			result = false;
		} else { // 로그인이 되어있는 경우
			if (uri.contains("/myPage/auth")) { // 마이페이지 인증요청인 경우
				result = true;
				response.sendRedirect(uri); // 인증 요청한 페이지로 이동
			} else {
				System.out.println("로그인 되있음");
				System.out.println("원래 있던 페이지 : " + uri);
				result = true;
				// 페이지에 대한 권한 인증 작업이 필요하면 밑에 추가
			}
		}

		return result;
	}

}
