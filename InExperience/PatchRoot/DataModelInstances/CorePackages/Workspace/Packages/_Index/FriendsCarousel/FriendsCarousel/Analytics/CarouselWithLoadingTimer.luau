local Parent = script:FindFirstAncestor("FriendsCarousel").Parent
local ReactModule = require(Parent.React)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseLoadingTimersFunction = require(Parent.SocialLuaAnalytics).Analytics.Timing.useLoadingTimers
local RetrievalStatus = require(Parent.UIBlox).App.Loading.Enum.RetrievalStatus
local AnalyticsSetupModule = require(script.Parent.AnalyticsSetup)
local EventNamesModule = require(script.Parent.EventNames)
local UILoadingEventsModule = require(script.Parent.UILoadingEvents)

return function(p1) --[[ Line: 27 | Named "CarouselWithLoadingTimer" ]]
	-- upvalues: UseLocalUserIdFunction (copy), UseLoadingTimersFunction (copy), ReactModule (copy), AnalyticsSetupModule (copy), EventNamesModule (copy), RetrievalStatus (copy), UILoadingEventsModule (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseLoadingTimersResult = UseLoadingTimersFunction({})
	local UseRefResult = ReactModule.useRef({})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 32 ]]
		-- upvalues: AnalyticsSetupModule (upval), UseLocalUserIdResult (copy)
		return AnalyticsSetupModule({
			infoForAllEvents = {
				uid = if UseLocalUserIdResult then tostring(UseLocalUserIdResult) else nil
			}
		})
	end, { UseLocalUserIdResult })
	ReactModule.useEffect(function() --[[ Line: 40 ]]
		-- upvalues: UseLoadingTimersResult (copy)
		UseLoadingTimersResult.start("carouselLoadingTime")
	end, {})
	
	local function v10(Fetch, CarouselLoadingTime: number) --[[ Line: 44 ]]
		-- upvalues: UseMemoResult (copy), EventNamesModule (upval), RetrievalStatus (upval)
		UseMemoResult.fireAnalyticsEvent(EventNamesModule.FriendsCarouselUILoadingTime, {
			loadingTime = if CarouselLoadingTime and typeof(CarouselLoadingTime) == "number" and CarouselLoadingTime >= 0 then CarouselLoadingTime else 0,
			fetch = Fetch,
			status = RetrievalStatus.Done.rawValue()
		})
	end
	
	return p1.renderComponent({
		onSuccessfulRender = function(Fetch) --[[ Line: 57 ]]
			-- upvalues: UseRefResult (copy), UILoadingEventsModule (upval), UseLoadingTimersResult (copy), v10 (copy)
			if UseRefResult.current[UILoadingEventsModule.EmptyHint] or UseRefResult.current[`{UILoadingEventsModule.EmptyHint}{UILoadingEventsModule.ExperimentSuffix}`] then return end
			if Fetch and not UseRefResult.current[Fetch] then
				UseRefResult.current[Fetch] = true
				v10(Fetch, (UseLoadingTimersResult.getTime("carouselLoadingTime")))
				
				return
			end
		end
	})
end