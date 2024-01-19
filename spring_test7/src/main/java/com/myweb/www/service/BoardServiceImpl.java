package com.myweb.www.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.www.domain.BoardDTO;
import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.FileVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.repository.BoardDAO;
import com.myweb.www.repository.FileDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
@RequiredArgsConstructor

public class BoardServiceImpl implements BoardService{
	
	private final BoardDAO bdao;
	private final FileDAO fdao;

	@Override
	public int insert(BoardDTO bdto) {
		log.info("insert check1");
		int isOk = bdao.insert(bdto.getBvo());
		if(bdto.getFlist() == null) {
			return isOk;
		}
		
		if(isOk > 0 && bdto.getFlist().size() > 0) {
			long bno = bdao.selectOneBno();
			for(FileVO fvo: bdto.getFlist()) {
				fvo.setBno(bno);
				isOk *= fdao.insertFile(fvo);
			}
		}
		return isOk;
	}

	@Override
	public List<BoardVO> getList(PagingVO pgvo) {
		bdao.updateCommentCount();
		bdao.updateFileCount();
		return bdao.getList(pgvo);
	}

	@Override
	public int read(int bno) {
		return bdao.readCountUpdate(bno);
	}

	@Transactional
	@Override
	public BoardDTO getdetail(int bno) {
		BoardVO bvo = bdao.getdetail(bno);
		List<FileVO> flist = fdao.getFileList(bno);
		BoardDTO bdto = new BoardDTO(bvo, flist);
		return bdto;
	}

	@Override
	public int getTotalCount(PagingVO pgvo) {
		return bdao.getTotalCount(pgvo);
	}

	@Transactional
	@Override
	public int update(BoardDTO bdto) {
		log.info("update check1");
		int isOk = bdao.update(bdto.getBvo());
		if(bdto.getFlist() == null) {
			return isOk;
		}
		
		//bvo insert 후 파일도 있다면..
		if(isOk > 0 && bdto.getFlist().size() > 0) {
			//bno setting
			for(FileVO fvo: bdto.getFlist()) {
				fvo.setBno(bdto.getBvo().getBno());
				isOk *= fdao.insertFile(fvo);
			}
		}
		return isOk;
	}

	@Override
	public void remove(long bno) {
		bdao.remove(bno);
		
	}

	@Override
	public int delFile(String uuid) {
		
		return fdao.delete(uuid);
	}



}	
