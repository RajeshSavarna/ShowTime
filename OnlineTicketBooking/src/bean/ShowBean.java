package bean;

public class ShowBean {
	String show_id, movie_id, theatre_id, show_date, booked_seat, price;

	public String getShow_id() {
		return show_id;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public void setShow_id(String show_id) {
		this.show_id = show_id;
	}

	public String getMovie_id() {
		return movie_id;
	}

	public void setMovie_id(String movie_id) {
		this.movie_id = movie_id;
	}

	public String getTheatre_id() {
		return theatre_id;
	}

	public void setTheatre_id(String theatre_id) {
		this.theatre_id = theatre_id;
	}

	public String getShow_date() {
		return show_date;
	}

	public void setShow_date(String show_date) {
		this.show_date = show_date;
	}

	public String getBooked_seat() {
		return booked_seat;
	}

	public void setBooked_seat(String booked_seat) {
		this.booked_seat = booked_seat;
	}

}
