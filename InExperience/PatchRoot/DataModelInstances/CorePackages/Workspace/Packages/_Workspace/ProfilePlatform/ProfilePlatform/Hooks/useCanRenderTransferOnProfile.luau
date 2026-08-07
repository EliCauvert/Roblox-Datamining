local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local fFlagProfilePlatformEnableCurrencyTransfer = require(parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer

return function() --[[ line: 9 ]]
	-- upvalues: useAppPolicy (ref), fFlagProfilePlatformEnableCurrencyTransfer (ref)
	return useAppPolicy(function(p0) --[[ line: 10 ]]
		-- upvalues: fFlagProfilePlatformEnableCurrencyTransfer (copy)
		return if fFlagProfilePlatformEnableCurrencyTransfer then p0.getCanRenderTransferOnProfile() else false
	end)
end