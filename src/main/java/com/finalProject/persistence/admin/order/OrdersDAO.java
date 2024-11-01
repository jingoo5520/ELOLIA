package com.finalProject.persistence.admin.order;

import java.util.List;
import java.util.Map;

import com.finalProject.model.admin.order.AdminCancleVO;

public interface OrdersDAO {

	List<AdminCancleVO> getAllCancle(Map<String, Integer> pageMap);

	int getTotalPostCnt();

	List<AdminCancleVO> getTopCancle();

	List<AdminCancleVO> getSearchFilter(Map<String, Object> resultMap);

}
