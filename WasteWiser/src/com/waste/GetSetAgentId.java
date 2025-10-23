package com.waste;

public class GetSetAgentId {
	public static int AgentId;

	public static int getAgentId() {
		return AgentId;
	}

	public static void setAgentId(int agentId) {
		AgentId = agentId;
	}

	@Override
	public String toString() {
		return "GetSetAgentId [getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	

}
