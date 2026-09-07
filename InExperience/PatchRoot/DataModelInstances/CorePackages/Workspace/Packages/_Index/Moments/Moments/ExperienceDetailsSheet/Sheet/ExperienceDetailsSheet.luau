local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local useSignalState = require(parent.SignalsReact).useSignalState
local inExperienceDetailsPromptContainerModule = require(parent.InExperienceDetailsPrompt.InExperienceDetailsPromptContainer)
local useMomentsSession = require(moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local getExperienceDetailsSheetStoreModule = require(script.Parent.getExperienceDetailsSheetStore)
local useHideTabBarWhileOpenModule = require(script.Parent.useHideTabBarWhileOpen)
local useJoinExperienceModule = require(moments.ExperienceDetailsSheet.Join.useJoinExperience)
local fFlagMomentsFixRecommendationImpressionLifecycleModule = require(moments.Flags.FFlagMomentsFixRecommendationImpressionLifecycle)
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local getFFlagMomentsAnalyticsSchemaIdentity = momentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity

return reactModule.memo(function()
	-- upvalues: getExperienceDetailsSheetStoreModule (ref), useSignalState (ref), useJoinExperienceModule (ref), useMomentsSession (ref), useHideTabBarWhileOpenModule (ref), reactModule (ref), getFFlagMomentsAnalyticsSchemaIdentity (ref), fireAnalyticsEvent (ref), eventNames (ref), analytics (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (ref), inExperienceDetailsPromptContainerModule (ref)
	local var1 = getExperienceDetailsSheetStoreModule(false)
	local var2 = useSignalState(var1.getIsOpen)
	local var3 = useSignalState(var1.getContext)
	local var4 = useJoinExperienceModule()
	local var5 = useMomentsSession()
	useHideTabBarWhileOpenModule(var2)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var3 (ref), getFFlagMomentsAnalyticsSchemaIdentity (copy), fireAnalyticsEvent (copy), eventNames (copy), analytics (copy), var5 (ref)
		if var2 and var3 then
			if getFFlagMomentsAnalyticsSchemaIdentity() then
				if var3.feedItemId == nil or var3.feedItemId == "" then
					analytics.reportMomentSkip("feed_action", if var3.feedItemId == nil then "nil" else "empty", { action = "edp" })
					
					return
				end
				fireAnalyticsEvent(eventNames.ExperienceDetailsOpened, {
					feedItemId = var3.feedItemId,
					feedSessionId = var3.tracingId or "",
					placeId = tostring(var3.placeId),
					universeId = tostring(var3.universeId)
				})
				
				return
			else
				fireAnalyticsEvent(eventNames.ExperienceDetailsOpened, {
					moments_session_id = var5.getMomentsSessionId(false),
					item_id = var3.itemId or "",
					tracing_id = var3.tracingId or "",
					universe_id = tostring(var3.universeId),
					place_id = tostring(var3.placeId)
				})
			end
		end
	end, { var2, var3, var5.getMomentsSessionId })
	
	return if var2 and var3 ~= nil then reactModule.createElement(inExperienceDetailsPromptContainerModule, {
		universeId = tostring(var3.universeId),
		onClose = var1.close,
		onJoin = reactModule.useCallback(function(p1)
			-- upvalues: var3 (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (copy), var4 (ref), var1 (ref)
			if var3 then
				if fFlagMomentsFixRecommendationImpressionLifecycleModule and var3.onBeforeJoin ~= nil then
					var3.onBeforeJoin()
				end
				var4(var3, p1)
			end
			var1.close()
		end, { var4, var3, var1.close })
	}) else nil
end)