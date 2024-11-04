package com.finalProject.service.review;

import java.util.List;

import com.finalProject.model.review.ReviewPagingInfo;
import com.finalProject.model.review.ReviewDTO;

public interface ReviewService {

	// �ۼ� ���� ���� ����
	int countWritableReviews(String member_id) throws Exception;

	// �ۼ� ���� ���� ��ȸ
	List<ReviewDTO> getWritableReviews(String member_id, ReviewPagingInfo pagingInfo) throws Exception;

}
