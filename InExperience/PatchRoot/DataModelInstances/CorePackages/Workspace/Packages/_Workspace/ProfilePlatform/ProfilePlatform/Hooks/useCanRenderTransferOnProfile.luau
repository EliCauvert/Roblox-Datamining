local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local FFlagProfilePlatformEnableCurrencyTransfer = require(Parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer

return function() --[[ Line: 9 ]]
	-- upvalues: UseAppPolicyFunction (copy), FFlagProfilePlatformEnableCurrencyTransfer (copy)
	return UseAppPolicyFunction(function(p1) --[[ Line: 10 ]]
		-- upvalues: FFlagProfilePlatformEnableCurrencyTransfer (upval)
		return if FFlagProfilePlatformEnableCurrencyTransfer then p1.getCanRenderTransferOnProfile() else false
	end)
end