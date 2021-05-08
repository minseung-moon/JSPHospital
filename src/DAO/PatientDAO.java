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
import DTO.PatientDTO;

public class PatientDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	// insert into patient values(pa_seq.nextval,'김환자','19850301','M','010','2222','0001','10');
	public PatientDAO() {
		con = DBConn.getConnection();
	}
	
	public ArrayList<PatientDTO> selectAllPatient() {
		ArrayList<PatientDTO> dtos = new ArrayList<PatientDTO>();
		DateFormat before = new SimpleDateFormat("yyyyMMdd");
		DateFormat after = new SimpleDateFormat("yyyy년MM월dd일");
		Date date = null;
		
		try {
			sql = "select * from patient order by no asc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PatientDTO dto = new PatientDTO();
				dto.setNo(rs.getString(1));
				dto.setName(rs.getString(2));
				date = before.parse(rs.getString(3));
				String birth = after.format(date);
				dto.setBirth(birth);
				dto.setGender(rs.getString(4).equals("M")?"남":"여");
				dto.setTel1(rs.getString(5));
				dto.setTel2(rs.getString(6));
				dto.setTel3(rs.getString(7));
				String city = "";
				switch (rs.getString(8)) {
					case "10": city="서울"; break;
					case "20": city="경기"; break;
					case "30": city="강원"; break;
					case "40": city="대구"; break;
					default: city = ""; break;
				}
				dto.setCity(city);
				
				dtos.add(dto);
			}
		}catch(SQLException e){
			System.out.println("error select patient");
		}catch(ParseException e){
			System.out.println("erorr format date");
		}
		
		return dtos;
	}
	
	public String getNumber() {
		String number = "";
		
		try {
			sql = "select no from patient order by no desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			int num = Integer.parseInt(rs.getString(1)) + 1;
			number = Integer.toString(num);
		}catch(SQLException e){
			System.out.println("error select patient");
		}
		
		return number;	
	}
}
