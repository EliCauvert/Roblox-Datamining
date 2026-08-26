local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local userProfileModule = require(parent.DataHydration.UserProfile)

return function(p1)
	-- upvalues: reactModule (ref), userProfileModule (ref), signalsReactModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: userProfileModule (copy), p1 (ref)
		return userProfileModule.getAndFetchUserInfo(p1)
	end, { p1 })
	local var2 = signalsReactModule.useSignalState(var1.info)
	
	return {
		displayName = if var2 ~= nil then "" else var2.displayName,
		username = if var2 ~= nil then "" else var2.username,
		hasVerifiedBadge = if var2 ~= nil then false else var2.hasVerifiedBadge,
		isLoading = signalsReactModule.useSignalState(var1.status) ~= "Ready"
	}
end