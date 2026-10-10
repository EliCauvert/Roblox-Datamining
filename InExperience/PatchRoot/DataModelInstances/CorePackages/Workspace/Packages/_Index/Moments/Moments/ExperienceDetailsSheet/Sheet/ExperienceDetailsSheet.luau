local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local useSignalState = require(parent.SignalsReact).useSignalState
local inExperienceDetailsPromptContainerModule = require(parent.InExperienceDetailsPrompt.InExperienceDetailsPromptContainer)
local getExperienceDetailsSheetStoreModule = require(script.Parent.getExperienceDetailsSheetStore)
local useHideTabBarWhileOpenModule = require(script.Parent.useHideTabBarWhileOpen)
local useJoinExperienceModule = require(moments.ExperienceDetailsSheet.Join.useJoinExperience)
local fFlagMomentsFixRecommendationImpressionLifecycleModule = require(moments.Flags.FFlagMomentsFixRecommendationImpressionLifecycle)
local fFlagMomentsTabsBehindModalScrimModule = require(moments.Flags.FFlagMomentsTabsBehindModalScrim)
local fFlagMomentsNavigationEventModule = require(moments.Flags.FFlagMomentsNavigationEvent)
local fFlagMomentsPlayEventModule = require(moments.Flags.FFlagMomentsPlayEvent)
local navigationDestinationTypeModule = require(moments.Enums.NavigationDestinationType)
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local fireAnalyticsEvent = analytics.fireAnalyticsEvent

return reactModule.memo(function()
	-- upvalues: getExperienceDetailsSheetStoreModule (ref), useSignalState (ref), useJoinExperienceModule (ref), fFlagMomentsTabsBehindModalScrimModule (ref), useHideTabBarWhileOpenModule (ref), reactModule (ref), fireAnalyticsEvent (ref), eventNames (ref), analytics (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (ref), fFlagMomentsNavigationEventModule (ref), navigationDestinationTypeModule (ref), fFlagMomentsPlayEventModule (ref), inExperienceDetailsPromptContainerModule (ref)
	local var1 = getExperienceDetailsSheetStoreModule(false)
	local var2 = useSignalState(var1.getIsOpen)
	local var3 = useSignalState(var1.getContext)
	local var4 = useJoinExperienceModule()
	
	if not fFlagMomentsTabsBehindModalScrimModule then
		useHideTabBarWhileOpenModule(var2)
	end
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var3 (ref), fireAnalyticsEvent (copy), eventNames (copy), analytics (copy)
		if var2 and var3 then
			if var3.feedItemId ~= nil and var3.feedItemId ~= "" then
				fireAnalyticsEvent(eventNames.ExperienceDetailsOpened, {
					feedItemId = var3.feedItemId,
					feedSessionId = var3.tracingId or "",
					placeId = tostring(var3.placeId),
					universeId = tostring(var3.universeId)
				})
				
				return
			end
			analytics.reportMomentSkip("feed_action", if var3.feedItemId == nil then "nil" else "empty", { action = "edp" })
		end
	end, { var2, var3 })
	
	return if var2 and var3 ~= nil then reactModule.createElement(inExperienceDetailsPromptContainerModule, {
		universeId = tostring(var3.universeId),
		onClose = var1.close,
		onJoin = reactModule.useCallback(function(p1)
			-- upvalues: var3 (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (copy), fFlagMomentsNavigationEventModule (copy), navigationDestinationTypeModule (copy), var4 (ref), fFlagMomentsPlayEventModule (copy), var1 (ref)
			if var3 then
				var4(var3, p1, if fFlagMomentsPlayEventModule then if fFlagMomentsFixRecommendationImpressionLifecycleModule and var3.onBeforeJoin ~= nil then var3.onBeforeJoin(if fFlagMomentsNavigationEventModule then navigationDestinationTypeModule.ExperienceJoin else nil) else nil else nil)
			end
			var1.close()
		end, { var4, var3, var1.close })
	}) else nil
end)