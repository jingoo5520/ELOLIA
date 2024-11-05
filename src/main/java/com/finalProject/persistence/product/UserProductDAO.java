package com.finalProject.persistence.product;

import java.util.List;
import java.util.Map;
import com.finalProject.model.product.ProductDTO;

public interface UserProductDAO {
    
    // ��ǰ ���
    List<ProductDTO> selectProductsByPage(int offset, int pageSize) throws Exception;

    // ���������̼�
    int selectProductCount() throws Exception;

    // ī�װ� ��ȣ�� ���� ��ǰ �� ��ȸ
    int selectProductCountByCategory(Map<String, Object> params) throws Exception;
    
    // ī�װ� ��ȣ�� �������� ���� ��ǰ ��ȸ
    List<ProductDTO> selectProductsByCategoryAndPage(Map<String, Object> params) throws Exception;

    List<ProductDTO> getProductById(int productId) throws Exception;

    ProductDTO getProductDetailById(int productId) throws Exception;

    // �� �Խù� �� ��ȸ
    int countSearchResult(String search, Integer category) throws Exception;

    // �˻��� ��ǰ ��ȸ
    List<ProductDTO> searchProducts(String search, Integer category, int startRowIndex, int pageSize, String sortOrder);
}
