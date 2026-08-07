local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local useSignalState = require(parent.SignalsReact).useSignalState
local fFlagLuaAppIedpControlledJoin = require(parent.SharedFlags).FFlagLuaAppIedpControlledJoin
local inExperienceDetailsPromptContainerModule = require(parent.InExperienceDetailsPrompt.InExperienceDetailsPromptContainer)
local useMomentsSession = require(moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local getExperienceDetailsSheetStoreModule = require(script.Parent.getExperienceDetailsSheetStore)
local useHideTabBarWhileOpenModule = require(script.Parent.useHideTabBarWhileOpen)
local useJoinExperienceModule = require(moments.ExperienceDetailsSheet.Join.useJoinExperience)
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local getFFlagMomentsAnalyticsSchemaIdentity = momentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity

return reactModule.memo(function() --[[ line: 40 | named "ExperienceDetailsSheet" ]]
	-- upvalues: getExperienceDetailsSheetStoreModule (ref), useSignalState (ref), fFlagLuaAppIedpControlledJoin (ref), useJoinExperienceModule (ref), useMomentsSession (ref), useHideTabBarWhileOpenModule (ref), reactModule (ref), getFFlagMomentsAnalyticsSchemaIdentity (ref), fireAnalyticsEvent (ref), eventNames (ref), analytics (ref), inExperienceDetailsPromptContainerModule (ref)
	local var7 = getExperienceDetailsSheetStoreModule(false)
	local fFlagLuaAppIedpControlledJoin_1 = useSignalState(var7.getIsOpen) and fFlagLuaAppIedpControlledJoin
	local var9 = useSignalState(var7.getContext)
	local var10 = useJoinExperienceModule()
	local var11 = useMomentsSession()
	useHideTabBarWhileOpenModule(fFlagLuaAppIedpControlledJoin_1)
	reactModule.useEffect(function() --[[ line: 50 ]]
		-- upvalues: fFlagLuaAppIedpControlledJoin_1 (ref), var9 (ref), getFFlagMomentsAnalyticsSchemaIdentity (copy), fireAnalyticsEvent (copy), eventNames (copy), analytics (copy), var11 (ref)
		if fFlagLuaAppIedpControlledJoin_1 and var9 then
			if getFFlagMomentsAnalyticsSchemaIdentity() then
				if var9.feedItemId == nil or var9.feedItemId == "" then
					analytics.reportMomentSkip("feed_action", if var9.feedItemId == nil then "nil" else "empty", { action = "edp" })
					
					return
				end
				fireAnalyticsEvent(eventNames.ExperienceDetailsOpened, {
					feedItemId = var9.feedItemId,
					feedSessionId = var9.tracingId or "",
					placeId = tostring(var9.placeId),
					universeId = tostring(var9.universeId)
				})
				
				return
			else
				fireAnalyticsEvent(eventNames.ExperienceDetailsOpened, {
					moments_session_id = var11.getMomentsSessionId(false),
					item_id = var9.itemId or "",
					tracing_id = var9.tracingId or "",
					universe_id = tostring(var9.universeId),
					place_id = tostring(var9.placeId)
				})
			end
		end
	end, {
		fFlagLuaAppIedpControlledJoin_1,
		var9,
		var11.getMomentsSessionId
	})
	
	return if fFlagLuaAppIedpControlledJoin_1 and var9 ~= nil then reactModule.createElement(inExperienceDetailsPromptContainerModule, {
		universeId = tostring(var9.universeId),
		onClose = var7.close,
		onJoin = reactModule.useCallback(function(p0) --[[ line: 85 ]]
			-- upvalues: var9 (ref), var10 (ref), var7 (ref)
			if var9 then
				var10(var9, p0)
			end
			var7.close()
		end, { var10, var9, var7.close })
	}) else nil
end)