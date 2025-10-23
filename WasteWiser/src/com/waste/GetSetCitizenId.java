package com.waste;

public class GetSetCitizenId {
	public static int citizenId;

	

	public static int getCitizenId() {
		return citizenId;
	}

	public static void setCitizenId(int citizenId) {
		GetSetCitizenId.citizenId = citizenId;
	}
	
	@Override
	public String toString() {
		return "GetSetCitizenId [getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}

}
