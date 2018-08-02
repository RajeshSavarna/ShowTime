package daou;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.UserBean;
import connection.ConProvider;

public class UserDaou {
	
	public int insert(UserBean b)
	{
		int result=0;
		String sql = "insert into USER_DETAIL(name,gender,email,password,contact,address,city,state) values (?,?,?,?,?,?,?,?)";
		Connection con = ConProvider.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, b.getName());
			ps.setString(2, b.getGender());
			ps.setString(3, b.getEmail());
			ps.setString(4, b.getPassword());
			ps.setString(5, b.getContact());
			ps.setString(6, b.getAddress());
			ps.setString(7, b.getCity());
			ps.setString(8, b.getState());
			
			result = ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int update(UserBean b)
	{
		int result = 0;
		String sql = "update USER_DETAIL set name=?,gender=?,email=?,password=?,contact=?,address=?,city=?,state=? where user_id=?";
		try {
			Connection con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, b.getName());
			ps.setString(2, b.getGender());
			ps.setString(3, b.getEmail());
			ps.setString(4, b.getPassword());
			ps.setString(5, b.getContact());
			ps.setString(6, b.getAddress());
			ps.setString(7, b.getCity());
			ps.setString(8, b.getState());
			ps.setInt(9, Integer.parseInt(b.getUser_id()));
			
			result = ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ResultSet checkLogin(UserBean b)
	{
		//boolean result = false;
		ResultSet rs = null;
		String sql = "select * from USER_DETAIL where email=? and password=?";
		Connection con = ConProvider.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,b.getEmail());
			ps.setString(2,b.getPassword());
			
			rs=ps.executeQuery();
			//result=rs.next();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//return result;
		return rs;
	}
	
	public List<UserBean> getAllUserRecords()
	{
		List<UserBean> list = new ArrayList<UserBean>();
		
		String sql = "select * from USER_DETAIL";
		try {
			Connection con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next())
			{
				UserBean b = new UserBean();
				b.setUser_id(rs.getString(1));
				b.setName(rs.getString(2));
				b.setGender(rs.getString(3));
				b.setEmail(rs.getString(4));
				b.setPassword(rs.getString(5));
				b.setContact(rs.getString(6));
				b.setAddress(rs.getString(7));
				b.setCity(rs.getString(8));
				b.setState(rs.getString(9));
			
				list.add(b);
			}
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public UserBean getAllRecordsByEmail(String email)
	{
		UserBean b = new UserBean();
		String sql = "select * from USER_DETAIL where email=?";
		Connection con = ConProvider.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,email);			
			ResultSet rs=ps.executeQuery();
			//result=rs.next();
			while (rs.next())
			{
				b.setUser_id(rs.getString(1));
				b.setName(rs.getString(2));
				b.setGender(rs.getString(3));
				b.setEmail(rs.getString(4));
				b.setPassword(rs.getString(5));
				b.setContact(rs.getString(6));
				b.setAddress(rs.getString(7));
				b.setCity(rs.getString(8));
				b.setState(rs.getString(9));
			}
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return b;
	}
}