package daou;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.TheatreBean;
import connection.ConProvider;

public class TheatreDaou {
	public int insert(TheatreBean b)
	{
		int result=0;
		String sql = "insert into THEATRE_DETAIL(name,address,city,state,contact_person,contact_number) values (?,?,?,?,?,?)";
		Connection con = ConProvider.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, b.getName());
			ps.setString(2, b.getAddress());
			ps.setString(3, b.getCity());
			ps.setString(4, b.getState());
			ps.setString(5, b.getContact_person());
			ps.setString(6, b.getContact_number());
			
			result = ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int update(TheatreBean b)
	{
		int result = 0;
		String sql = "update THEATRE_DETAIL set name=?,address=?,city=?,state=?,contact_person=?,contact_number=? where theatre_id=?";
		try {
			Connection con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, b.getName());
			ps.setString(2, b.getAddress());
			ps.setString(3, b.getCity());
			ps.setString(4, b.getState());
			ps.setString(5, b.getContact_person());
			ps.setString(6, b.getContact_number());
			//System.out.println(b.getTheatre_id());
			ps.setInt(7, Integer.parseInt(b.getTheatre_id()));
			
			result = ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteById(String theatre_id)
	{
		int result = 0;
		String sql = "delete from THEATRE_DETAIL where theatre_id=?";
		try {
			Connection con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, theatre_id);
			
			result = ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<TheatreBean> getAllTheatreRecords()
	{
		List<TheatreBean> list = new ArrayList<TheatreBean>();
		
		String sql = "select * from THEATRE_DETAIL";
		try {
			Connection con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next())
			{
				TheatreBean b = new TheatreBean();
				b.setTheatre_id(rs.getString(1));
				b.setName(rs.getString(2));
				b.setAddress(rs.getString(3));
				b.setCity(rs.getString(4));
				b.setState(rs.getString(5));
				b.setContact_person(rs.getString(6));
				b.setContact_number(rs.getString(7));
			
				list.add(b);
			}
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}