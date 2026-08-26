local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local fFlagProfilePlatformEnableCurrencyTransfer = require(parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer

return function()
	-- upvalues: useAppPolicy (ref), fFlagProfilePlatformEnableCurrencyTransfer (ref)
	return useAppPolicy(function(p1)
		-- upvalues: fFlagProfilePlatformEnableCurrencyTransfer (copy)
		return if fFlagProfilePlatformEnableCurrencyTransfer then p1.getCanRenderTransferOnProfile() else false
	end)
end