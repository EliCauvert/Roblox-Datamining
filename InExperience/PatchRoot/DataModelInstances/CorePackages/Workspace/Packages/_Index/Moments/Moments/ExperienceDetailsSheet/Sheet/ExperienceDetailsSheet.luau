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

return reactModule.memo(function() --[[ line: 37 | named "ExperienceDetailsSheet" ]]
	-- upvalues: getExperienceDetailsSheetStoreModule (ref), useSignalState (ref), useJoinExperienceModule (ref), useMomentsSession (ref), useHideTabBarWhileOpenModule (ref), reactModule (ref), getFFlagMomentsAnalyticsSchemaIdentity (ref), fireAnalyticsEvent (ref), eventNames (ref), analytics (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (ref), inExperienceDetailsPromptContainerModule (ref)
	local var8 = getExperienceDetailsSheetStoreModule(false)
	local var9 = useSignalState(var8.getIsOpen)
	local var10 = useSignalState(var8.getContext)
	local var11 = useJoinExperienceModule()
	local var12 = useMomentsSession()
	useHideTabBarWhileOpenModule(var9)
	reactModule.useEffect(function() --[[ line: 47 ]]
		-- upvalues: var9 (ref), var10 (ref), getFFlagMomentsAnalyticsSchemaIdentity (copy), fireAnalyticsEvent (copy), eventNames (copy), analytics (copy), var12 (ref)
		if var9 and var10 then
			if getFFlagMomentsAnalyticsSchemaIdentity() then
				if var10.feedItemId == nil or var10.feedItemId == "" then
					analytics.reportMomentSkip("feed_action", if var10.feedItemId == nil then "nil" else "empty", { action = "edp" })
					
					return
				end
				fireAnalyticsEvent(eventNames.ExperienceDetailsOpened, {
					feedItemId = var10.feedItemId,
					feedSessionId = var10.tracingId or "",
					placeId = tostring(var10.placeId),
					universeId = tostring(var10.universeId)
				})
				
				return
			else
				fireAnalyticsEvent(eventNames.ExperienceDetailsOpened, {
					moments_session_id = var12.getMomentsSessionId(false),
					item_id = var10.itemId or "",
					tracing_id = var10.tracingId or "",
					universe_id = tostring(var10.universeId),
					place_id = tostring(var10.placeId)
				})
			end
		end
	end, { var9, var10, var12.getMomentsSessionId })
	
	return if var9 and var10 ~= nil then reactModule.createElement(inExperienceDetailsPromptContainerModule, {
		universeId = tostring(var10.universeId),
		onClose = var8.close,
		onJoin = reactModule.useCallback(function(p0) --[[ line: 82 ]]
			-- upvalues: var10 (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (copy), var11 (ref), var8 (ref)
			if var10 then
				if fFlagMomentsFixRecommendationImpressionLifecycleModule and var10.onBeforeJoin ~= nil then
					var10.onBeforeJoin()
				end
				var11(var10, p0)
			end
			var8.close()
		end, { var11, var10, var8.close })
	}) else nil
end)