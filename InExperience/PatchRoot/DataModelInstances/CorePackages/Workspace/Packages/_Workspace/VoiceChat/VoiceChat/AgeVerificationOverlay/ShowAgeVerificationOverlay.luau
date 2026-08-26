local voiceChat = script:FindFirstAncestor("VoiceChat")
local setShowAgeVerificationOverlayModule = require(voiceChat.AgeVerificationOverlay.SetShowAgeVerificationOverlay)
local cryoModule = require(voiceChat.Parent.Cryo)

return function(p1, p2)
	-- upvalues: setShowAgeVerificationOverlayModule (ref), cryoModule (ref)
	p1 = p1 or {}
	
	if p2.type == setShowAgeVerificationOverlayModule.name then
		p1 = cryoModule.Dictionary.join(p1, if p2.universeId ~= nil then {
			[p2.universeId] = {
				universeId = p2.universeId,
				isPlaceEnabledForVoice = p2.isPlaceEnabledForVoice,
				showVoiceOptInOverlay = p2.showVoiceOptInOverlay,
				isUniverseEnabledForVoice = p2.isUniverseEnabledForVoice,
				isVoiceEnabled = p2.isVoiceEnabled,
				isUniverseEnabledForAvatarVideo = p2.isUniverseEnabledForAvatarVideo,
				elegibleToSeeVoiceUpsell = p2.elegibleToSeeVoiceUpsell
			}
		} else {})
	end
	return p1
end