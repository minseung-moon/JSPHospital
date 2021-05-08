package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import DBConn.DBConn;
import DTO.ResultDTO;

public class ResultDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	//insert into result values('1001','T001','2020-01-01','1','2020-01-02','X');
	public ResultDAO() {
		con = DBConn.getConnection();
	}
	
	public boolean insertResult(ResultDTO dto) {
		boolean check = false;
		DateFormat before = new SimpleDateFormat("yyyyMMdd");
		DateFormat after = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		
		try {
			sql = "insert into result values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getNo());
			pstmt.setString(2, dto.getCode());
			date = before.parse(dto.getSdate());
			String sdate = after.format(date);
			pstmt.setString(3, sdate);
			pstmt.setString(4, dto.getStatus());
			date = before.parse(dto.getLdate());
			String ldate = after.format(date);
			pstmt.setString(5, ldate);
			pstmt.setString(6, dto.getResult());
			
			check = pstmt.executeUpdate()==1?true:false;
		}catch(SQLException e){
			System.out.println("error insert Reult");
		}catch(ParseException e){
			System.out.println("error date");
		}
		
		return check;
	}
	
	public ArrayList<ResultDTO> selectAllResult() {
		ArrayList<ResultDTO> dtos = new ArrayList<ResultDTO>();
		DateFormat before = new SimpleDateFormat("yyyyMMdd");
		DateFormat after = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		
		try {
			sql = "select p.no, p.name, l.name, r.sdate, r.status, r.ldate, r.result  from result r inner join patient p on r.no = p.no inner join lab_test l on l.code = r.code order by p.no asc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ResultDTO dto = new ResultDTO();
				dto.setNo(rs.getString(1));
				dto.setP_name(rs.getString(2));
				dto.setL_name(rs.getString(3));
				date = before.parse(rs.getString(4));
				String sdate = after.format(date);
				dto.setSdate(sdate);
				dto.setStatus(rs.getString(5).equals("1")?"검사중":"검사완료");
				date = before.parse(rs.getString(6));
				String ldate = after.format(date);
				dto.setLdate(ldate);
				String result = "";
				switch (rs.getString(7)) {
					case "X": result="미입력"; break;
					case "P": result="양성"; break;
					case "N": result="음성"; break;
					default: result=""; break;
				}
				dto.setResult(result);
				dtos.add(dto);
			}
		}catch (SQLException e) {
			System.out.println("error select result");
		}catch(ParseException e) {
			System.out.println("error date");
		}
		return dtos;
	}
	
	public ArrayList<ResultDTO> selectCityResult() {
		ArrayList<ResultDTO> dtos = new ArrayList<ResultDTO>();
		
		try {
			sql = "select p.city, case when(p.city = '10') then '서울' when(p.city = '20') then '경기' when(p.city = '30') then '강원' when(p.city = '40') then '대구'end, count(*) from result r inner join patient p on p.no = r.no group by p.city order by p.city asc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ResultDTO dto = new ResultDTO();
				dto.setCode(rs.getString(1));
				dto.setCity(rs.getString(2));
				dto.setResultCount(rs.getString(3));
				dtos.add(dto);
			}
		}catch (SQLException e) {
			System.out.println("error select result");
		}
		return dtos;
	}
}
