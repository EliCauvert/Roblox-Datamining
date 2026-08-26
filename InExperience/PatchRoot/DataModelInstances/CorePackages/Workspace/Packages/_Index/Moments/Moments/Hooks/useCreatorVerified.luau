local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local userProfileModule = require(parent.DataHydration.UserProfile)
local useSignalState = require(parent.SignalsReact).useSignalState

return function(p1)
	-- upvalues: reactModule (ref), userProfileModule (ref), useSignalState (ref)
	local var1 = useSignalState(reactModule.useMemo(function()
		-- upvalues: userProfileModule (copy), p1 (ref)
		return userProfileModule.getAndFetchUserInfo(p1).info
	end, { p1 }))
	
	return if var1 == nil then false else var1.hasVerifiedBadge
end