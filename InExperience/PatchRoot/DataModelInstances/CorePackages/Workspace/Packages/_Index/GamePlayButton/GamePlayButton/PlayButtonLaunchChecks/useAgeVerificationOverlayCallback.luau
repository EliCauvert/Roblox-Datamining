local gamePlayButton = script:FindFirstAncestor("GamePlayButton")
local IXPService = game:GetService("IXPService")
local _ = require(gamePlayButton.PlayButtonTypes)
local parent = gamePlayButton.Parent
local reactModule = require(parent.React)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local roactUtilsModule = require(parent.RoactUtils)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local voiceChatModule = require(parent.VoiceChat)
local openCentralOverlayForVerifiedEnableVoice = voiceChatModule.AgeVerificationOverlay.OpenCentralOverlayForVerifiedEnableVoice
local apiPostRecordUserSeenModal = voiceChatModule.AgeVerificationOverlay.ApiPostRecordUserSeenModal
local setShowAgeVerificationOverlay = voiceChatModule.AgeVerificationOverlay.SetShowAgeVerificationOverlay
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local getFStringVoiceUpsellLayer = require(parent.SharedFlags).GetFStringVoiceUpsellLayer
local fFlagLuaAppDemoModePlayButtonTelemetry = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry

return function(p0, p1, p2)
	-- upvalues: useRoactService (ref), roactNetworking (ref), useDispatch (ref), useAppPolicy (ref), useSelector (ref), reactModule (ref), getFStringVoiceUpsellLayer (ref), IXPService (ref), openCentralOverlayForVerifiedEnableVoice (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), apiPostRecordUserSeenModal (ref), setShowAgeVerificationOverlay (ref)
	local var5 = useRoactService(roactNetworking)
	local var6 = useDispatch()
	local var7 = useAppPolicy(function(p3)
		return {
			RequireExplicitVoiceConsent = p3.RequireExplicitVoiceConsent(),
			showVoiceOptInOverlayEnabled = p3.getShowVoiceUpsellV2()
		}
	end)
	local var8 = useSelector(function(p4)
		-- upvalues: p0 (ref)
		return if p4.ShowAgeVerificationOverlay[p0] == nil then {} else p4.ShowAgeVerificationOverlay[p0]
	end)
	local isPlaceEnabledForVoice = var8.isPlaceEnabledForVoice
	local isUniverseEnabledForVoice = var8.isUniverseEnabledForVoice
	local showVoiceOptInOverlay = var8.showVoiceOptInOverlay
	local elegibleToSeeVoiceUpsell = var8.elegibleToSeeVoiceUpsell
	
	return reactModule.useCallback(function(p5, p6)
		-- upvalues: isUniverseEnabledForVoice (ref), elegibleToSeeVoiceUpsell (ref), getFStringVoiceUpsellLayer (copy), IXPService (copy), showVoiceOptInOverlay (ref), var7 (ref), var6 (ref), openCentralOverlayForVerifiedEnableVoice (copy), p1 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), apiPostRecordUserSeenModal (copy), var5 (ref), setShowAgeVerificationOverlay (copy), p0 (ref), isPlaceEnabledForVoice (ref), p2 (ref)
		if isUniverseEnabledForVoice and elegibleToSeeVoiceUpsell then
			local var9 = getFStringVoiceUpsellLayer()
			
			if var9 ~= "" then
				IXPService:LogUserLayerExposure(var9)
			end
		end
		if showVoiceOptInOverlay and var7.showVoiceOptInOverlayEnabled then
			var6(openCentralOverlayForVerifiedEnableVoice({
				launchGame = function()
					-- upvalues: p1 (copy), p5 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), p6 (ref)
					p1(p5, if fFlagLuaAppDemoModePlayButtonTelemetry then p6 else nil)
				end,
				RequireExplicitVoiceConsent = var7.RequireExplicitVoiceConsent,
				postUserSeenModal = function()
					-- upvalues: var6 (copy), apiPostRecordUserSeenModal (copy), var5 (copy)
					return var6(apiPostRecordUserSeenModal.Fetch(var5))
				end,
				setShowVoiceOptIn = function(value)
					-- upvalues: var6 (copy), setShowAgeVerificationOverlay (copy), p0 (copy), isPlaceEnabledForVoice (copy), isUniverseEnabledForVoice (copy)
					var6(setShowAgeVerificationOverlay(p0, isPlaceEnabledForVoice, isUniverseEnabledForVoice, value.voiceEnabled, value.showVoiceOptInOverlay))
				end
			}))
			
			return
		end
		p2(p5, if fFlagLuaAppDemoModePlayButtonTelemetry then p6 else nil)
	end, {
		var5, p0, isPlaceEnabledForVoice, isUniverseEnabledForVoice,
		showVoiceOptInOverlay, var7.showVoiceOptInOverlayEnabled,
		var7.RequireExplicitVoiceConsent, var8.isVoiceEnabled, p1, p2,
		elegibleToSeeVoiceUpsell
	})
end