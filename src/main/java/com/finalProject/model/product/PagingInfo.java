package com.finalProject.model.product;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PagingInfo {

    private int currentPage; // ���� ������ ��ȣ (����: pageNo)
    private int pageSize; // �� �������� ������ �Խù� �� (����: viewPostCntPerPage)
    
    private int totalProductCount; // ��ü �Խù� �� (����: totalPostCnt)
    private int totalPages; // ��ü ������ �� (����: totalPageCnt)
    private int startRowIndex; // ���� �ε��� (DB ��ȸ�� ���� ���� ��ġ)
    
    private int pageBlockSize = 10; // �� ������ ��Ͽ� ������ ������ �� (��: 10��������)
    private int currentBlock; // ���� �������� ���� ��� ��ȣ (����: pageBlockNoCurPage)
    private int startPage; // ���� ����� ���� ������ ��ȣ (����: startPageNoCurBlock)
    private int endPage; // ���� ����� �� ������ ��ȣ (����: endPageNoCurBlock)
    
    public PagingInfo(PagingInfoDTO dto, int totalProductCount) {
        this.currentPage = dto.getPageNo();
        this.pageSize = dto.getPageSize();
        this.totalProductCount = totalProductCount;
        
        // ��ü ������ �� ���
        setTotalPages();
        // ���� �ε��� ���
        setStartRowIndex();
        // ���� �������� ���� ��� ��ȣ ���
        setCurrentBlock();
        // ���� ����� ���� ������ ��ȣ ���
        setStartPage();
        // ���� ����� �� ������ ��ȣ ���
        setEndPage();
    }
    
    private void setTotalPages() {
        this.totalPages = (this.totalProductCount + this.pageSize - 1) / this.pageSize;
    }

    private void setStartRowIndex() {
        this.startRowIndex = (this.currentPage - 1) * this.pageSize;
    }
    
    private void setCurrentBlock() {
        this.currentBlock = (this.currentPage + this.pageBlockSize - 1) / this.pageBlockSize;
    }
    
    private void setStartPage() {
        this.startPage = (this.currentBlock - 1) * this.pageBlockSize + 1;
        if (this.startPage < 1) {
            this.startPage = 1;
        }
    }

    private void setEndPage() {
        this.endPage = Math.min(this.startPage + this.pageBlockSize - 1, this.totalPages);
    }
}