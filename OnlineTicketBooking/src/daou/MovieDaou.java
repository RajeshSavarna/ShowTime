package daou;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.MovieBean;
import connection.ConProvider;

public class MovieDaou {
	
	public int insert(MovieBean b)
	{
		int result = 0;
		java.sql.Date sqlDOB=Formatter.getSqlDate(b.getRelease_date());
		String sql = "insert into MOVIE_DETAIL(title, image, genre,	language, certificate, duration, cast, director, trailer_url, description, release_date, rating) values (?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			Connection con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, b.getTitle());
			ps.setString(2, b.getImage());
			ps.setString(3, b.getGenre());
			ps.setString(4, b.getLanguage());
			ps.setString(5, b.getCertificate());
			ps.setString(6, b.getDuration());
			ps.setString(7, b.getCast());
			ps.setString(8, b.getDirector());
			ps.setString(9, b.getTrailer_url());
			ps.setString(10, b.getDescription());
			ps.setDate(11, sqlDOB);
			ps.setString(12, b.getRating());
			
			result = ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public int update(MovieBean b)
	{
		int result = 0;
		java.sql.Date sqlDOB=Formatter.getSqlDate(b.getRelease_date());
		String sql = "update MOVIE_DETAIL set title=?,image=?,genre=?,language=?,certificate=?,duration=?,cast=?,director=?,trailer_url=?,description=?,release_date=?,rating=? where movie_id=?";
		try {
			Connection con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, b.getTitle());
			ps.setString(2, b.getImage());
			ps.setString(3, b.getGenre());
			ps.setString(4, b.getLanguage());
			ps.setString(5, b.getCertificate());
			ps.setString(6, b.getDuration());
			ps.setString(7, b.getCast());
			ps.setString(8, b.getDirector());
			ps.setString(9, b.getTrailer_url());
			ps.setString(10, b.getDescription());
			ps.setDate(11, sqlDOB);
			ps.setString(12, b.getRating());
			ps.setInt(13, Integer.parseInt(b.getMovie_id()));
			
			result = ps.executeUpdate();
			//System.out.println(result);
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteById(String movie_id)
	{
		int result = 0;
		String sql = "delete from MOVIE_DETAIL where movie_id=?";
		try {
			Connection con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, movie_id);
			
			result = ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public int deleteByName(String title)
	{
		int result = 0;
		String sql = "delete from MOVIE_DETAIL where title=?";
		try {
			Connection con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, title);
			
			result = ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<MovieBean> getAllMovieRecords()
	{
		List<MovieBean> list = new ArrayList<MovieBean>();
		
		String sql = "select * from MOVIE_DETAIL";
		try {
			Connection con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next())
			{
				MovieBean b = new MovieBean();
				b.setMovie_id(rs.getString(1));
				b.setTitle(rs.getString(2));
				b.setImage(rs.getString(3));
				b.setGenre(rs.getString(4));
				b.setLanguage(rs.getString(5));
				b.setCertificate(rs.getString(6));
				b.setDuration(rs.getString(7));
				b.setCast(rs.getString(8));
				b.setDirector(rs.getString(9));
				b.setTrailer_url(rs.getString(10));
				b.setDescription(rs.getString(11));
				b.setRelease_date(rs.getDate(12).toString());
				b.setRating(rs.getString(13));
			
				list.add(b);
			}
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	public List<MovieBean> getMovieRecordsByLanguage(String language)
	{
		List<MovieBean> list = new ArrayList<MovieBean>();
		String sql = "select * from MOVIE_DETAIL where language=?";
		try {
			Connection con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, language);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				MovieBean b = new MovieBean();
				b.setMovie_id(rs.getString(1));
				b.setTitle(rs.getString(2));
				b.setImage(rs.getString(3));
				b.setGenre(rs.getString(4));
				b.setLanguage(rs.getString(5));
				b.setCertificate(rs.getString(6));
				b.setDuration(rs.getString(7));
				b.setCast(rs.getString(8));
				b.setDirector(rs.getString(9));
				b.setTrailer_url(rs.getString(10));
				b.setDescription(rs.getString(11));
				b.setRelease_date(rs.getDate(12).toString());
				b.setRating(rs.getString(13));

				list.add(b);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public MovieBean getMovieRecordsById(String id)
	{
		MovieBean b = new MovieBean();
		String sql = "select * from MOVIE_DETAIL where movie_id=?";
		try {
			Connection con = ConProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				b.setMovie_id(rs.getString(1));
				b.setTitle(rs.getString(2));
				b.setImage(rs.getString(3));
				b.setGenre(rs.getString(4));
				b.setLanguage(rs.getString(5));
				b.setCertificate(rs.getString(6));
				b.setDuration(rs.getString(7));
				b.setCast(rs.getString(8));
				b.setDirector(rs.getString(9));
				b.setTrailer_url(rs.getString(10));
				b.setDescription(rs.getString(11));
				b.setRelease_date(rs.getDate(12).toString());
				b.setRating(rs.getString(13));

			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return b;
	}

}
