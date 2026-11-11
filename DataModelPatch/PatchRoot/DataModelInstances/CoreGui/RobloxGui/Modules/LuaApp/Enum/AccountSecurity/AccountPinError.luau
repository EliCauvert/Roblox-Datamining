local AccountPinErrorModule = {
	Enum = require(game:GetService("CorePackages").Packages.enumerate)(script.Name, {
		Default = -1,
		NoAccountPin = 1,
		AccountLocked = 2,
		Flooded = 3,
		IncorrectPin = 4
	})
}
AccountPinErrorModule.valueToLocalizationKey = {
	[AccountPinErrorModule.Enum.Default] = "Feature.AccountSecurityPrompt.Message.Error.Pin.Default",
	[AccountPinErrorModule.Enum.NoAccountPin] = "Feature.AccountSecurityPrompt.Message.Error.Pin.NoAccountPin",
	[AccountPinErrorModule.Enum.AccountLocked] = "Feature.AccountSecurityPrompt.Message.Error.Pin.AccountLocked",
	[AccountPinErrorModule.Enum.Flooded] = "Feature.AccountSecurityPrompt.Message.Error.Pin.Flooded",
	[AccountPinErrorModule.Enum.IncorrectPin] = "Feature.AccountSecurityPrompt.Message.Error.Pin.IncorrectPin"
}
AccountPinErrorModule.localizationKeys = {}

for _, value in pairs(AccountPinErrorModule.valueToLocalizationKey) do
	AccountPinErrorModule.localizationKeys[value] = value
end
function AccountPinErrorModule.toString(p1, p2)
	-- upvalues: AccountPinErrorModule (copy)
	return p1[AccountPinErrorModule.valueToLocalizationKey[p2] or AccountPinErrorModule.valueToLocalizationKey[AccountPinErrorModule.Enum.Default]]
end

return AccountPinErrorModule