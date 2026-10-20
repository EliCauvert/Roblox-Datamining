return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Rodux).makeActionCreator(script.Name, function(AccountPinUnlockedUntil)
	assert(AccountPinUnlockedUntil == nil or typeof(AccountPinUnlockedUntil) == "DateTime", "Expected the passed unlock time must be a valid `DateTime` or nil")
	
	return { accountPinUnlockedUntil = AccountPinUnlockedUntil }
end)