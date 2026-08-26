local gamePlayButton = script:FindFirstAncestor("GamePlayButton")
local _ = require(gamePlayButton.PlayButtonTypes)
local parent = gamePlayButton.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local unlockPlayIntent = require(parent.DiscoveryAnalytics).Events.unlockPlayIntent
local openPlayButtonUpsellDialog = require(parent.DiscoveryRouting).OpenPlayButtonUpsellDialog
local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
local flaggedMutedError = require(parent.Loggers).flaggedMutedError
local discoveryTypesModule = require(parent.DiscoveryTypes)
local playableUxTreatmentEnum = discoveryTypesModule.PlayableUxTreatmentEnum
local playabilityStatusEnum = discoveryTypesModule.PlayabilityStatusEnum
local _ = require(parent.PlayabilityRodux)
local fFlagLuaAppDemoModePlayButtonTelemetry = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry

local function _(p1)
	return if p1 then if type(p1.titleText) == "string" and type(p1.bodyText) == "string" and (type(p1.primaryActionText) == "string" and type(p1.secondaryActionText) == "string") then p1 else nil else nil
end

return function(p1, p2, p3, p4)
	-- upvalues: useRoactService (ref), appEventIngestService (ref), useDispatch (ref), reactModule (ref), unlockPlayIntent (ref), playabilityStatusEnum (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), playableUxTreatmentEnum (ref), flaggedMutedError (ref), openPlayButtonUpsellDialog (ref), closeCentralOverlay (ref)
	local var1 = useRoactService(appEventIngestService)
	local var2 = useDispatch()
	local var3 = reactModule.useCallback(function(p5)
		-- upvalues: unlockPlayIntent (copy), var1 (ref), p2 (ref), p1 (ref), p4 (ref)
		unlockPlayIntent(var1, {
			universeId = p2,
			upsellName = p5,
			playabilityStatus = if p1 then p1.playabilityStatus else nil,
			pageName = p4
		})
	end, { var1, p2, p1, p4 })
	
	return reactModule.useCallback(function(p5, p6)
		-- upvalues: p1 (ref), playabilityStatusEnum (copy), p3 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), playableUxTreatmentEnum (copy), flaggedMutedError (copy), p2 (ref), var3 (ref), var2 (ref), openPlayButtonUpsellDialog (copy), closeCentralOverlay (copy)
		if not p1 or not p1.playableUxTreatment or (not p1.playableUxTreatment.treatment or p1.playabilityStatus ~= playabilityStatusEnum.Playable) then
			p3(p5, if fFlagLuaAppDemoModePlayButtonTelemetry then p6 else nil)
			
			return
		elseif p1.playableUxTreatment.treatment ~= playableUxTreatmentEnum.ReconfirmLaunchModal then
			flaggedMutedError("PlayableUxTreatmentUnsupported", `playableUxTreatment treatment {p1.playableUxTreatment.treatment} is unsupported for universeId {p2}`)
			p3(p5, if fFlagLuaAppDemoModePlayButtonTelemetry then p6 else nil)
			var3("GameLaunch")
			
			return
		end
		local data = p1.playableUxTreatment.data
		local var4 = if not data then if type(data.titleText) == "string" and type(data.bodyText) == "string" and (type(data.primaryActionText) == "string" and type(data.secondaryActionText) == "string") then data else nil else nil
		
		if var4 then
			var2(openPlayButtonUpsellDialog(var4.titleText, var4.bodyText, var4.primaryActionText, var4.secondaryActionText, function()
				-- upvalues: var2 (copy), closeCentralOverlay (copy), p3 (copy), p5 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), p6 (ref)
				var2(closeCentralOverlay())
				p3(p5, if fFlagLuaAppDemoModePlayButtonTelemetry then p6 else nil)
			end, function()
				-- upvalues: var2 (copy), closeCentralOverlay (copy)
				var2(closeCentralOverlay())
			end, function()
				-- upvalues: var2 (copy), closeCentralOverlay (copy)
				var2(closeCentralOverlay())
			end))
			var3("ReconfirmLaunchModal")
			
			return
		end
		flaggedMutedError("PlayableUxTreatmentMissingData", `playableUxTreatment data is missing for treatment {playableUxTreatmentEnum.ReconfirmLaunchModal} on universeId {p2}`)
		p3(p5, if fFlagLuaAppDemoModePlayButtonTelemetry then p6 else nil)
		var3("GameLaunch")
	end, {
		p1,
		p2,
		p3,
		var3,
		var2
	})
end