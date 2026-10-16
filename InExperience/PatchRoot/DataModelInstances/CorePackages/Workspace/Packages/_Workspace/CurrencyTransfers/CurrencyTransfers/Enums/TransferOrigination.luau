local TransferOriginationModule = {
	Unknown = "unknown",
	Profile = "profile",
	Chat = "chat",
	BuyRobux = "buyRobux",
	InExperience = "inExperience"
}
TransferOriginationModule.toEnumInteger = {
	[TransferOriginationModule.Unknown] = 0,
	[TransferOriginationModule.Profile] = 1,
	[TransferOriginationModule.Chat] = 2,
	[TransferOriginationModule.BuyRobux] = 3,
	[TransferOriginationModule.InExperience] = 4
}

return TransferOriginationModule