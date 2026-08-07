local t = {
	Unknown = "unknown",
	Profile = "profile",
	Chat = "chat",
	BuyRobux = "buyRobux",
	InExperience = "inExperience"
}
t.toEnumInteger = {
	[t.Unknown] = 0,
	[t.Profile] = 1,
	[t.Chat] = 2,
	[t.BuyRobux] = 3,
	[t.InExperience] = 4
}

return t