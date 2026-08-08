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

local function _(p0) --[[ line: 20 | named "asReconfirmLaunchModalData" ]]
	return if p0 then if type(p0.titleText) == "string" and type(p0.bodyText) == "string" and (type(p0.primaryActionText) == "string" and type(p0.secondaryActionText) == "string") then p0 else nil else nil
end

return function(p1, p2, p3, p4) --[[ line: 44 ]]
	-- upvalues: useRoactService (ref), appEventIngestService (ref), useDispatch (ref), reactModule (ref), unlockPlayIntent (ref), playabilityStatusEnum (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), playableUxTreatmentEnum (ref), flaggedMutedError (ref), openPlayButtonUpsellDialog (ref), closeCentralOverlay (ref)
	local var3 = useRoactService(appEventIngestService)
	local var4 = useDispatch()
	local var5 = reactModule.useCallback(function(p5) --[[ line: 53 ]]
		-- upvalues: unlockPlayIntent (copy), var3 (ref), p2 (ref), p1 (ref), p4 (ref)
		unlockPlayIntent(var3, {
			universeId = p2,
			upsellName = p5,
			playabilityStatus = if p1 then p1.playabilityStatus else nil,
			pageName = p4
		})
	end, { var3, p2, p1, p4 })
	
	return reactModule.useCallback(function(p6, p7) --[[ line: 68 ]]
		-- upvalues: p1 (ref), playabilityStatusEnum (copy), p3 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), playableUxTreatmentEnum (copy), flaggedMutedError (copy), p2 (ref), var5 (ref), var4 (ref), openPlayButtonUpsellDialog (copy), closeCentralOverlay (copy)
		if not p1 or not p1.playableUxTreatment or (not p1.playableUxTreatment.treatment or p1.playabilityStatus ~= playabilityStatusEnum.Playable) then
			p3(p6, if fFlagLuaAppDemoModePlayButtonTelemetry then p7 else nil)
			
			return
		elseif p1.playableUxTreatment.treatment ~= playableUxTreatmentEnum.ReconfirmLaunchModal then
			flaggedMutedError("PlayableUxTreatmentUnsupported", `playableUxTreatment treatment {p1.playableUxTreatment.treatment} is unsupported for universeId {p2}`)
			p3(p6, if fFlagLuaAppDemoModePlayButtonTelemetry then p7 else nil)
			var5("GameLaunch")
			
			return
		end
		local data = p1.playableUxTreatment.data
		local var6 = if not data then if type(data.titleText) == "string" and type(data.bodyText) == "string" and (type(data.primaryActionText) == "string" and type(data.secondaryActionText) == "string") then data else nil else nil
		
		if var6 then
			var4(openPlayButtonUpsellDialog(var6.titleText, var6.bodyText, var6.primaryActionText, var6.secondaryActionText, function() --[[ line: 102 ]]
				-- upvalues: var4 (copy), closeCentralOverlay (copy), p3 (copy), p6 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), p7 (ref)
				var4(closeCentralOverlay())
				p3(p6, if fFlagLuaAppDemoModePlayButtonTelemetry then p7 else nil)
			end, function() --[[ line: 109 ]]
				-- upvalues: var4 (copy), closeCentralOverlay (copy)
				var4(closeCentralOverlay())
			end, function() --[[ line: 112 ]]
				-- upvalues: var4 (copy), closeCentralOverlay (copy)
				var4(closeCentralOverlay())
			end))
			var5("ReconfirmLaunchModal")
			
			return
		end
		flaggedMutedError("PlayableUxTreatmentMissingData", `playableUxTreatment data is missing for treatment {playableUxTreatmentEnum.ReconfirmLaunchModal} on universeId {p2}`)
		p3(p6, if fFlagLuaAppDemoModePlayButtonTelemetry then p7 else nil)
		var5("GameLaunch")
	end, {
		p1,
		p2,
		p3,
		var5,
		var4
	})
end