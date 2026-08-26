local parent = script:FindFirstAncestor("FriendsCarousel").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useLoadingTimers = require(parent.SocialLuaAnalytics).Analytics.Timing.useLoadingTimers
local retrievalStatus = UIBloxModule.App.Loading.Enum.RetrievalStatus
local analyticsSetupModule = require(script.Parent.AnalyticsSetup)
local eventNamesModule = require(script.Parent.EventNames)
local UILoadingEventsModule = require(script.Parent.UILoadingEvents)

return function(p1)
	-- upvalues: useLocalUserId (ref), useLoadingTimers (ref), reactModule (ref), analyticsSetupModule (ref), eventNamesModule (ref), retrievalStatus (ref), UILoadingEventsModule (ref)
	local var1 = useLocalUserId()
	local var2 = useLoadingTimers({})
	local var3 = reactModule.useRef({})
	local var4 = reactModule.useMemo(function()
		-- upvalues: analyticsSetupModule (copy), var1 (ref)
		return analyticsSetupModule({
			infoForAllEvents = { uid = if var1 then tostring(var1) else nil }
		})
	end, { var1 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		var2.start("carouselLoadingTime")
	end, {})
	
	local var5 = function(p2, p3)
		-- upvalues: var4 (ref), eventNamesModule (copy), retrievalStatus (copy)
		var4.fireAnalyticsEvent(eventNamesModule.FriendsCarouselUILoadingTime, {
			loadingTime = if p3 and typeof(p3) == "number" and p3 >= 0 then p3 else 0,
			fetch = p2,
			status = retrievalStatus.Done.rawValue()
		})
	end
	
	return p1.renderComponent({
		onSuccessfulRender = function(p2)
			-- upvalues: var3 (ref), UILoadingEventsModule (copy), var2 (ref), var5 (ref)
			if var3.current[UILoadingEventsModule.EmptyHint] or var3.current[`{UILoadingEventsModule.EmptyHint}{UILoadingEventsModule.ExperimentSuffix}`] then return end
			if p2 and not var3.current[p2] then
				var3.current[p2] = true
				var5(p2, var2.getTime("carouselLoadingTime"))
				
				return
			end
		end
	})
end