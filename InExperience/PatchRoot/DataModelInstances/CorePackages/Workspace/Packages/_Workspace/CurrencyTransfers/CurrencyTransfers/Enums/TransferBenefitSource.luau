local TransferBenefitSourceModule = { Free = "Free", RobloxSubscription = "RobloxSubscription" }
local config = {
	[1] = TransferBenefitSourceModule.RobloxSubscription,
	[2] = TransferBenefitSourceModule.Free
}
local config1 = {
	robloxsubscription = TransferBenefitSourceModule.RobloxSubscription,
	free = TransferBenefitSourceModule.Free
}

function TransferBenefitSourceModule.fromValue(Text: string)
	-- upvalues: config (copy), config1 (copy)
	return if type(Text) == "number" then config[Text] elseif type(Text) == "string" then config1[string.lower(Text)] else nil
end

return TransferBenefitSourceModule