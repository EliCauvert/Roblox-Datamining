local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local FFlagLuaAppIedpControlledJoin = require(Parent.SharedFlags).FFlagLuaAppIedpControlledJoin
local InExperienceDetailsPromptContainerModule = require(Parent.InExperienceDetailsPrompt.InExperienceDetailsPromptContainer)
local UseMomentsSessionFunction = require(Moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local GetExperienceDetailsSheetStoreModule = require(script.Parent.getExperienceDetailsSheetStore)
local UseHideTabBarWhileOpenModule = require(script.Parent.useHideTabBarWhileOpen)
local UseJoinExperienceModule = require(Moments.ExperienceDetailsSheet.Join.useJoinExperience)
local Analytics = MomentsCommonModule.Analytics
local EventNames = Analytics.EventNames
local FireAnalyticsEventFunction = Analytics.fireAnalyticsEvent
local GetFFlagMomentsAnalyticsSchemaIdentityFunction = MomentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity

return ReactModule.memo(function()
	-- upvalues: GetExperienceDetailsSheetStoreModule (copy), UseSignalStateFunction (copy), FFlagLuaAppIedpControlledJoin (copy), UseJoinExperienceModule (copy), UseMomentsSessionFunction (copy), UseHideTabBarWhileOpenModule (copy), ReactModule (copy), GetFFlagMomentsAnalyticsSchemaIdentityFunction (copy), FireAnalyticsEventFunction (copy), EventNames (copy), Analytics (copy), InExperienceDetailsPromptContainerModule (copy)
	local ExperienceDetailsSheetStoreModule = GetExperienceDetailsSheetStoreModule(false)
	local FFlagLuaAppIedpControlledJoin1 = UseSignalStateFunction(ExperienceDetailsSheetStoreModule.getIsOpen) and FFlagLuaAppIedpControlledJoin
	local UseSignalStateResult = UseSignalStateFunction(ExperienceDetailsSheetStoreModule.getContext)
	local UseJoinExperienceModuleResult = UseJoinExperienceModule()
	local UseMomentsSessionResult = UseMomentsSessionFunction()
	UseHideTabBarWhileOpenModule(FFlagLuaAppIedpControlledJoin1)
	ReactModule.useEffect(function()
		-- upvalues: FFlagLuaAppIedpControlledJoin1 (copy), UseSignalStateResult (copy), GetFFlagMomentsAnalyticsSchemaIdentityFunction (upval), FireAnalyticsEventFunction (upval), EventNames (upval), Analytics (upval), UseMomentsSessionResult (copy)
		if FFlagLuaAppIedpControlledJoin1 and UseSignalStateResult then
			if not GetFFlagMomentsAnalyticsSchemaIdentityFunction() then
				FireAnalyticsEventFunction(EventNames.ExperienceDetailsOpened, {
					moments_session_id = UseMomentsSessionResult.getMomentsSessionId(false),
					item_id = UseSignalStateResult.itemId or "",
					tracing_id = UseSignalStateResult.tracingId or "",
					universe_id = tostring(UseSignalStateResult.universeId),
					place_id = tostring(UseSignalStateResult.placeId)
				})
			elseif UseSignalStateResult.feedItemId == nil or UseSignalStateResult.feedItemId == "" then
				Analytics.reportMomentSkip("feed_action", if UseSignalStateResult.feedItemId == nil then "nil" else "empty", { action = "edp" })
				
				return
			else
				FireAnalyticsEventFunction(EventNames.ExperienceDetailsOpened, {
					feedItemId = UseSignalStateResult.feedItemId,
					feedSessionId = UseSignalStateResult.tracingId or "",
					placeId = tostring(UseSignalStateResult.placeId),
					universeId = tostring(UseSignalStateResult.universeId)
				})
				
				return
			end
		end
	end, {
		FFlagLuaAppIedpControlledJoin1,
		UseSignalStateResult,
		UseMomentsSessionResult.getMomentsSessionId
	})
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: UseSignalStateResult (copy), UseJoinExperienceModuleResult (copy), ExperienceDetailsSheetStoreModule (copy)
		if UseSignalStateResult then
			UseJoinExperienceModuleResult(UseSignalStateResult, p1)
		end
		ExperienceDetailsSheetStoreModule.close()
	end, {
		UseJoinExperienceModuleResult,
		UseSignalStateResult,
		ExperienceDetailsSheetStoreModule.close
	})
	
	return if FFlagLuaAppIedpControlledJoin1 and UseSignalStateResult ~= nil then ReactModule.createElement(InExperienceDetailsPromptContainerModule, {
		universeId = tostring(UseSignalStateResult.universeId),
		onClose = ExperienceDetailsSheetStoreModule.close,
		onJoin = UseResult
	}) else nil
end)