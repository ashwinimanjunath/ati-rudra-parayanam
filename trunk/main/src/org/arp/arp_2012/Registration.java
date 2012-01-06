package org.arp.arp_2012;

public final class Registration {

	private String firstName;

	private String lastName;

	private Gender gender;

	private String dateOfBirth;

	private ImmigrationStatus immigrationStatus = ImmigrationStatus.US_GC;

	private String cityOfDeparture;

	private String dateOfDeparture = "06/21/2012";

	private String cityOfArrival;

	private String emailAddress;

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public String getDateOfDeparture() {
		return dateOfDeparture;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public String getFirstName() {
		return firstName;
	}

	public Gender getGender() {
		return gender;
	}

	public ImmigrationStatus getImmigrationStatus() {
		return immigrationStatus;
	}

	public String getLastName() {
		return lastName;
	}

	public String getCityOfArrival() {
		return cityOfArrival;
	}

	public String getCityOfDeparture() {
		return cityOfDeparture;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public void setDateOfDeparture(String dateOfDeparture) {
		this.dateOfDeparture = dateOfDeparture;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public void setImmigrationStatus(final ImmigrationStatus immigrationStatus) {
		this.immigrationStatus = immigrationStatus;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setCityOfArrival(String portOfArrival) {
		this.cityOfArrival = portOfArrival;
	}

	public void setCityOfDeparture(String portOfDeparture) {
		this.cityOfDeparture = portOfDeparture;
	}
}
