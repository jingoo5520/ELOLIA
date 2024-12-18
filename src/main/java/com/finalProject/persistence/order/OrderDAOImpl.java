package com.finalProject.persistence.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.finalProject.model.LoginDTO;
import com.finalProject.model.order.OrderMemberDTO;
import com.finalProject.model.order.OrderProductDTO;
import com.finalProject.model.order.OrderRequestDTO;
import com.finalProject.model.order.PaymentRequestDTO;
import com.finalProject.model.order.ProductCancelRequestDTO;
import com.finalProject.model.order.ProductDiscountCalculatedDTO;
import com.finalProject.model.order.ProductDiscountDTO;

@Repository
public class OrderDAOImpl implements OrderDAO {
	@Inject
	private SqlSession ses;

	private String ns = "com.finalProject.mappers.orderMapper.";

	@Override
	public List<OrderProductDTO> selectProductInfo(List<OrderRequestDTO> requestsInfo) {
		// 상품 정보 조회
		return ses.selectList(ns + "selectProductInfo", requestsInfo);
	}

	@Override
	public OrderMemberDTO selectMemberInfo(String memberId) {
		// 주문 회원 조회
		return ses.selectOne(ns + "selectMemberInfo", memberId);
	}
	
	// ++ 쿠폰테이블


	@Override
	public void deleteOrder(String orderId) {
		ses.delete(ns + "deleteProductsOfOrder", orderId);
		ses.delete(ns + "deleteOrder", orderId);
	}
	
	@Override
	public String makeOrder(PaymentRequestDTO request, boolean isMember) throws Exception {	
//		public class PaymentRequestDTO {
//			private List<OrderRequestDTO> productsInfo; // 상품번호 + 수량 정보 리스트
//			private int totalPrice; // 총 예상 결제 금액
//		    private String paymentType; // 결제 방법
//		    private String saveDeliveryType; // 배송지 저장 구분
//		    private String deliveryName; // 배송지 이름
//		    private String deliveryAddress; // 배송지 주소
//		    private String deliveryRequest; // 배송 요청사항
//		    private String ordererId; // 주문자 ID
//		    private String ordererName; // 주문자 이름
//		    private String phoneNumber; // 주문자 전화번호
//		    private String email; // 주문자 이메일
//		    private int pointDC; // 사용 포인트
//		    private String couponUse; // 사용 쿠폰코드
//		}
		
//		public class OrderRequestDTO {
//			// 주문 상품 번호, 주문 상품 수량
//			private int productNo;
//			private int quantity;
//		}
		
		// NOTE : 모든 컨트롤러 메소드의 예외에다가 행을 삭제하도록 하긴 했지만 미완료된 행이 혹시 남아있을 수 있음
		// TODO : 그런데 이 메소드를 쓰더라도 비회원 주문은 아이디가 항상 새롭게 생성되기 때문에 안지워질 수 있음 
		// 예를 들어 비회원 상태로 주문 결제하기 버튼을 반복해서 누르고 창을 닫는다면 orders 테이블에 행이 쌓이는 걸 못 막음
		if (isMember == true) {
			// 트랜잭션 처리
			this.deleteUncompletedOrder(request.getOrdererId());
		}
		if (isMember == false) {
			// 기본값으로 "non_member"가 지정되어 있는데 이걸 UUID로 바꿔준다.
			request.setOrdererId(UUID.randomUUID().toString()); 
		}
		
		// order 정보 작성
		String orderId = UUID.randomUUID().toString();
		Map<String, Object> params = new HashMap<>();
		params.put("request", request);
		params.put("orderId", orderId);
		if (ses.insert(isMember == true ? ns + "makeOrderByMember" : ns + "makeOrderByNonMember", params) != 1) {
			System.out.println("makeOrderByMember or makeOrderByNonMember에서 에러 발생");
			throw new DataAccessException("주문 정보 생성 실패") {};
			// return null;
		};
		
		// params 초기화
		params = new HashMap<>();
		// orderProduct 정보 작성
		List<Object> productInfoList = new ArrayList<>();
		for (OrderRequestDTO product : request.getProductsInfo()) {
			Map<String, Object> productParams = new HashMap<>();
			productParams.put("product_no", product.getProductNo());
			productParams.put("order_count", product.getQuantity());
			productInfoList.add(productParams);
		}
		System.out.println("productInfoList : " + productInfoList);
		params.put("productInfoList", productInfoList);
		params.put("orderId", orderId);
		int insertedRowNum = ses.insert(ns + "insertOrderProduct", params);
		System.out.println("insertedRowNum : " + insertedRowNum);
		if (insertedRowNum != productInfoList.size()) {
			System.out.println("insertOrderProduct에서 에러 발생");
			throw new DataAccessException("주문 정보 생성 실패") {};
			// return null;
		}
		return ses.selectOne(ns + "selectUncompletedOrderId", request.getOrdererId());
	}
	
