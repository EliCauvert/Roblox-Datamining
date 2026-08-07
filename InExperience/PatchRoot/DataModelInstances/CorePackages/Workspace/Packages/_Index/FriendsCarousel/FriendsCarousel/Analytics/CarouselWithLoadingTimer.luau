local parent = script:FindFirstAncestor("FriendsCarousel").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useLoadingTimers = require(parent.SocialLuaAnalytics).Analytics.Timing.useLoadingTimers
local retrievalStatus = UIBloxModule.App.Loading.Enum.RetrievalStatus
local analyticsSetupModule = require(script.Parent.AnalyticsSetup)
local eventNamesModule = require(script.Parent.EventNames)
local UILoadingEventsModule = require(script.Parent.UILoadingEvents)

return function(p0) --[[ line: 27 | named "CarouselWithLoadingTimer" ]]
	-- upvalues: useLocalUserId (ref), useLoadingTimers (ref), reactModule (ref), analyticsSetupModule (ref), eventNamesModule (ref), retrievalStatus (ref), UILoadingEventsModule (ref)
	local var5 = useLocalUserId()
	local var6 = useLoadingTimers({})
	local var7 = reactModule.useRef({})
	local var8 = reactModule.useMemo(function() --[[ line: 32 ]]
		-- upvalues: analyticsSetupModule (copy), var5 (ref)
		return analyticsSetupModule({
			infoForAllEvents = { uid = if var5 then tostring(var5) else nil }
		})
	end, { var5 })
	reactModule.useEffect(function() --[[ line: 40 ]]
		-- upvalues: var6 (ref)
		var6.start("carouselLoadingTime")
	end, {})
	
	local var9 = function(p1, p2) --[[ line: 44 ]]
		-- upvalues: var8 (ref), eventNamesModule (copy), retrievalStatus (copy)
		var8.fireAnalyticsEvent(eventNamesModule.FriendsCarouselUILoadingTime, {
			loadingTime = if p2 and typeof(p2) == "number" and p2 >= 0 then p2 else 0,
			fetch = p1,
			status = retrievalStatus.Done.rawValue()
		})
	end
	
	return p0.renderComponent({
		onSuccessfulRender = function(p3) --[[ line: 57 ]]
			-- upvalues: var7 (ref), UILoadingEventsModule (copy), var6 (ref), var9 (ref)
			if var7.current[UILoadingEventsModule.EmptyHint] or var7.current[`{UILoadingEventsModule.EmptyHint}{UILoadingEventsModule.ExperimentSuffix}`] then return end
			if p3 and not var7.current[p3] then
				var7.current[p3] = true
				var9(p3, var6.getTime("carouselLoadingTime"))
				
				return
			end
		end
	})
end