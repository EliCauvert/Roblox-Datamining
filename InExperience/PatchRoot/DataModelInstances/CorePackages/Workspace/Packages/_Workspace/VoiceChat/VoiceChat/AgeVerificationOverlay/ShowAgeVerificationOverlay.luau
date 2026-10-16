local VoiceChat = script:FindFirstAncestor("VoiceChat")
local SetShowAgeVerificationOverlayModule = require(VoiceChat.AgeVerificationOverlay.SetShowAgeVerificationOverlay)
local CryoModule = require(VoiceChat.Parent.Cryo)

return function(p1, p2) --[[ Line: 6 ]]
	-- upvalues: SetShowAgeVerificationOverlayModule (copy), CryoModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetShowAgeVerificationOverlayModule.name then
		P0 = CryoModule.Dictionary.join(P0, if p2.universeId == nil then {} else {
			[p2.universeId] = {
				universeId = p2.universeId,
				isPlaceEnabledForVoice = p2.isPlaceEnabledForVoice,
				showVoiceOptInOverlay = p2.showVoiceOptInOverlay,
				isUniverseEnabledForVoice = p2.isUniverseEnabledForVoice,
				isVoiceEnabled = p2.isVoiceEnabled,
				isUniverseEnabledForAvatarVideo = p2.isUniverseEnabledForAvatarVideo,
				elegibleToSeeVoiceUpsell = p2.elegibleToSeeVoiceUpsell
			}
		} or {})
	end
	return P0
end