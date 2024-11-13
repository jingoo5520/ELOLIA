package com.finalProject.persistence.admin;

import java.sql.Timestamp;
import java.util.List;

import com.finalProject.model.admin.GenderCountDTO;
import com.finalProject.model.admin.LevelCountDTO;

public interface AdminDAO {

	// 회원 총 수 가져오기
	int selectAllMemberCnt() throws Exception;

	// 지난 달 회원 총 수 가져오기
	int selectLastMonthMemberRegCnt() throws Exception;

	// 성별 별 회원 수 가져오기
	List<GenderCountDTO> selectMembersByGender() throws Exception;
	
	// 레벨 별 회원 수 가져오기
	List<LevelCountDTO> selectMembersByLevel() throws Exception;

	// 가입 회원 수 가져오기
	int selectMemberRegCnt(Timestamp time) throws Exception;

	// 총 매출 가져오기
	int getTotalSales() throws Exception;

	// 대기상태인 문의 수 가져오기
	int selectWaitInquiryCnt() throws Exception;

	// 특정 날 판매 량
	int selectDaySaleCnt(Timestamp time) throws Exception;

	// 특정 날 매출
	int selectDayRevenue(Timestamp time) throws Exception;

	// 기간에 따른 가입자 수 가져오기
	int selectRangedMemberRegCnt(Timestamp regDate_start, Timestamp regDate_end) throws Exception;

}
