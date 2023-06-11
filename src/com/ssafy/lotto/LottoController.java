package com.ssafy.lotto;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafy.lotto.dao.LottoDao;
import com.ssafy.lotto.dto.Lotto;

@WebServlet("/lotto")
public class LottoController extends HttpServlet {

	private LottoDao dao = LottoDao.getInstance();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action == null || "".equals(action)) {
			action = "main";
		}

		try {
			if ("main".equals(action)) {
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			} else if ("regist".equals(action)) {
				doRegist(request, response);
				response.sendRedirect(request.getContextPath() + "/lotto?action=main");
			} else if ("result".equals(action)) {
				doResult(request, response);
				request.getRequestDispatcher("/result.jsp").forward(request, response);
			} else if ("clear".equals(action)) {
				String key = request.getParameter("key");
				String validate = "dlrjtdmschrlghkfldzmdlqslek";

				if (!validate.equals(key)) {
					return;
				}
				
				dao.clearAll();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void doResult(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		List<Lotto> list = dao.findAll();
		request.setAttribute("list", list);
	}

	private void doRegist(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		Lotto lotto = new Lotto();
		lotto.setTeam(request.getParameter("team"));
		lotto.setNum1(Integer.parseInt(request.getParameter("num1")));
		lotto.setNum2(Integer.parseInt(request.getParameter("num2")));
		lotto.setNum3(Integer.parseInt(request.getParameter("num3")));
		lotto.setNum4(Integer.parseInt(request.getParameter("num4")));
		lotto.setNum5(Integer.parseInt(request.getParameter("num5")));
		lotto.setNum6(Integer.parseInt(request.getParameter("num6")));

		dao.insert(lotto);
	}
}
