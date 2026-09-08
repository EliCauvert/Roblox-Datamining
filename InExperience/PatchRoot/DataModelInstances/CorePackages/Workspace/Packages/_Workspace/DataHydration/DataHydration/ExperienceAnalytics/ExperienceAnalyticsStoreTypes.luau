return {
	MetricId = {
		DailyActiveUsers = "DailyActiveUsers",
		TotalPlayTimeHours = "TotalPlayTimeHours",
		RFYPlayThroughRate = "RFYPlayThroughRate",
		ForwardD1Retention = "ForwardD1Retention",
		PayingUsersCVR = "PayingUsersCVR",
		AverageRevenuePerPayingUser = "AverageRevenuePerPayingUser",
		UniqueUsersWithPlaySessions = "UniqueUsersWithPlaySessions"
	},
	MetricGranularity = {
		OneMinute = "OneMinute",
		HalfHour = "HalfHour",
		OneHour = "OneHour",
		OneDay = "OneDay",
		OneWeek = "OneWeek",
		OneMonth = "OneMonth",
		None = "None"
	},
	DataStatus = require(script:FindFirstAncestor("DataHydration").DataHydrationTypes).DataStatus
}