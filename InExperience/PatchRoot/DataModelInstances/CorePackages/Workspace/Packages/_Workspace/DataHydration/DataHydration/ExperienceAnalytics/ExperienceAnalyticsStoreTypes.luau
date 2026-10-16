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
	FilterOperation = {
		Contains = "Contains",
		NotContains = "NotContains",
		GreaterThan = "GreaterThan",
		GreaterThanOrEqual = "GreaterThanOrEqual",
		LessThan = "LessThan",
		LessThanOrEqual = "LessThanOrEqual",
		Match = "Match",
		Equals = "Equals",
		NotEqual = "NotEqual"
	},
	DataStatus = require(script:FindFirstAncestor("DataHydration").DataHydrationTypes).DataStatus
}