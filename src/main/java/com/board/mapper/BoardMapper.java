package com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.board.domain.BoardVO;

@Repository
public interface BoardMapper {
	public List<BoardVO> list() throws Exception;
}