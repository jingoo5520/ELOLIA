package com.finalProject.model.review;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
@Getter
@Setter
@ToString
public class ReviewPagingInfoDTO {
    private int pageNo;          // ���� ������ ��ȣ
    private int pageSize;        // �������� �Խù� ��
    private int totalPostCnt;    // ��ü �Խù� ��

    public ReviewPagingInfoDTO(int pageNo, int pageSize) {
        this.pageNo = pageNo > 0 ? pageNo : 1;  // ������ ��ȣ�� 1���� ������ �⺻�� 1 ����
        this.pageSize = pageSize > 0 ? pageSize : 10;  // ������ ũ�Ⱑ 0���� ������ �⺻�� 10 ����
    }

    // ��ü �Խù� ���� �����ϰ� ��ü ������ ���� ���
    public void setTotalPostCnt(int totalPostCnt) {
        this.totalPostCnt = totalPostCnt;
    }
}
