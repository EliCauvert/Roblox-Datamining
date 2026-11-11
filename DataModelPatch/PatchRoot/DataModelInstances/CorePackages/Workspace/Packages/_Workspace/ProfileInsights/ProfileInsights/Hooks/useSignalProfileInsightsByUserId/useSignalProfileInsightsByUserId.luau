local ProfileInsights = script:FindFirstAncestor("ProfileInsights")
local Parent = ProfileInsights.Parent
local ProfileInsightsStoreModule = require(ProfileInsights["data-hydration"].ProfileInsightsStore)
local SignalsReactModule = require(Parent.SignalsReact)
local ReactModule = require(Parent.React)

return function(p1)
	-- upvalues: ProfileInsightsStoreModule (copy), SignalsReactModule (copy), ReactModule (copy)
	local ProfileInsightsByUserId = ProfileInsightsStoreModule(false).getProfileInsightsByUserId({
		userIds = { p1.userId },
		rankingStrategy = p1.rankingStrategy
	})
	local UseSignalStateResult = SignalsReactModule.useSignalState(ProfileInsightsByUserId(false).data.getProfileInsights)
	
	return ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult (copy), p1 (copy)
		for _, value in UseSignalStateResult do
			if value.targetUserId == p1.userId then
				return value
			end
		end
		return {}
	end, { UseSignalStateResult }), ProfileInsightsByUserId(false).status == "fetching"
end