package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.PagingVO;

public interface BoardDAO {

	int insert(BoardVO bvo);

	List<BoardVO> getList(PagingVO pgvo);

	BoardVO getdetail(int bno);

	int update(BoardVO bvo);

	void remove(long bno);

	int readCountUpdate(int bno);

	int getTotalCount(PagingVO pgvo);

	long selectOneBno();

	void updateCommentCount();

	void updateFileCount();

	
}
