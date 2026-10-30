return {
	MetricId = {
		DailyActiveUsers = "DailyActiveUsers",
		TotalPlayTimeHours = "TotalPlayTimeHours",
		RFYPlayThroughRate = "RFYPlayThroughRate",
		ForwardD1Retention = "ForwardD1Retention",
		PayingUsersCVR = "PayingUsersCVR",
		AverageRevenuePerPayingUser = "AverageRevenuePerPayingUser",
		UniqueUsersWithPlaySessions = "UniqueUsersWithPlaySessions",
		TotalSessionsEndedInBucket = "TotalSessionsEndedInBucket",
		FunnelUserChurnRate = "FunnelUserChurnRate",
		AveragePlayTimeMinutesPerDAU = "AveragePlayTimeMinutesPerDAU",
		ForwardD7Retention = "ForwardD7Retention",
		DailyRevenue = "DailyRevenue"
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
	ResourceType = {
		Universe = "RESOURCE_TYPE_UNIVERSE",
		Creator = "RESOURCE_TYPE_CREATOR",
		Group = "RESOURCE_TYPE_GROUP",
		Organization = "RESOURCE_TYPE_ORGANIZATION",
		AdAccount = "RESOURCE_TYPE_AD_ACCOUNT_ID"
	},
	DataStatus = require(script:FindFirstAncestor("DataHydration").DataHydrationTypes).DataStatus
}