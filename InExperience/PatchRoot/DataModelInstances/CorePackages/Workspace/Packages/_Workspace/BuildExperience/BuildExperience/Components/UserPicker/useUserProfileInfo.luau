local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UserProfileModule = require(Parent.DataHydration.UserProfile)

return function(p1)
	-- upvalues: ReactModule (copy), UserProfileModule (copy), SignalsReactModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UserProfileModule (upval), p1 (copy)
		return UserProfileModule.getAndFetchUserInfo(p1)
	end, { p1 })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMemoResult.info)
	
	return {
		displayName = if UseSignalStateResult == nil then "" else UseSignalStateResult.displayName,
		username = if UseSignalStateResult == nil then "" else UseSignalStateResult.username,
		hasVerifiedBadge = UseSignalStateResult ~= nil and UseSignalStateResult.hasVerifiedBadge,
		isLoading = SignalsReactModule.useSignalState(UseMemoResult.status) ~= "Ready"
	}
end