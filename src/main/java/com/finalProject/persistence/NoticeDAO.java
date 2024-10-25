package com.finalProject.persistence;

import java.util.List;

import com.finalProject.model.NoticeDTO;
import com.finalProject.model.NoticeVO;
import com.finalProject.model.PagingInfo;
import com.finalProject.model.PagingInfoDTO;
import com.finalProject.model.SearchCriteriaDTO;

public interface NoticeDAO {

	// 공지사항 목록 조회
	List<NoticeDTO> getAllNotices(int pagingSize, int startRowIndex) throws Exception;

	// 이벤트 목록 조회
	List<NoticeDTO> getAllEvents(int pagingSize, int startRowIndex) throws Exception;

	// 공지사항 저장
	void addNotice(NoticeVO notice) throws Exception;

	// 이벤트 저장
	void addEvent(NoticeVO notice) throws Exception;

	// 공지사항 수정 조회
	NoticeDTO selectNoticeById(int noticeNo) throws Exception;

	// 이벤트 수정 조회
	NoticeDTO selectEventById(int noticeNo) throws Exception;

	// 공지사항 수정
	void updateNotice(NoticeDTO noticeDTO) throws Exception;

	// 이벤트 수정
	void updateEvent(NoticeDTO noticeDTO) throws Exception;

	// 공지사항 삭제
	void deleteNotice(int noticeNo) throws Exception;

	// 이벤트 삭제
	void deleteEvent(int noticeNo) throws Exception;

	// 전체 글(데이터) 수
	int getTotalPostCnt() throws Exception;
	
	// 페이지네이션이 적용된 공지 목록 조회
	List<NoticeDTO> getNoticesWithPagination(int offset, int limit) throws Exception;

	
	// 페이지네이션 -> 페이징
//	List<NoticeVO> selectAllBoard(PagingInfo pi) throws Exception;

	// 게시글 목록 조회 -> 검색어
//	List<NoticeVO> selectAllBoard(SearchCriteriaDTO searchCriteriaDTO) throws Exception;
	
	// 검색된 게시글 수
//	int getTotalPostCnt(SearchCriteriaDTO sc) throws Exception;
	
	// 페이징 + 검색어
//	List<NoticeVO> selectAllBoard(PagingInfo pi, SearchCriteriaDTO sc) throws Exception;
	





}
