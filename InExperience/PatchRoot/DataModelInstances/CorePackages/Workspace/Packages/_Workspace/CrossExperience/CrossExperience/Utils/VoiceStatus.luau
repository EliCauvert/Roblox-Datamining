local crossExperience = script:FindFirstAncestor("CrossExperience")
local _ = require(crossExperience.Types)
local VOICE_STATUS = require(crossExperience.Constants).VOICE_STATUS
local t = {
	[VOICE_STATUS.ERROR_VOICE_INIT] = true,
	[VOICE_STATUS.ERROR_VOICE_SETUP] = true,
	[VOICE_STATUS.ERROR_VOICE_JOIN] = true,
	[VOICE_STATUS.ERROR_VOICE_MIC_REJECTED] = true,
	[VOICE_STATUS.ERROR_VOICE_MODERATED] = true,
	[VOICE_STATUS.ERROR_VOICE_FAILED] = true,
	[VOICE_STATUS.ERROR_VOICE_MIC_REJECTED] = nil
}
local t_1 = {
	[VOICE_STATUS.ERROR_START_BACKGROUND_DM] = true,
	[VOICE_STATUS.ERROR_RCC_CONNECTING] = true,
	[VOICE_STATUS.ERROR_VOICE_DISCONNECTED] = true,
	[VOICE_STATUS.ERROR_RCC_TIMEOUT] = true,
	[VOICE_STATUS.ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT] = true
}

function isVoiceRetriableErrorByGameJoin(p1)
	-- upvalues: t_1 (ref)
	return if p1 == nil then false else t_1[p1] == true
end

function isMicPermissionsError(p1)
	-- upvalues: VOICE_STATUS (ref)
	return if p1 == nil then false else p1 == VOICE_STATUS.ERROR_VOICE_MIC_REJECTED
end

function isVoiceRetriableErrorByVoiceJoin(p1)
	-- upvalues: t (ref)
	return if p1 == nil then false else t[p1] == true
end

function isVoiceRetriableError(p1)
	return isVoiceRetriableErrorByGameJoin(p1) or isVoiceRetriableErrorByVoiceJoin(p1)
end

return {
	isVoiceRetriableError = isVoiceRetriableError,
	isVoiceRetriableErrorByGameJoin = isVoiceRetriableErrorByGameJoin,
	isVoiceRetriableErrorByVoiceJoin = isVoiceRetriableErrorByVoiceJoin,
	isMicPermissionsError = isMicPermissionsError
}