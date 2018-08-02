package daou;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import bean.BookingBean;
import bean.ShowBean;
import connection.ConProvider;

public class ShowDaou {
	public int insert(ShowBean b)
	{
		int result=0;
		Timestamp sqlTimestamp=Formatter.getsqlTimestamp(b.getShow_date());
		String sql = "insert into SHOW_DETAIL(movie_id,theatre_id,show_date,price,booked_seat) values (?,?,?,?,?)";
		Connection con = ConProvider.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, b.getMovie_id());
			ps.setString(2, b.getTheatre_id());
			ps.setTimestamp(3,sqlTimestamp);
			ps.setString(4, b.getPrice());
			ps.setString(5, "allSeat");
			
			result = ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<String> getShowRecordsByQuery(String sql)
	{
		List<String> list = new ArrayList<String>();
		Connection con = null;
		try {
			con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				String str = new String();
				str = rs.getString(1);
				list.add(str);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{

			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		//System.out.println("Query = "+ sql);
		return list;
	}

	public String getShowIdByQuery(String sql)
	{
		String str = new String();
		Connection con = null;
		try {
			con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				str = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		//System.out.println("Show Id = "+str+" \n"+ sql);
		return str;
	}

	/*
	public String getBookedSeat(String show_id)
	{
		String booked_seat = "";
		String sql = "select booked_seat from SHOW_DETAIL where show_id = ?";
		Connection con = null;
		try {
			con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, show_id);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next())
				booked_seat = rs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{

			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return booked_seat;
	}
	*/

	public int updateBookedSeat(String show_id, String booked_seat)
	{
		int result = 0;
		Connection con = ConProvider.getConnection();
		String sql = "update SHOW_DETAIL set BOOKED_SEAT = ? || BOOKED_SEAT  where SHOW_ID = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, booked_seat);
			ps.setString(2, show_id);
			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public ShowBean getShowRecordById(String id)
	{
		ShowBean b = new ShowBean();
		String sql = "select show_id, movie_id, theatre_id, TO_CHAR(show_date, 'DD MON HH12:MI AM'), booked_seat, price from SHOW_DETAIL where show_id=?";
		try {
			Connection con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				b.setShow_id(rs.getString(1));
				b.setMovie_id(rs.getString(2));
				b.setTheatre_id(rs.getString(3));
				b.setShow_date(rs.getString(4));
				b.setBooked_seat(rs.getString(5));
				b.setPrice(rs.getString(6));
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return b;
	}
	
	
	public BookingBean getCompleteShowRecordsById(String id)
	{
		BookingBean b = new BookingBean();
		String sql = "SELECT sd.show_id, TO_CHAR(sd.show_date, 'DD MON YYYY'), sd.price, md.title, md.language, md.certificate, td.name, td.address, td.city, td.state, TO_CHAR(sd.show_date, 'HH12:MI AM') FROM SHOW_DETAIL sd INNER JOIN THEATRE_DETAIL td ON td.theatre_id = sd.theatre_id INNER JOIN MOVIE_DETAIL md ON md.movie_id = sd.movie_id where sd.show_id = ? ";
		try {
			Connection con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				b.setShow_id(rs.getString(1));
				b.setShow_date(rs.getString(2));
				b.setPrice(rs.getString(3));
				b.setMovie_name(rs.getString(4));
				b.setLanguage(rs.getString(5));
				b.setCertificate(rs.getString(6));
				b.setTheatre_name(rs.getString(7));
				b.setAddress(rs.getString(8));
				b.setCity(rs.getString(9));
				b.setState(rs.getString(10));
				b.setShow_time(rs.getString(11));
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return b;
	}
	
	public List<BookingBean> getCompleteShowRecords()
	{
		List<BookingBean> list = new ArrayList<BookingBean>();
		String sql = "SELECT sd.show_id, TO_CHAR(sd.show_date, 'DD MON YYYY'), sd.price, md.title, md.language, md.certificate, td.name, td.address, td.city, td.state, TO_CHAR(sd.show_date, 'HH12:MI AM'), sd.booked_seat, md.movie_id, td.theatre_id FROM SHOW_DETAIL sd INNER JOIN THEATRE_DETAIL td ON td.theatre_id = sd.theatre_id INNER JOIN MOVIE_DETAIL md ON md.movie_id = sd.movie_id ";
		try {
			Connection con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				BookingBean b = new BookingBean();
				b.setShow_id(rs.getString(1));
				b.setShow_date(rs.getString(2));
				b.setPrice(rs.getString(3));
				b.setMovie_name(rs.getString(4));
				b.setLanguage(rs.getString(5));
				b.setCertificate(rs.getString(6));
				b.setTheatre_name(rs.getString(7));
				b.setAddress(rs.getString(8));
				b.setCity(rs.getString(9));
				b.setState(rs.getString(10));
				b.setShow_time(rs.getString(11));
				b.setSeat_number(rs.getString(12));
				b.setMovie_id(rs.getString(13));
				b.setTheatre_id(rs.getString(14));

				list.add(b);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int update(ShowBean b)
	{
		int result = 0;
		Timestamp sqlTimestamp=Formatter.getsqlTimestamp(b.getShow_date());
		String sql = "update SHOW_DETAIL set movie_id=?,theatre_id=?,show_date=?,price=? where show_id=?";
		try {
			Connection con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, b.getMovie_id());
			ps.setString(2, b.getTheatre_id());
			ps.setTimestamp(3,sqlTimestamp);
			ps.setString(4, b.getPrice());
			ps.setString(5, b.getShow_id());
			
			result = ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteById(String show_id)
	{
		int result = 0;
		String sql = "delete from SHOW_DETAIL where show_id=?";
		try {
			Connection con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, show_id);
			
			result = ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public String getShowingMovieId()
	{
		String str = "";
		String sql = "SELECT DISTINCT movie_id from SHOW_DETAIL";
		Connection con = null;
		try {
			con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				str = str + " " +rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return str;
	}

	public List<BookingBean> getAllMovieAndTheatre()
	{
		List<BookingBean> list = new ArrayList<BookingBean>();
		String sql = "select movie_id, title, 0 as theatre_id, '' as name from movie_detail UNION select 0 as movie_id, '' as title, theatre_id, name from theatre_detail";
		try {
			Connection con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				BookingBean b = new BookingBean();
				b.setMovie_id(rs.getString(1));
				b.setMovie_name(rs.getString(2));
				b.setTheatre_id(rs.getString(3));
				b.setTheatre_name(rs.getString(4));
				list.add(b);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}