	@Override
	public void deletePaidProductsFromCart(String memberId) {
		ses.delete(ns + "deletePaidProductsFromCart", memberId);
	}
	
	@Override
	public List<ProductDiscountDTO> getDiscountInfoByProduct(String orderId, HttpSession session) {
		boolean isMember = false;
		String memberId = "";
		LoginDTO loginDTO = (LoginDTO) session.getAttribute("loginMember");
		if (loginDTO == null) {
			isMember = false;
		} else {
			isMember = true;
			memberId = loginDTO.getMember_id();
		}
		Map<String, Object> params = new HashMap<>();
		params.put("orderId", orderId);
		params.put("isMember", isMember);
		params.put("memberId", memberId);
		return ses.selectList(ns + "selectDiscountInfoByProduct", params);
	}
	
	@Transactional(rollbackFor={Exception.class})
	private void deleteUncompletedOrder(String ordererId) {
		ses.delete(ns + "deleteProductsOfUncompletedOrder", ordererId);
		ses.delete(ns + "deleteUncompletedOrder", ordererId);
	}
	
	@Override
	public int getPrice(int productNo) {
		System.out.println("getPrice 쿼리 결과 : " + ses.selectOne(ns + "getPrice", productNo));
		return ses.selectOne(ns + "getPrice", productNo);
	}
	
	@Override
	public int selectDeliveryCost(String orderId) {
		return ses.selectOne(ns + "selectDeliveryCost", orderId);
	}
	
	@Override
	public int makeGuest(PaymentRequestDTO request, String orderId) {
		Map<String, Object> params = new HashMap<>();
		params.put("request", request);
		params.put("orderId", orderId);
		return ses.insert(ns + "insertGuest", params);
	}

	@Override
	public int getExpectedTotalPrice(String orderId) {
		return ses.selectOne(ns + "selectExpectedTotalPrice", orderId);
	}
	
