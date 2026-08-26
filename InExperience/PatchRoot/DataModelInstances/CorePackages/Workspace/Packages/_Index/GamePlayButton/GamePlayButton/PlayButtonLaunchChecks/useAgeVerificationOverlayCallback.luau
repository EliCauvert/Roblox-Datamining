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

return function(p1, p2, p3)
	-- upvalues: useRoactService (ref), roactNetworking (ref), useDispatch (ref), useAppPolicy (ref), useSelector (ref), reactModule (ref), getFStringVoiceUpsellLayer (ref), IXPService (ref), openCentralOverlayForVerifiedEnableVoice (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), apiPostRecordUserSeenModal (ref), setShowAgeVerificationOverlay (ref)
	local var1 = useRoactService(roactNetworking)
	local var2 = useDispatch()
	local var3 = useAppPolicy(function(p4)
		return {
			RequireExplicitVoiceConsent = p4.RequireExplicitVoiceConsent(),
			showVoiceOptInOverlayEnabled = p4.getShowVoiceUpsellV2()
		}
	end)
	local var4 = useSelector(function(p4)
		-- upvalues: p1 (ref)
		return if p4.ShowAgeVerificationOverlay[p1] == nil then {} else p4.ShowAgeVerificationOverlay[p1]
	end)
	local isPlaceEnabledForVoice = var4.isPlaceEnabledForVoice
	local isUniverseEnabledForVoice = var4.isUniverseEnabledForVoice
	local showVoiceOptInOverlay = var4.showVoiceOptInOverlay
	local elegibleToSeeVoiceUpsell = var4.elegibleToSeeVoiceUpsell
	
	return reactModule.useCallback(function(p4, p5)
		-- upvalues: isUniverseEnabledForVoice (ref), elegibleToSeeVoiceUpsell (ref), getFStringVoiceUpsellLayer (copy), IXPService (copy), showVoiceOptInOverlay (ref), var3 (ref), var2 (ref), openCentralOverlayForVerifiedEnableVoice (copy), p2 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), apiPostRecordUserSeenModal (copy), var1 (ref), setShowAgeVerificationOverlay (copy), p1 (ref), isPlaceEnabledForVoice (ref), p3 (ref)
		if isUniverseEnabledForVoice and elegibleToSeeVoiceUpsell then
			local var5 = getFStringVoiceUpsellLayer()
			
			if var5 ~= "" then
				IXPService:LogUserLayerExposure(var5)
			end
		end
		if showVoiceOptInOverlay and var3.showVoiceOptInOverlayEnabled then
			var2(openCentralOverlayForVerifiedEnableVoice({
				launchGame = function()
					-- upvalues: p2 (copy), p4 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), p5 (ref)
					p2(p4, if fFlagLuaAppDemoModePlayButtonTelemetry then p5 else nil)
				end,
				RequireExplicitVoiceConsent = var3.RequireExplicitVoiceConsent,
				postUserSeenModal = function()
					-- upvalues: var2 (copy), apiPostRecordUserSeenModal (copy), var1 (copy)
					return var2(apiPostRecordUserSeenModal.Fetch(var1))
				end,
				setShowVoiceOptIn = function(value)
					-- upvalues: var2 (copy), setShowAgeVerificationOverlay (copy), p1 (copy), isPlaceEnabledForVoice (copy), isUniverseEnabledForVoice (copy)
					var2(setShowAgeVerificationOverlay(p1, isPlaceEnabledForVoice, isUniverseEnabledForVoice, value.voiceEnabled, value.showVoiceOptInOverlay))
				end
			}))
			
			return
		end
		p3(p4, if fFlagLuaAppDemoModePlayButtonTelemetry then p5 else nil)
	end, {
		var1, p1, isPlaceEnabledForVoice, isUniverseEnabledForVoice,
		showVoiceOptInOverlay, var3.showVoiceOptInOverlayEnabled,
		var3.RequireExplicitVoiceConsent, var4.isVoiceEnabled, p2, p3,
		elegibleToSeeVoiceUpsell
	})
end