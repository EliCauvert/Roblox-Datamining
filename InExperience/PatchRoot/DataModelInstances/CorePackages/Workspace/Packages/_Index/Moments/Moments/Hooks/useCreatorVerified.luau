local Parent = script:FindFirstAncestor("Moments").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Signals)
local UserProfileModule = require(Parent.DataHydration.UserProfile)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState

return function(p1)
	-- upvalues: ReactModule (copy), UserProfileModule (copy), UseSignalStateFunction (copy)
	local UseSignalStateResult = UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: UserProfileModule (upval), p1 (copy)
		return UserProfileModule.getAndFetchUserInfo(p1).info
	end, { p1 })))
	
	return UseSignalStateResult ~= nil and UseSignalStateResult.hasVerifiedBadge
end