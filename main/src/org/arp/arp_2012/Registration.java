package org.arp.arp_2012;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.annotate.JsonIgnore;

@XmlRootElement
public final class Registration {

	private String firstName;

	private String lastName;

	private Gender gender;

	private String dateOfBirth;

	private ImmigrationStatus immigrationStatus = ImmigrationStatus.US_GC;

	private String cityOfDeparture;

	private String dateOfDeparture = "06/21/2012";

	private String cityOfArrival = "Tribhuvan International Airport (KTM, Kathmandu, Nepal)";

	private String emailAddress;

	private String physicalFitnessForm = null;

	public String getCityOfArrival() {
		return cityOfArrival;
	}

	public String getCityOfDeparture() {
		return cityOfDeparture;
	}

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

	public String getPhysicalFitnessForm() {
		return physicalFitnessForm;
	}

	public void setCityOfArrival(String portOfArrival) {
		this.cityOfArrival = portOfArrival;
	}

	public void setCityOfDeparture(String portOfDeparture) {
		this.cityOfDeparture = portOfDeparture;
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

	public void setPhysicalFitnessForm(String physicalFitnessForm) {
		this.physicalFitnessForm = physicalFitnessForm;
	}

	@JsonIgnore
	@XmlTransient
	public int getYearOfBirth() {
		if (!StringUtils.isBlank(dateOfBirth)) {
			try {
				final Date dob = new SimpleDateFormat("MM/dd/yyyy").parse(dateOfBirth);
				final Calendar cal = Calendar.getInstance();
				cal.setTime(dob);
				return cal.get(Calendar.YEAR);
			} catch (ParseException e) {
				//Do nothing, illegal date entered
			}
		}
		return 0;
	}
}