	// amount에 배달료를 더해서 예상총결제금액을 업데이트한다.
	@Override
	public int updateExpectedTotalPriceWithDeliveryCost(String orderId, int amount) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("orderId", orderId);
		params.put("amount", amount);
		return ses.update(ns + "updateExpectedTotalPriceWithDeliveryCost", params);
	}
	
	@Override
	public int updateRefundPriceByProduct(List<ProductDiscountCalculatedDTO> productDiscountCalculated) {
		int updatedRow = 0;
		for (ProductDiscountCalculatedDTO p : productDiscountCalculated) {
			ses.update(ns + "updateRefundPriceByProduct", p);
			updatedRow++;
		}
		return updatedRow;
	}
	
	@Override
	public int setPaymentModuleKey(String orderId, String key) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("orderId", orderId);
		params.put("key", key);
		return ses.update(ns + "updatePaymentModuleKey", params);
	}
	
	@Override
	public String getPaymentModuleKey(String orderId) {
		return ses.selectOne(ns + "selectPaymentModuleKey", orderId);
	}
	
	@Override
	public Integer useCoupon(String orderId, String couponCode) {
		Map<String, Object> params = new HashMap<>();
		params.put("orderId", orderId);
		params.put("couponCode", couponCode);
		return ses.insert(ns + "insertToCouponUsed", params);
	}
	
	@Override
	public boolean updatePoint(String orderId) {
		// 포인트 차감
		Map<String, Object> params = new HashMap<>();
		params.put("orderId", orderId);
		if (ses.insert(ns + "insertToPointUsed", params) != 1) {
			return false;
		};
		if (ses.update(ns + "subtractUserPoint", params) != 1) {
			return false;
		};
		// 최종 결제 금액으로 인한 포인트 적립
		if (ses.update(ns + "addUserPoint", params) != 1) {
			return false;
		};
		// 포인트 적립 이력 내역 작성
		if (ses.insert(ns + "writePointEarnedLogByPurchase", params) != 1) {
			return false;
		}
		return true;
	}
	
	@Override
	public boolean updateUserLevel(String orderId) {
//		if (ses.update(ns + "updateUserLevel", orderId) != 1) {
//			return false;
//		}
		return true;
	}
	
	@Override
	public boolean insertPaymentInfo(String orderId, Integer amount, String payModule, String method) {
		Map<String, Object> params = new HashMap<>();
		params.put("orderId", orderId);
		params.put("amount", amount);
		params.put("moduleName", payModule);
		if (method.equals("VIRTUAL_ACCOUNT")) {
			params.put("status", "A"); // 토스 - 가상계좌
		} else {
			params.put("status", "S");
		}
		
		// NOTE : 결제 테이블의 deposit_name, deposit_bank, deposit_account는 추후에 환불받을 때 입금해야 하는 계좌이다.
		// 회원이 환불 신청할 때 작성하는 폼에서 받아와야 함
		params.put("deposit_name", null);
		params.put("deposit_bank", null);
		params.put("deposit_account", null);
		
		if (ses.insert(ns + "insertPaymentInfo", params) != 1) {
			return false;
		}
		return true;
	}
	
	@Override
	public void updateOrderStatus(String payMethod, String orderId) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("orderId", orderId);
		
		if (payMethod.equals("VIRTUAL_ACCOUNT")) {
			params.put("status", "1"); // 토스 - 가상계좌
		} else {
			params.put("status", "2");
		}
		ses.update(ns + "updateOrderStatus", params);
	}

	@Override
	public List<String> getOrderIdList(String memberId) {
		return ses.selectList(ns + "selectOrderId", memberId);
	}
	
	@Override
	public List<String> getOrderIdList(String name, String phoneNumber, String email) {
		Map<String, Object> params = new HashMap<>();
		params.put("name", name);
		params.put("phoneNumber", phoneNumber);
		params.put("email", email);
		return ses.selectList(ns + "selectOrderIdByNonMember", params);
	}

	@Override
	public Map<String, Object> getOrderInfo(String orderId) {
		return ses.selectOne(ns + "selectOrderInfo", orderId);
	}
	
	@Override
	public List<OrderProductDTO> getProductList(String orderId) {
		return ses.selectList(ns + "selectProductList", orderId);
	}

	@Override
	public int makeCancel(String orderId, List<ProductCancelRequestDTO> productRequestList, String cancelType, String cancelReason) {
		Map<String, Object> params = new HashMap<>();
		params.put("orderId", orderId);
		params.put("productRequestList", productRequestList);
		params.put("cancelType", cancelType);
		params.put("cancelReason", cancelReason);
		return ses.insert(ns + "insertCancel", params);
	}
	
	@Override
	public void updateAccountInfo(String orderId, String depositName, String depositBank, String depoistAccount) {
		Map<String, Object> params = new HashMap<>();
		params.put("orderId", orderId);
		params.put("depositName", depositName);
		params.put("depositBank", depositBank);
		params.put("depoistAccount", depoistAccount);
		ses.update(ns + "updateAccountInfo", params);
	}
	
	@Override
	public void updateOrderStatusAuto() {
		ses.update(ns + "updateOrderStatusAuto");
	}

}
