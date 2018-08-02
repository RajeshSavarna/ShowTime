package daou;
import java.text.SimpleDateFormat;

public class Formatter {

	public static java.sql.Date getSqlDate(String strDate){
		java.sql.Date sqlDate=null;
		try{
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilDate=format.parse(strDate);
		sqlDate=new java.sql.Date(utilDate.getTime());
		}catch(Exception e){System.out.println(e);}
		return sqlDate;
	}
	public static java.sql.Timestamp getsqlTimestamp(String strDate){
		java.sql.Timestamp sqlTimestamp=null;
		try{
		SimpleDateFormat format=new SimpleDateFormat("dd MMMM yyyy hh:mm a");
		java.util.Date utilDate=format.parse(strDate);
		sqlTimestamp=new java.sql.Timestamp(utilDate.getTime());
		
		//System.out.println("String "+strDate);
		//System.out.println("utilDate "+utilDate);
		//System.out.println("sqlTimestamp "+sqlTimestamp);
		
		}catch(Exception e){System.out.println(e);}
		return sqlTimestamp;
	}
	
	public static java.sql.Date getCurrentDate(){
		java.sql.Date sqlCurrentDate=null;
		try{
			java.util.Date utilDate=java.util.Calendar.getInstance().getTime();
			sqlCurrentDate=new java.sql.Date(utilDate.getTime());
			
		}catch(Exception e){System.out.println(e);}
		return sqlCurrentDate;
	}
	public static java.sql.Timestamp getCurrentDateTimeStamp(){
		java.sql.Timestamp sqlTimeStampCurrentDate=null;
		try{
			java.util.Date utilDate=java.util.Calendar.getInstance().getTime();
			sqlTimeStampCurrentDate=new java.sql.Timestamp(utilDate.getTime());
			
		}catch(Exception e){System.out.println(e);}
		return sqlTimeStampCurrentDate;
	}
}
