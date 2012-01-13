package org.arp.arp_2012;

public final class FlightLeg {
	private String cityOfDeparture;

	private String dateOfDeparture = "06/21/2012";

	private String cityOfArrival = "Tribhuvan International Airport (KTM, Kathmandu, Nepal)";

	public final String getCityOfArrival() {
		return cityOfArrival;
	}

	public final String getCityOfDeparture() {
		return cityOfDeparture;
	}

	public final String getDateOfDeparture() {
		return dateOfDeparture;
	}

	public final void setCityOfArrival(String cityOfArrival) {
		this.cityOfArrival = cityOfArrival;
	}

	public final void setCityOfDeparture(String cityOfDeparture) {
		this.cityOfDeparture = cityOfDeparture;
	}

	public final void setDateOfDeparture(String dateOfDeparture) {
		this.dateOfDeparture = dateOfDeparture;
	}
}