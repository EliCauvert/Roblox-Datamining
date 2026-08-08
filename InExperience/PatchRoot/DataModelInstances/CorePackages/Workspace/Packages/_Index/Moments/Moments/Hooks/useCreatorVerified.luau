local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local userProfileModule = require(parent.DataHydration.UserProfile)
local useSignalState = require(parent.SignalsReact).useSignalState

return function(p0) --[[ line: 24 ]]
	-- upvalues: reactModule (ref), userProfileModule (ref), useSignalState (ref)
	local var2 = useSignalState(reactModule.useMemo(function() --[[ line: 25 ]]
		-- upvalues: userProfileModule (copy), p0 (ref)
		return userProfileModule.getAndFetchUserInfo(p0).info
	end, { p0 }))
	
	return if var2 == nil then false else var2.hasVerifiedBadge
end