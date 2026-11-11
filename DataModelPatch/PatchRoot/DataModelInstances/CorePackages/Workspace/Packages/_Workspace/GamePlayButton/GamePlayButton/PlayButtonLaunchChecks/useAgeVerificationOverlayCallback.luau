local GamePlayButton = script:FindFirstAncestor("GamePlayButton")
local IXPService = game:GetService("IXPService")
local _ = require(GamePlayButton.PlayButtonTypes)
local Parent = GamePlayButton.Parent
local ReactModule = require(Parent.React)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local VoiceChatModule = require(Parent.VoiceChat)
local OpenCentralOverlayForVerifiedEnableVoiceFunction = VoiceChatModule.AgeVerificationOverlay.OpenCentralOverlayForVerifiedEnableVoice
local ApiPostRecordUserSeenModal = VoiceChatModule.AgeVerificationOverlay.ApiPostRecordUserSeenModal
local SetShowAgeVerificationOverlayFunction = VoiceChatModule.AgeVerificationOverlay.SetShowAgeVerificationOverlay
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local GetFStringVoiceUpsellLayerFunction = require(Parent.SharedFlags).GetFStringVoiceUpsellLayer

return function(p1, Callback1, Callback)
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy), UseDispatchFunction (copy), UseAppPolicyFunction (copy), UseSelectorFunction (copy), ReactModule (copy), GetFStringVoiceUpsellLayerFunction (copy), IXPService (copy), OpenCentralOverlayForVerifiedEnableVoiceFunction (copy), ApiPostRecordUserSeenModal (copy), SetShowAgeVerificationOverlayFunction (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseDispatchResult = UseDispatchFunction()
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return {
			RequireExplicitVoiceConsent = p2.RequireExplicitVoiceConsent(),
			showVoiceOptInOverlayEnabled = p2.getShowVoiceUpsellV2()
		}
	end)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: p1 (copy)
		return if p2.ShowAgeVerificationOverlay[p1] == nil then {} else p2.ShowAgeVerificationOverlay[p1]
	end)
	local IsPlaceEnabledForVoice = UseSelectorResult.isPlaceEnabledForVoice
	local IsUniverseEnabledForVoice = UseSelectorResult.isUniverseEnabledForVoice
	local ShowVoiceOptInOverlay = UseSelectorResult.showVoiceOptInOverlay
	local ElegibleToSeeVoiceUpsell = UseSelectorResult.elegibleToSeeVoiceUpsell
	
	return (ReactModule.useCallback(function(p2)
		-- upvalues: IsUniverseEnabledForVoice (copy), ElegibleToSeeVoiceUpsell (copy), GetFStringVoiceUpsellLayerFunction (upval), IXPService (upval), ShowVoiceOptInOverlay (copy), UseAppPolicyResult (copy), UseDispatchResult (copy), OpenCentralOverlayForVerifiedEnableVoiceFunction (upval), Callback1 (copy), ApiPostRecordUserSeenModal (upval), UseRoactServiceResult (copy), SetShowAgeVerificationOverlayFunction (upval), p1 (copy), IsPlaceEnabledForVoice (copy), Callback (copy)
		if IsUniverseEnabledForVoice and ElegibleToSeeVoiceUpsell then
			local FStringVoiceUpsellLayer = GetFStringVoiceUpsellLayerFunction()
			
			if FStringVoiceUpsellLayer ~= "" then
				IXPService:LogUserLayerExposure(FStringVoiceUpsellLayer)
			end
		end
		if ShowVoiceOptInOverlay and UseAppPolicyResult.showVoiceOptInOverlayEnabled then
			UseDispatchResult(OpenCentralOverlayForVerifiedEnableVoiceFunction({
				launchGame = function()
					-- upvalues: Callback1 (upval), p2 (copy)
					Callback1(p2)
				end,
				RequireExplicitVoiceConsent = UseAppPolicyResult.RequireExplicitVoiceConsent,
				postUserSeenModal = function()
					-- upvalues: UseDispatchResult (upval), ApiPostRecordUserSeenModal (upval), UseRoactServiceResult (upval)
					return UseDispatchResult(ApiPostRecordUserSeenModal.Fetch(UseRoactServiceResult))
				end,
				setShowVoiceOptIn = function(p3)
					-- upvalues: UseDispatchResult (upval), SetShowAgeVerificationOverlayFunction (upval), p1 (upval), IsPlaceEnabledForVoice (upval), IsUniverseEnabledForVoice (upval)
					UseDispatchResult(SetShowAgeVerificationOverlayFunction(p1, IsPlaceEnabledForVoice, IsUniverseEnabledForVoice, p3.voiceEnabled, p3.showVoiceOptInOverlay))
				end
			}))
			
			return
		else
			Callback(p2)
		end
	end, {
		UseRoactServiceResult, p1, IsPlaceEnabledForVoice, IsUniverseEnabledForVoice,
		ShowVoiceOptInOverlay, UseAppPolicyResult.showVoiceOptInOverlayEnabled,
		UseAppPolicyResult.RequireExplicitVoiceConsent,
		UseSelectorResult.isVoiceEnabled, Callback1, Callback, ElegibleToSeeVoiceUpsell
	}))
end