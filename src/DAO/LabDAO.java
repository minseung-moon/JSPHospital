package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DBConn.DBConn;
import DTO.LabDTO;

public class LabDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	//insert into lab_test values('T001','결핵');
	public LabDAO() {
		con = DBConn.getConnection();
	}
	
	public ArrayList<LabDTO> selectAllLab() {
		ArrayList<LabDTO> dtos = new ArrayList<LabDTO>();
		
		try {
			sql = "select * from lab_test";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				LabDTO dto = new LabDTO();
				dto.setCode(rs.getString(1));
				dto.setName(rs.getString(2));
				dtos.add(dto);
			}
		}catch(SQLException e) {
			System.out.println("erorr select lab");
		}
		
		return dtos;
	}
}
