package com.finalProject.model.review;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class ReviewPagingInfo {

    private int currentPage; // ���� ������ ��ȣ
    private int pageSize; // �� �������� ������ �Խù� ��
    
    private int totalPostCount; // ��ü �Խù� ��
    private int totalPages; // ��ü ������ ��
    private int startRowIndex; // ���� �ε��� (DB ��ȸ�� ���� ���� ��ġ)
    
    private int pageBlockSize = 10; // �� ������ ��Ͽ� ������ ������ �� (��: 10��������)
    private int currentBlock; // ���� �������� ���� ��� ��ȣ
    private int startPage; // ���� ����� ���� ������ ��ȣ
    private int endPage; // ���� ����� �� ������ ��ȣ
    
    public ReviewPagingInfo(ReviewPagingInfoDTO dto, int totalPostCount) {
        this.currentPage = dto.getPageNo() > 0 ? dto.getPageNo() : 1; // �⺻��: 1
        this.pageSize = dto.getPageSize() > 0 ? dto.getPageSize() : 10; // �⺻��: 10
        this.totalPostCount = totalPostCount;
        
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
        this.totalPages = (int) Math.ceil((double) totalPostCount / pageSize);
    }

    private void setStartRowIndex() {
        this.startRowIndex = (currentPage - 1) * pageSize;
    }
    
    private void setCurrentBlock() {
        this.currentBlock = (currentPage + pageBlockSize - 1) / pageBlockSize;
    }
    
    private void setStartPage() {
        this.startPage = (currentBlock - 1) * pageBlockSize + 1;
        if (this.startPage < 1) {
            this.startPage = 1;
        }
    }

    private void setEndPage() {
        this.endPage = Math.min(this.startPage + pageBlockSize - 1, this.totalPages);
    }
    
    // ���� ����� ���� ����� �ִ��� ���� ��ȯ
    public boolean hasPrevBlock() {
        return this.currentBlock > 1;
    }

    // ���� ����� ���� ����� �ִ��� ���� ��ȯ
    public boolean hasNextBlock() {
        return this.endPage < this.totalPages;
    }
}
