local voiceChat = script:FindFirstAncestor("VoiceChat")
local setShowAgeVerificationOverlayModule = require(voiceChat.AgeVerificationOverlay.SetShowAgeVerificationOverlay)
local cryoModule = require(voiceChat.Parent.Cryo)

return function(p0, p1) --[[ line: 6 ]]
	-- upvalues: setShowAgeVerificationOverlayModule (ref), cryoModule (ref)
	p0 = p0 or {}
	
	if p1.type == setShowAgeVerificationOverlayModule.name then
		p0 = cryoModule.Dictionary.join(p0, if p1.universeId ~= nil then {
			[p1.universeId] = {
				universeId = p1.universeId,
				isPlaceEnabledForVoice = p1.isPlaceEnabledForVoice,
				showVoiceOptInOverlay = p1.showVoiceOptInOverlay,
				isUniverseEnabledForVoice = p1.isUniverseEnabledForVoice,
				isVoiceEnabled = p1.isVoiceEnabled,
				isUniverseEnabledForAvatarVideo = p1.isUniverseEnabledForAvatarVideo,
				elegibleToSeeVoiceUpsell = p1.elegibleToSeeVoiceUpsell
			}
		} else {})
	end
	return p0
end