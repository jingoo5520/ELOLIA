package com.finalProject.persistence.review;

import java.util.List;

import com.finalProject.model.review.ReviewPagingInfo;
import com.finalProject.model.review.ReviewDTO;

public interface ReviewDAO {

	// �ۼ� ���� ���� ����
	int selectCountWritableReviews(String member_id) throws Exception;

	// �ۼ� ���� ���� ��ȸ
	List<ReviewDTO> selectWritableReviews(String member_id, ReviewPagingInfo pagingInfo) throws Exception;

}
