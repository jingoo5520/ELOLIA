package com.finalProject.service.product;

import java.util.List;

import com.finalProject.model.product.PagingInfo;
import com.finalProject.model.product.ProductDTO;

public interface UserProductService {

	// ��ǰ ���
	List<ProductDTO> getProductsByPage(int page, int pageSize) throws Exception;
	
	// ��ǰ�� ��������
	int getProductCount() throws Exception;

	// ī�װ��� ��ǰ ���
	List<ProductDTO> getProductsByCategoryAndPage(Integer category, int page, int pageSize, String sortOrder) throws Exception;

	// ī�װ��� ��ǰ �� �˻�
	int getProductCountByCategory(Integer category) throws Exception;

	List<ProductDTO> getProductInfo(int productId) throws Exception;

	// content �������� �޼���
	ProductDTO getProductDetailById(int productId) throws Exception;

	// �� �Խù� �� ��ȸ
	int countSearchResults(String search, Integer category) throws Exception;

	// �˻� ��� ��ȸ
	List<ProductDTO> searchProducts(String search, Integer category, PagingInfo pagingInfo, String sortOrder) throws Exception;
	
}
