local CrossExperience = script:FindFirstAncestor("CrossExperience")
local _ = require(CrossExperience.Types)
local VOICESTATUS = require(CrossExperience.Constants).VOICE_STATUS
local config = {
	[VOICESTATUS.ERROR_START_BACKGROUND_DM] = true,
	[VOICESTATUS.ERROR_RCC_CONNECTING] = true,
	[VOICESTATUS.ERROR_VOICE_DISCONNECTED] = true,
	[VOICESTATUS.ERROR_RCC_TIMEOUT] = true,
	[VOICESTATUS.ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT] = true
}
local config1 = {
	[VOICESTATUS.ERROR_VOICE_INIT] = true,
	[VOICESTATUS.ERROR_VOICE_SETUP] = true,
	[VOICESTATUS.ERROR_VOICE_JOIN] = true,
	[VOICESTATUS.ERROR_VOICE_MIC_REJECTED] = true,
	[VOICESTATUS.ERROR_VOICE_MODERATED] = true,
	[VOICESTATUS.ERROR_VOICE_FAILED] = true,
	[VOICESTATUS.ERROR_VOICE_MIC_REJECTED] = nil
}

function isVoiceRetriableErrorByGameJoin(p1): boolean --[[ Line: 29 ]]
	-- upvalues: config (copy)
	return p1 ~= nil and config[p1] == true
end

function isMicPermissionsError(ERRORVOICEMICREJECTED): boolean --[[ Line: 36 ]]
	-- upvalues: VOICESTATUS (copy)
	return ERRORVOICEMICREJECTED ~= nil and ERRORVOICEMICREJECTED == VOICESTATUS.ERROR_VOICE_MIC_REJECTED
end

function isVoiceRetriableErrorByVoiceJoin(p1): boolean --[[ Line: 43 ]]
	-- upvalues: config1 (copy)
	return p1 ~= nil and config1[p1] == true
end

function isVoiceRetriableError(p1) --[[ Line: 51 ]]
	return isVoiceRetriableErrorByGameJoin(p1) or isVoiceRetriableErrorByVoiceJoin(p1)
end

return {
	isVoiceRetriableError = isVoiceRetriableError,
	isVoiceRetriableErrorByGameJoin = isVoiceRetriableErrorByGameJoin,
	isVoiceRetriableErrorByVoiceJoin = isVoiceRetriableErrorByVoiceJoin,
	isMicPermissionsError = isMicPermissionsError
}