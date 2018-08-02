package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.BookingBean;
import daou.BookingDaou;
import daou.ShowDaou;


@WebServlet("/UpdateBookedSeat")
public class UpdateBookedSeat extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UpdateBookedSeat() {
        super();
    }
    PrintWriter out = null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		out=response.getWriter();
		String show_id = request.getParameter("show_id");
		String booked_seat = request.getParameter("selected_seat");
		ShowDaou d = new ShowDaou();
		if (d.updateBookedSeat(show_id, booked_seat) != 0){
			
			BookingBean b = d.getCompleteShowRecordsById(show_id);
			
			int seatCount = (booked_seat.split(" ")).length;
			//System.out.println("UpdateBookedSeat page: "+seatCount);
			int seatCost = seatCount*Integer.parseInt(b.getPrice());
			int tax = seatCount*18;
			int total_cost = seatCost+tax;
			b.setSeat_number(booked_seat);
			b.setSeat_qty(String.valueOf(seatCount));
			b.setT_cost(String.valueOf(seatCost));
			b.setTax(String.valueOf(tax));
			b.setTotal_cost(String.valueOf(total_cost));
			HttpSession session=request.getSession();
			b.setCustomer_email((String)session.getAttribute("email"));
			b.setContact((String)session.getAttribute("contact"));
			
			BookingDaou daou = new BookingDaou();
			if ( daou.insert(b) != 0 )
				System.out.print("All Okey");
			else{
				System.out.print("Error in booking confirmation");
			}
			//out.print("Seats Selected Successfully Proceed To Pay");
			//request.getRequestDispatcher("index.jsp").include(request, response);
		}
		else
		{
			out.print("Error Occured: Please try again");
		}
		out.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
