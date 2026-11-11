local GamePlayButton = script:FindFirstAncestor("GamePlayButton")
local _ = require(GamePlayButton.PlayButtonTypes)
local Parent = GamePlayButton.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local UnlockPlayIntentFunction = require(Parent.DiscoveryAnalytics).Events.unlockPlayIntent
local OpenUpsellModalFunction = require(Parent.DiscoveryRouting).OpenUpsellModal
local OpenPlayButtonUpsellDialogFunction = require(Parent.DiscoveryRouting).OpenPlayButtonUpsellDialog
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local FlaggedMutedErrorFunction = require(Parent.Loggers).flaggedMutedError
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local PlayableUxTreatmentEnum = DiscoveryTypesModule.PlayableUxTreatmentEnum
local PlayabilityStatusEnum = DiscoveryTypesModule.PlayabilityStatusEnum
local _ = require(Parent.PlayabilityRodux)
local FFlagLuaAppPlayButtonUpsellLinking = require(Parent.SharedFlags).FFlagLuaAppPlayButtonUpsellLinking
local FFlagLuaAppLogPageContextUnlockPlayIntent = require(Parent.SharedFlags).FFlagLuaAppLogPageContextUnlockPlayIntent

local function _(p1)
	return if p1 and (type(p1.titleText) == "string" and type(p1.bodyText) == "string" and type(p1.primaryActionText) == "string" and type(p1.secondaryActionText) == "string") then p1 else nil
end

return function(p1, UniverseId, Callback, p2)
	-- upvalues: UseRoactServiceFunction (copy), AppEventIngestService (copy), UseDispatchFunction (copy), ReactModule (copy), UnlockPlayIntentFunction (copy), FFlagLuaAppLogPageContextUnlockPlayIntent (copy), PlayabilityStatusEnum (copy), PlayableUxTreatmentEnum (copy), FlaggedMutedErrorFunction (copy), FFlagLuaAppPlayButtonUpsellLinking (copy), OpenPlayButtonUpsellDialogFunction (copy), CloseCentralOverlayFunction (copy), OpenUpsellModalFunction (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function(UpsellName)
		-- upvalues: UnlockPlayIntentFunction (upval), UseRoactServiceResult (copy), UniverseId (copy), p1 (copy), FFlagLuaAppLogPageContextUnlockPlayIntent (upval), p2 (copy)
		UnlockPlayIntentFunction(UseRoactServiceResult, {
			universeId = UniverseId,
			upsellName = UpsellName,
			playabilityStatus = p1 and p1.playabilityStatus or nil,
			pageName = if FFlagLuaAppLogPageContextUnlockPlayIntent then p2 else nil
		})
	end, {
		UseRoactServiceResult,
		UniverseId,
		p1,
		if FFlagLuaAppLogPageContextUnlockPlayIntent then p2 else nil
	})
	
	return ReactModule.useCallback(function(p3)
		-- upvalues: p1 (copy), PlayabilityStatusEnum (upval), Callback (copy), PlayableUxTreatmentEnum (upval), FlaggedMutedErrorFunction (upval), UniverseId (copy), UseResult (copy), FFlagLuaAppPlayButtonUpsellLinking (upval), UseDispatchResult (copy), OpenPlayButtonUpsellDialogFunction (upval), CloseCentralOverlayFunction (upval), OpenUpsellModalFunction (upval)
		if not p1 or not p1.playableUxTreatment or not p1.playableUxTreatment.treatment or p1.playabilityStatus ~= PlayabilityStatusEnum.Playable then
			Callback(p3)
			
			return
		end
		if p1.playableUxTreatment.treatment ~= PlayableUxTreatmentEnum.ReconfirmLaunchModal then
			FlaggedMutedErrorFunction("PlayableUxTreatmentUnsupported", `playableUxTreatment treatment {p1.playableUxTreatment.treatment} is unsupported for universeId {UniverseId}`)
			Callback(p3)
			UseResult("GameLaunch")
			
			return
		end
		local Data = p1.playableUxTreatment.data
		local Data1 = if Data and (type(Data.titleText) == "string" and type(Data.bodyText) == "string" and type(Data.primaryActionText) == "string" and type(Data.secondaryActionText) == "string") then Data else nil
		
		if not Data1 then
			FlaggedMutedErrorFunction("PlayableUxTreatmentMissingData", `playableUxTreatment data is missing for treatment {PlayableUxTreatmentEnum.ReconfirmLaunchModal} on universeId {UniverseId}`)
			Callback(p3)
			UseResult("GameLaunch")
			
			return
		end
		if FFlagLuaAppPlayButtonUpsellLinking then
			UseDispatchResult(OpenPlayButtonUpsellDialogFunction(Data1.titleText, Data1.bodyText, Data1.primaryActionText, Data1.secondaryActionText, function()
				-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval), Callback (upval), p3 (copy)
				UseDispatchResult(CloseCentralOverlayFunction())
				Callback(p3)
			end, function()
				-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
				UseDispatchResult(CloseCentralOverlayFunction())
			end, function()
				-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
				UseDispatchResult(CloseCentralOverlayFunction())
			end))
		else
			UseDispatchResult(OpenUpsellModalFunction(Data1.titleText, Data1.bodyText, Data1.primaryActionText, Data1.secondaryActionText, function()
				-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval), Callback (upval), p3 (copy)
				UseDispatchResult(CloseCentralOverlayFunction())
				Callback(p3)
			end, function()
				-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
				UseDispatchResult(CloseCentralOverlayFunction())
			end, function()
				-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
				UseDispatchResult(CloseCentralOverlayFunction())
			end))
		end
		UseResult("ReconfirmLaunchModal")
	end, {
		p1,
		UniverseId,
		Callback,
		UseResult,
		UseDispatchResult
	})
end