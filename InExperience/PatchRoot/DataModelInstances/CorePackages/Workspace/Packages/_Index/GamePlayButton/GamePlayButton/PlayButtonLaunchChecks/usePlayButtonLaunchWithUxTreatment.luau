local GamePlayButton = script:FindFirstAncestor("GamePlayButton")
local _ = require(GamePlayButton.PlayButtonTypes)
local Parent = GamePlayButton.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local UnlockPlayIntentFunction = require(Parent.DiscoveryAnalytics).Events.unlockPlayIntent
local OpenPlayButtonUpsellDialogFunction = require(Parent.DiscoveryRouting).OpenPlayButtonUpsellDialog
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local FlaggedMutedErrorFunction = require(Parent.Loggers).flaggedMutedError
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local PlayableUxTreatmentEnum = DiscoveryTypesModule.PlayableUxTreatmentEnum
local PlayabilityStatusEnum = DiscoveryTypesModule.PlayabilityStatusEnum
local _ = require(Parent.PlayabilityRodux)
local FFlagLuaAppDemoModePlayButtonTelemetry = require(Parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry

local function _(p1) --[[ Line: 20 | Named "asReconfirmLaunchModalData" ]]
	return if p1 and (type(p1.titleText) == "string" and type(p1.bodyText) == "string" and type(p1.primaryActionText) == "string" and type(p1.secondaryActionText) == "string") then p1 else nil
end

return function(p1, UniverseId, Callback, PageName) --[[ Line: 44 ]]
	-- upvalues: UseRoactServiceFunction (copy), AppEventIngestService (copy), UseDispatchFunction (copy), ReactModule (copy), UnlockPlayIntentFunction (copy), PlayabilityStatusEnum (copy), FFlagLuaAppDemoModePlayButtonTelemetry (copy), PlayableUxTreatmentEnum (copy), FlaggedMutedErrorFunction (copy), OpenPlayButtonUpsellDialogFunction (copy), CloseCentralOverlayFunction (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function(UpsellName) --[[ Line: 53 ]]
		-- upvalues: UnlockPlayIntentFunction (upval), UseRoactServiceResult (copy), UniverseId (copy), p1 (copy), PageName (copy)
		UnlockPlayIntentFunction(UseRoactServiceResult, {
			universeId = UniverseId,
			upsellName = UpsellName,
			playabilityStatus = p1 and p1.playabilityStatus or nil,
			pageName = PageName
		})
	end, { UseRoactServiceResult, UniverseId, p1, PageName })
	
	return ReactModule.useCallback(function(p2, p3) --[[ Line: 68 ]]
		-- upvalues: p1 (copy), PlayabilityStatusEnum (upval), Callback (copy), FFlagLuaAppDemoModePlayButtonTelemetry (upval), PlayableUxTreatmentEnum (upval), FlaggedMutedErrorFunction (upval), UniverseId (copy), UseResult (copy), UseDispatchResult (copy), OpenPlayButtonUpsellDialogFunction (upval), CloseCentralOverlayFunction (upval)
		if not p1 or not p1.playableUxTreatment or not p1.playableUxTreatment.treatment or p1.playabilityStatus ~= PlayabilityStatusEnum.Playable then
			Callback(p2, if FFlagLuaAppDemoModePlayButtonTelemetry then p3 else nil)
			
			return
		end
		if p1.playableUxTreatment.treatment ~= PlayableUxTreatmentEnum.ReconfirmLaunchModal then
			FlaggedMutedErrorFunction("PlayableUxTreatmentUnsupported", `playableUxTreatment treatment {p1.playableUxTreatment.treatment} is unsupported for universeId {UniverseId}`)
			Callback(p2, if FFlagLuaAppDemoModePlayButtonTelemetry then p3 else nil)
			UseResult("GameLaunch")
			
			return
		end
		local Data = p1.playableUxTreatment.data
		local Data1 = if Data and (type(Data.titleText) == "string" and type(Data.bodyText) == "string" and type(Data.primaryActionText) == "string" and type(Data.secondaryActionText) == "string") then Data else nil
		
		if Data1 then
			UseDispatchResult(OpenPlayButtonUpsellDialogFunction(Data1.titleText, Data1.bodyText, Data1.primaryActionText, Data1.secondaryActionText, function() --[[ Line: 102 ]]
				-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval), Callback (upval), p2 (copy), FFlagLuaAppDemoModePlayButtonTelemetry (upval), p3 (copy)
				UseDispatchResult(CloseCentralOverlayFunction())
				Callback(p2, if FFlagLuaAppDemoModePlayButtonTelemetry then p3 else nil)
			end, function() --[[ Line: 109 ]]
				-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
				UseDispatchResult(CloseCentralOverlayFunction())
			end, function() --[[ Line: 112 ]]
				-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
				UseDispatchResult(CloseCentralOverlayFunction())
			end))
			UseResult("ReconfirmLaunchModal")
			
			return
		else
			FlaggedMutedErrorFunction("PlayableUxTreatmentMissingData", `playableUxTreatment data is missing for treatment {PlayableUxTreatmentEnum.ReconfirmLaunchModal} on universeId {UniverseId}`)
			Callback(p2, if FFlagLuaAppDemoModePlayButtonTelemetry then p3 else nil)
			UseResult("GameLaunch")
		end
	end, {
		p1,
		UniverseId,
		Callback,
		UseResult,
		UseDispatchResult
	})
end