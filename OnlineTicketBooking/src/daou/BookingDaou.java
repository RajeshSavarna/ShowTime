package daou;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.BookingBean;
import connection.ConProvider;

public class BookingDaou {
	public int insert(BookingBean b)
	{
		int result = 0;
		java.sql.Timestamp sqlTimeStampCurrentDate = Formatter.getCurrentDateTimeStamp();
		java.sql.Timestamp sqlTimestamp = Formatter.getsqlTimestamp(b.getShow_date()+" "+b.getShow_time());
		String sql = "insert into BOOKING_DETAIL(order_date, movie_name, language, certificate, theatre_name, city, address, state, show_id, show_date, price, seat_number, seat_qty, tax, t_cost, total_cost, customer_email, contact) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			Connection con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setTimestamp(1, sqlTimeStampCurrentDate);
			ps.setString(2, b.getMovie_name());
			ps.setString(3, b.getLanguage());
			ps.setString(4, b.getCertificate());
			ps.setString(5, b.getTheatre_name());
			ps.setString(6, b.getCity());
			ps.setString(7, b.getAddress());
			ps.setString(8, b.getState());
			ps.setString(9, b.getShow_id());
			ps.setTimestamp(10, sqlTimestamp);
			ps.setString(11, b.getPrice());
			ps.setString(12, b.getSeat_number());
			ps.setString(13, b.getSeat_qty());
			ps.setString(14, b.getTax());
			ps.setString(15, b.getT_cost());
			ps.setString(16, b.getTotal_cost());
			ps.setString(17, b.getCustomer_email());
			ps.setString(18, b.getContact());
			
			result = ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public BookingBean getBookingRecordById(String selected_seat, String show_id)
	{
		BookingBean b = new BookingBean();
		String sql = "SELECT booking_id, TO_CHAR(order_date, 'DD MON YYYY HH12:MI AM'), movie_name, language, certificate, theatre_name, city, address, state, show_id, TO_CHAR(show_date, 'DD MON YYYY'), TO_CHAR(show_date, 'HH12:MI AM'), price, seat_number, seat_qty, tax, t_cost, total_cost, customer_email, contact from BOOKING_DETAIL where seat_number=? AND show_id=?";
		try {
			Connection con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, selected_seat);
			ps.setString(2, show_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				b.setBooking_id(rs.getString(1));
				b.setOrder_date(rs.getString(2));
				b.setMovie_name(rs.getString(3));
				b.setLanguage(rs.getString(4));
				b.setCertificate(rs.getString(5));
				b.setTheatre_name(rs.getString(6));
				b.setCity(rs.getString(7));
				b.setAddress(rs.getString(8));
				b.setState(rs.getString(9));
				b.setShow_id(rs.getString(10));
				b.setShow_date(rs.getString(11));
				b.setShow_time(rs.getString(12));
				b.setPrice(rs.getString(13));
				b.setSeat_number(rs.getString(14));
				b.setSeat_qty(rs.getString(15));
				b.setTax(rs.getString(16));
				b.setT_cost(rs.getString(17));
				b.setTotal_cost(rs.getString(18));
				b.setCustomer_email(rs.getString(19));
				b.setContact(rs.getString(20));
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return b;
	}
	
	public List<BookingBean> getAllBookingRecords()
	{
		List<BookingBean> list = new ArrayList<BookingBean>();
		
		String sql = "SELECT booking_id, TO_CHAR(order_date, 'DD MON YYYY HH12:MI AM'), movie_name, language, certificate, theatre_name, city, address, state, show_id, TO_CHAR(show_date, 'DD MON YYYY'), TO_CHAR(show_date, 'HH12:MI AM'), price, seat_number, seat_qty, tax, t_cost, total_cost, customer_email, contact from BOOKING_DETAIL";
		try {
			Connection con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next())
			{
				BookingBean b = new BookingBean();
				b.setBooking_id(rs.getString(1));
				b.setOrder_date(rs.getString(2));
				b.setMovie_name(rs.getString(3));
				b.setLanguage(rs.getString(4));
				b.setCertificate(rs.getString(5));
				b.setTheatre_name(rs.getString(6));
				b.setCity(rs.getString(7));
				b.setAddress(rs.getString(8));
				b.setState(rs.getString(9));
				b.setShow_id(rs.getString(10));
				b.setShow_date(rs.getString(11));
				b.setShow_time(rs.getString(12));
				b.setPrice(rs.getString(13));
				b.setSeat_number(rs.getString(14));
				b.setSeat_qty(rs.getString(15));
				b.setTax(rs.getString(16));
				b.setT_cost(rs.getString(17));
				b.setTotal_cost(rs.getString(18));
				b.setCustomer_email(rs.getString(19));
				b.setContact(rs.getString(20));
			
				list.add(b);
			}
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public BookingBean getBookingRecordByEmail(String email)
	{
		BookingBean b = new BookingBean();
		String sql = "SELECT booking_id, TO_CHAR(order_date, 'DD MON YYYY HH12:MI AM'), movie_name, language, certificate, theatre_name, city, address, state, show_id, TO_CHAR(show_date, 'DD MON YYYY'), TO_CHAR(show_date, 'HH12:MI AM'), price, seat_number, seat_qty, tax, t_cost, total_cost, customer_email, contact from BOOKING_DETAIL where customer_email=?";
		try {
			Connection con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				b.setBooking_id(rs.getString(1));
				b.setOrder_date(rs.getString(2));
				b.setMovie_name(rs.getString(3));
				b.setLanguage(rs.getString(4));
				b.setCertificate(rs.getString(5));
				b.setTheatre_name(rs.getString(6));
				b.setCity(rs.getString(7));
				b.setAddress(rs.getString(8));
				b.setState(rs.getString(9));
				b.setShow_id(rs.getString(10));
				b.setShow_date(rs.getString(11));
				b.setShow_time(rs.getString(12));
				b.setPrice(rs.getString(13));
				b.setSeat_number(rs.getString(14));
				b.setSeat_qty(rs.getString(15));
				b.setTax(rs.getString(16));
				b.setT_cost(rs.getString(17));
				b.setTotal_cost(rs.getString(18));
				b.setCustomer_email(rs.getString(19));
				b.setContact(rs.getString(20));
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return b;
	}
	
	public ResultSet getBookingRecordsByEmail(String email)
	{
		//BookingBean b = new BookingBean();
		ResultSet rs = null;
		String sql = "SELECT booking_id, TO_CHAR(order_date, 'DD MON YYYY HH12:MI AM'), movie_name, language, certificate, theatre_name, city, address, state, show_id, TO_CHAR(show_date, 'DD MON YYYY'), TO_CHAR(show_date, 'HH12:MI AM'), price, seat_number, seat_qty, tax, t_cost, total_cost, customer_email, contact from BOOKING_DETAIL where customer_email=?";
		try {
			Connection con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			/*while (rs.next())
			{
				b.setBooking_id(rs.getString(1));
				b.setOrder_date(rs.getString(2));
				b.setMovie_name(rs.getString(3));
				b.setLanguage(rs.getString(4));
				b.setCertificate(rs.getString(5));
				b.setTheatre_name(rs.getString(6));
				b.setCity(rs.getString(7));
				b.setAddress(rs.getString(8));
				b.setState(rs.getString(9));
				b.setShow_id(rs.getString(10));
				b.setShow_date(rs.getString(11));
				b.setShow_time(rs.getString(12));
				b.setPrice(rs.getString(13));
				b.setSeat_number(rs.getString(14));
				b.setSeat_qty(rs.getString(15));
				b.setTax(rs.getString(16));
				b.setT_cost(rs.getString(17));
				b.setTotal_cost(rs.getString(18));
				b.setCustomer_email(rs.getString(19));
				b.setContact(rs.getString(20));
			}*/
			//con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
}
