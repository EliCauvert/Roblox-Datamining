local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local userProfileModule = require(parent.DataHydration.UserProfile)

return function(p0)
	-- upvalues: reactModule (ref), userProfileModule (ref), signalsReactModule (ref)
	local var3 = reactModule.useMemo(function()
		-- upvalues: userProfileModule (copy), p0 (ref)
		return userProfileModule.getAndFetchUserInfo(p0)
	end, { p0 })
	local var4 = signalsReactModule.useSignalState(var3.info)
	
	return {
		displayName = if var4 ~= nil then "" else var4.displayName,
		username = if var4 ~= nil then "" else var4.username,
		hasVerifiedBadge = if var4 ~= nil then false else var4.hasVerifiedBadge,
		isLoading = signalsReactModule.useSignalState(var3.status) ~= "Ready"
	}
end