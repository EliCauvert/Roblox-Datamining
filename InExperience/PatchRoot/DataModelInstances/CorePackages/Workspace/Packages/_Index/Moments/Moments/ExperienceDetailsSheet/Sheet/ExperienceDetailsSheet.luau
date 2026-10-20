local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local InExperienceDetailsPromptContainerModule = require(Parent.InExperienceDetailsPrompt.InExperienceDetailsPromptContainer)
local GetExperienceDetailsSheetStoreModule = require(script.Parent.getExperienceDetailsSheetStore)
local UseHideTabBarWhileOpenModule = require(script.Parent.useHideTabBarWhileOpen)
local UseJoinExperienceModule = require(Moments.ExperienceDetailsSheet.Join.useJoinExperience)
local FFlagMomentsFixRecommendationImpressionLifecycleModule = require(Moments.Flags.FFlagMomentsFixRecommendationImpressionLifecycle)
local FFlagMomentsTabsBehindModalScrimModule = require(Moments.Flags.FFlagMomentsTabsBehindModalScrim)
local FFlagMomentsNavigationEventModule = require(Moments.Flags.FFlagMomentsNavigationEvent)
local FFlagMomentsPlayEventModule = require(Moments.Flags.FFlagMomentsPlayEvent)
local NavigationDestinationTypeModule = require(Moments.Enums.NavigationDestinationType)
local Analytics = require(Parent.MomentsCommon).Analytics
local EventNames = Analytics.EventNames
local FireAnalyticsEventFunction = Analytics.fireAnalyticsEvent

return ReactModule.memo(function()
	-- upvalues: GetExperienceDetailsSheetStoreModule (copy), UseSignalStateFunction (copy), UseJoinExperienceModule (copy), FFlagMomentsTabsBehindModalScrimModule (copy), UseHideTabBarWhileOpenModule (copy), ReactModule (copy), FireAnalyticsEventFunction (copy), EventNames (copy), Analytics (copy), FFlagMomentsFixRecommendationImpressionLifecycleModule (copy), FFlagMomentsNavigationEventModule (copy), NavigationDestinationTypeModule (copy), FFlagMomentsPlayEventModule (copy), InExperienceDetailsPromptContainerModule (copy)
	local ExperienceDetailsSheetStoreModule = GetExperienceDetailsSheetStoreModule(false)
	local UseSignalStateResult = UseSignalStateFunction(ExperienceDetailsSheetStoreModule.getIsOpen)
	local UseSignalStateResult1 = UseSignalStateFunction(ExperienceDetailsSheetStoreModule.getContext)
	local UseJoinExperienceModuleResult = UseJoinExperienceModule()
	
	if not FFlagMomentsTabsBehindModalScrimModule then
		UseHideTabBarWhileOpenModule(UseSignalStateResult)
	end
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), UseSignalStateResult1 (copy), FireAnalyticsEventFunction (upval), EventNames (upval), Analytics (upval)
		if UseSignalStateResult and UseSignalStateResult1 then
			if UseSignalStateResult1.feedItemId ~= nil and UseSignalStateResult1.feedItemId ~= "" then
				FireAnalyticsEventFunction(EventNames.ExperienceDetailsOpened, {
					feedItemId = UseSignalStateResult1.feedItemId,
					feedSessionId = UseSignalStateResult1.tracingId or "",
					placeId = tostring(UseSignalStateResult1.placeId),
					universeId = tostring(UseSignalStateResult1.universeId)
				})
				
				return
			end
			Analytics.reportMomentSkip("feed_action", if UseSignalStateResult1.feedItemId == nil then "nil" else "empty", { action = "edp" })
		end
	end, { UseSignalStateResult, UseSignalStateResult1 })
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: UseSignalStateResult1 (copy), FFlagMomentsFixRecommendationImpressionLifecycleModule (upval), FFlagMomentsNavigationEventModule (upval), NavigationDestinationTypeModule (upval), UseJoinExperienceModuleResult (copy), FFlagMomentsPlayEventModule (upval), ExperienceDetailsSheetStoreModule (copy)
		if UseSignalStateResult1 then
			local OnBeforeJoinResult = if FFlagMomentsFixRecommendationImpressionLifecycleModule and UseSignalStateResult1.onBeforeJoin ~= nil then UseSignalStateResult1.onBeforeJoin(if FFlagMomentsNavigationEventModule then NavigationDestinationTypeModule.ExperienceJoin else nil) else nil
			UseJoinExperienceModuleResult(UseSignalStateResult1, p1, if FFlagMomentsPlayEventModule then OnBeforeJoinResult else nil)
		end
		ExperienceDetailsSheetStoreModule.close()
	end, {
		UseJoinExperienceModuleResult,
		UseSignalStateResult1,
		ExperienceDetailsSheetStoreModule.close
	})
	
	return if UseSignalStateResult and UseSignalStateResult1 ~= nil then ReactModule.createElement(InExperienceDetailsPromptContainerModule, {
		universeId = tostring(UseSignalStateResult1.universeId),
		onClose = ExperienceDetailsSheetStoreModule.close,
		onJoin = UseResult
	}) else nil
end)