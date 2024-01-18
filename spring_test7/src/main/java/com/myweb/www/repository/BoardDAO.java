package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.PagingVO;

public interface BoardDAO {

	int insert(BoardVO bvo);

	List<BoardVO> getList(PagingVO pgvo);

	int readCountUpdate(int bno);

	BoardVO getdetail(int bno);

	int getTotalCount(PagingVO pgvo);

	int update(BoardVO bvo);

	void remove(long bno);

	long selectOneBno();

}
