package com.ssafy.lotto.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ssafy.lotto.dto.Lotto;
import com.ssafy.util.DBUtil;

public class LottoDao {

	private static LottoDao instance = new LottoDao();
	private DBUtil dbUtil;

	private LottoDao() {
		dbUtil = DBUtil.getInstance();
	}

	public static LottoDao getInstance() {
		return instance;
	}

	public void insert(Lotto lotto) throws SQLException {
		try (Connection con = dbUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"insert into raffle(team, num1, num2, num3, num4, num5, num6) values (?, ?, ?, ?, ?, ?, ?)");) {
			int idx = 0;
			pstmt.setString(++idx, lotto.getTeam());
			pstmt.setInt(++idx, lotto.getNum1());
			pstmt.setInt(++idx, lotto.getNum2());
			pstmt.setInt(++idx, lotto.getNum3());
			pstmt.setInt(++idx, lotto.getNum4());
			pstmt.setInt(++idx, lotto.getNum5());
			pstmt.setInt(++idx, lotto.getNum6());
			pstmt.executeUpdate();
		}
	}

	public List<Lotto> findAll() throws SQLException {

		try (Connection con = dbUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement("select * from raffle");) {
			ResultSet rs = pstmt.executeQuery();

			List<Lotto> list = new ArrayList<>();

			while (rs.next()) {
				Lotto lotto = new Lotto();
				lotto.setTeam(rs.getString("team"));
				lotto.setNum1(rs.getInt("num1"));
				lotto.setNum2(rs.getInt("num2"));
				lotto.setNum3(rs.getInt("num3"));
				lotto.setNum4(rs.getInt("num4"));
				lotto.setNum5(rs.getInt("num5"));
				lotto.setNum6(rs.getInt("num6"));
				list.add(lotto);
			}
			return list;
		}
	}

	public void clearAll() throws SQLException {
		try (Connection con = dbUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement("truncate `raffle`");) {
			pstmt.executeUpdate();
		}
	}
}