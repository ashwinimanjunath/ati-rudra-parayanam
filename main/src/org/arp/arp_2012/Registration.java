package org.arp.arp_2012;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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

	private Citizenship citizenship = Citizenship.INDIAN;

	private String emailAddress;

	private PhysicianStatus physicianStatus = null;

	private String physicalFitnessForm = null;

	private String spendTimeAtPN = "NO";

	private TripType tripType;

	private FlightLeg roundTrip = new FlightLeg();

	private List<FlightLeg> multiCityFlightLegs = new ArrayList<FlightLeg>();

	private String comments;

	private String phoneNumber;

	private String address;

	private String canChantNamakamFluently;
	private String canChantChamakamFluently;

	public final String getAddress() {
		return address;
	}

	public final String getCanChantChamakamFluently() {
		return canChantChamakamFluently;
	}

	public final String getCanChantNamakamFluently() {
		return canChantNamakamFluently;
	}

	public Citizenship getCitizenship() {
		return citizenship;
	}

	public final String getComments() {
		return comments;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
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

	public String getLastName() {
		return lastName;
	}

	public final List<FlightLeg> getMultiCityFlightLegs() {
		return multiCityFlightLegs;
	}

	public final String getPhoneNumber() {
		return phoneNumber;
	}

	public String getPhysicalFitnessForm() {
		return physicalFitnessForm;
	}

	public final PhysicianStatus getPhysicianStatus() {
		return physicianStatus;
	}

	public final FlightLeg getRoundTrip() {
		return roundTrip;
	}

	public String getSpendTimeAtPN() {
		return spendTimeAtPN;
	}

	public final TripType getTripType() {
		return tripType;
	}

	@JsonIgnore
	@XmlTransient
	public int getYearOfBirth() {
		if (!StringUtils.isBlank(dateOfBirth)) {
			try {
				final Date dob = new SimpleDateFormat("MM/dd/yyyy")
						.parse(dateOfBirth);
				final Calendar cal = Calendar.getInstance();
				cal.setTime(dob);
				return cal.get(Calendar.YEAR);
			} catch (ParseException e) {
				// Do nothing, illegal date entered
			}
		}
		return 0;
	}

	public final void setAddress(String address) {
		this.address = address;
	}

	public final void setCanChantChamakamFluently(
			String canChantChamakamFluently) {
		this.canChantChamakamFluently = canChantChamakamFluently;
	}

	public final void setCanChantNamakamFluently(String canChantNamakamFluently) {
		this.canChantNamakamFluently = canChantNamakamFluently;
	}

	public void setCitizenship(final Citizenship citizenship) {
		this.citizenship = citizenship;
	}

	public final void setComments(String comments) {
		this.comments = comments;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
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

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public final void setMultiCityFlightLegs(List<FlightLeg> multiCityFlightLegs) {
		this.multiCityFlightLegs = multiCityFlightLegs;
	}

	public final void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public void setPhysicalFitnessForm(String physicalFitnessForm) {
		this.physicalFitnessForm = physicalFitnessForm;
	}

	public final void setPhysicianStatus(PhysicianStatus physicianStatus) {
		this.physicianStatus = physicianStatus;
	}

	public final void setRoundTrip(FlightLeg roundTrip) {
		this.roundTrip = roundTrip;
	}

	public void setSpendTimeAtPN(String spendTimeAtPN) {
		this.spendTimeAtPN = spendTimeAtPN;
	}

	public final void setTripType(TripType tripType) {
		this.tripType = tripType;
	}
}
