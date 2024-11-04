package com.finalProject.controller.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalProject.model.LoginDTO;
import com.finalProject.model.review.ReviewDTO;
import com.finalProject.model.review.ReviewPagingInfo;
import com.finalProject.model.review.ReviewPagingInfoDTO;
import com.finalProject.service.member.MemberService;
import com.finalProject.service.review.ReviewService;
import com.mysql.cj.Session;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/review")
public class RController {

	@Autowired
	private ReviewService service;
	
	@Autowired
	private MemberService MService;

	
	// �ۼ� ������ ����
	@GetMapping("/writableReview")
	public String WritableReview(@RequestParam(defaultValue = "1") int page, HttpServletRequest request, ReviewPagingInfoDTO pagingInfoDTO, Model model) throws Exception {
	    
	    HttpSession session = request.getSession();
	    LoginDTO loginMember = (LoginDTO) session.getAttribute("loginMember");
	    
	    System.out.println("������");
	    System.out.println(loginMember);

	    if (loginMember != null) {
	    	
	        // 1. �� �ۼ� ������ ���� ������ ������
	        int totalWritableReviews = service.countWritableReviews(loginMember.getMember_id());
	        
	        // 2. ����¡ ���� ���� 
	        pagingInfoDTO.setTotalPostCnt(totalWritableReviews); // �̹� �޼��� �Ķ���ͷ� ���޹޾����Ƿ� ����� ���ʿ�
	        ReviewPagingInfo pagingInfo = new ReviewPagingInfo(pagingInfoDTO, totalWritableReviews);
	        
	        // 3. �ۼ� ������ ���� ��� ��ȸ �� �𵨿� �߰�
	        model.addAttribute("reviews", service.getWritableReviews(loginMember.getMember_id(), pagingInfo));
	        model.addAttribute("pagingInfo", pagingInfo);
	        
	        System.out.println("�̰� �߸� �α��� �Ȱ���");
	        System.out.println(service.getWritableReviews(loginMember.getMember_id(), pagingInfo));
	        System.out.println("�α��ε� ȸ�� ID: " + loginMember.getMember_id());
	        System.out.println("�� �ۼ� ������ ���� ����: " + totalWritableReviews);
	        System.out.println("����¡ ���� �ε���: " + pagingInfo.getStartRowIndex());
	        System.out.println("�������� ��ȸ ����: " + pagingInfo.getPageSize());

	    } else {
	        System.out.println("�α��� ���� ����");
	        return "redirect:/member/viewLogin"; // �α��� ������ ���� ��� �α���������
	    }
	    
	    return "/user/pages/review/review";
	}

	
	
	// �ۼ� �� ����
	@GetMapping("/writtenByReview")
	public String WrittenByReview () {
		
		
		
		return "/user/pages/review/review"; 
	}
	
	// ���� �ۼ� ������
	@RequestMapping ("/writeReview")
	public String WriteReview () {
		
		return "/user/pages/review/writeReview"; 
	}
	
	
	
}
