package com.board.cotroller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.domain.BoardVO;
import com.board.domain.Page;
import com.board.service.BoardService;
import com.member.domain.MemberVO;

@Controller
@RequestMapping("/board/")
public class BoardController {

	@Inject
	BoardService service;

	// 게시물 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(HttpSession session, Model model) throws Exception {
		MemberVO login = (MemberVO) session.getAttribute("member");

		List<BoardVO> list = null;
		list = service.list();

		model.addAttribute("list", list);
		model.addAttribute("login", login);

	}

	// 게시물 작성 GET
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite(HttpSession session, Model model) throws Exception {
		
		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login == null) {
			model.addAttribute("msg", "login_error");
		} else {
			model.addAttribute("login", login);
		}
	}

	// 게시물 작성 POST
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(BoardVO vo, HttpSession session) throws Exception {
		service.write(vo);
		return "redirect:/board/listPage?num=1";
	}

	// 게시물 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("no") int no, Model model,HttpSession session) throws Exception {
		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login == null) {
			model.addAttribute("msg", false);
		} else {
			model.addAttribute("login", login);
		}
		service.view(no);
		BoardVO vo = service.view(no);
		model.addAttribute("view", vo);
	}

	// 게시물 수정 GET
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("no") int no, Model model,HttpSession session) throws Exception {
		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login == null) {
			model.addAttribute("msg", false);
		} else {
			model.addAttribute("login", login);
		}
		BoardVO vo = service.view(no);
		model.addAttribute("view", vo);
	}

	// 게시물 수정 POST
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(BoardVO vo) throws Exception {
		service.modify(vo);

		return "redirect:/board/view?no=" + vo.getNo();
	}

	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("no") int no) throws Exception {
		service.delete(no);
		return "redirect:/board/listPage?num=1";
	}

	// 게시물 목록 + 페이징
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num, HttpSession session) throws Exception {
		
		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login == null) {
			model.addAttribute("msg", false);
		} else {
			model.addAttribute("login", login);
		}
		
		Page page = new Page();

		page.setNum(num);
		page.setCount(service.count());

		List<BoardVO> list = null;
		list = service.listPage(page.getDisplayPost(), page.getPostNum());

		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);

		/*
		 * model.addAttribute("pageNum", page.getPageNum());
		 * 
		 * model.addAttribute("startPageNum",page.getStartPagenum());
		 * model.addAttribute("endPageNum",page.getEndPageNum());
		 * 
		 * model.addAttribute("prev", page.getPrev()); model.addAttribute("getNext",
		 * page.getNext());
		 */

		/*
		 * // 게시물 총 갯수 int count = service.count(); // 한 페이지에 출력할 게시 글 갯수 int postNum =
		 * 10; // 하단 페이징 번호 ([게시물 총 갯수 / 한 페이지에 출력할 갯수 ]) int pageNum = (int)
		 * Math.ceil((double) count / postNum); // 출력할 게시물 int displayPost = (num - 1) *
		 * postNum;
		 * 
		 * // 한번에 표시할 페이징 번호의 갯수 int pageNum_cnt = 10;
		 * 
		 * // 표시되는 페이지 번호 중 마지막 번호 int endPageNum = (int) (Math.ceil((double) num /
		 * (double) pageNum_cnt) * pageNum_cnt);
		 * 
		 * // 표시되는 페이지 번호 중 첫번째 번호 int startPageNum = endPageNum - (pageNum_cnt - 1);
		 * 
		 * // 마지막 번호 재계산 int endPageNum_tmp = (int) (Math.ceil((double) count / (double)
		 * pageNum_cnt));
		 * 
		 * if (endPageNum > endPageNum_tmp) { endPageNum = endPageNum_tmp; }
		 * 
		 * boolean prev = startPageNum == 1 ? false : true; boolean next = endPageNum *
		 * pageNum_cnt >= count ? false : true;
		 * 
		 * 
		 * 
		 * // 시작, 끝 번호 model.addAttribute("startPageNum", startPageNum);
		 * model.addAttribute("endPageNum", endPageNum);
		 * 
		 * // 이전, 다음 model.addAttribute("prev", prev); model.addAttribute("next", next);
		 * 
		 * // 현재 페이지 model.addAttribute("select", num);
		 */
	}
}
