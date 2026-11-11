local PasswordErrorModule = {
	Enum = require(game:GetService("CorePackages").Packages.enumerate)(script.Name, {
		Default = -1,
		Flooded = 2,
		InvalidPassword = 7,
		InvalidCurrentPassword = 8,
		PinLocked = 9
	})
}
PasswordErrorModule.valueToLocalizationKey = {
	[PasswordErrorModule.Enum.Default] = "Feature.AccountSecurityPrompt.Message.Error.Password.Default",
	[PasswordErrorModule.Enum.Flooded] = "Feature.AccountSecurityPrompt.Message.Error.Password.Flooded",
	[PasswordErrorModule.Enum.InvalidPassword] = "Feature.AccountSecurityPrompt.Message.Error.Password.InvalidPassword",
	[PasswordErrorModule.Enum.InvalidCurrentPassword] = "Feature.AccountSecurityPrompt.Message.Error.Password.InvalidCurrentPassword",
	[PasswordErrorModule.Enum.PinLocked] = "Feature.AccountSecurityPrompt.Message.Error.Password.PinLocked"
}
PasswordErrorModule.localizationKeys = {}

for _, value in pairs(PasswordErrorModule.valueToLocalizationKey) do
	PasswordErrorModule.localizationKeys[value] = value
end
function PasswordErrorModule.toString(p1, p2)
	-- upvalues: PasswordErrorModule (copy)
	return p1[PasswordErrorModule.valueToLocalizationKey[p2] or PasswordErrorModule.valueToLocalizationKey[PasswordErrorModule.Enum.Default]]
end

return PasswordErrorModule