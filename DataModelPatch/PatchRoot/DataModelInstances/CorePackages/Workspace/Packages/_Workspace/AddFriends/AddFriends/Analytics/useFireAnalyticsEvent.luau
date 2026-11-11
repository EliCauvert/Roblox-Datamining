local AddFriends = script:FindFirstAncestor("AddFriends")
local Parent = AddFriends.Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local CryoModule = require(Parent.Cryo)
local RECOMMENDATIONSESSIONIDKEY = require(AddFriends.Common.Constants).RECOMMENDATION_SESSION_ID_KEY
local GetSessionIdByKeyFunction = require(Parent.AddFriendsState).RoduxAnalytics.Selectors.getSessionIdByKey
local AnalyticsSetupModule = require(script.Parent.AnalyticsSetup)

return function(p1)
	-- upvalues: UseSelectorFunction (copy), GetSessionIdByKeyFunction (copy), RECOMMENDATIONSESSIONIDKEY (copy), ReactModule (copy), AnalyticsSetupModule (copy), CryoModule (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: GetSessionIdByKeyFunction (upval), RECOMMENDATIONSESSIONIDKEY (upval)
		return GetSessionIdByKeyFunction(p2)(RECOMMENDATIONSESSIONIDKEY)
	end)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: AnalyticsSetupModule (upval), UseSelectorResult (copy)
		return AnalyticsSetupModule({
			infoForAllEvents = { recommendationSessionId = UseSelectorResult }
		}).fireAnalyticsEvent
	end, { UseSelectorResult })
	
	return ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseMemoResult (copy), CryoModule (upval), p1 (copy)
		return UseMemoResult(p2, CryoModule.Dictionary.join(p3 or {}, p1 or {}))
	end, { p1 })
end