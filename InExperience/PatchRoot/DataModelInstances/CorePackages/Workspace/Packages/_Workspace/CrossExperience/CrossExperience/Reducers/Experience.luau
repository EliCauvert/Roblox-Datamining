local CrossExperience = script:FindFirstAncestor("CrossExperience")
local DependenciesModule = require(CrossExperience.dependencies)
local Rodux = DependenciesModule.Rodux
local Cryo = DependenciesModule.Cryo
local SharedFlags = DependenciesModule.SharedFlags
local ExperienceJoined = require(CrossExperience.Actions).ExperienceJoined
local ExperienceLeft = require(CrossExperience.Actions).ExperienceLeft
local RestoreState = require(CrossExperience.Actions).RestoreState
local VoiceStatusChanged = require(CrossExperience.Actions).VoiceStatusChanged
local _ = require(CrossExperience.Types)
local ConstantsModule = require(CrossExperience.Constants)
local FStringTimeoutLoadingLocalPlayerInBackgroundDM = SharedFlags.FStringTimeoutLoadingLocalPlayerInBackgroundDM
local VOICESTATUS = ConstantsModule.VOICE_STATUS
local config = {
	jobId = nil,
	gameId = nil,
	placeId = nil,
	voiceChannelId = nil,
	voiceSessionId = nil,
	voiceStatus = VOICESTATUS.DISCONNECTED
}

local function _(ERRORVOICEMICREJECTED, ERRORVOICEMICREJECTED1): boolean
	-- upvalues: SharedFlags (copy), VOICESTATUS (copy)
	return if SharedFlags.GetFFlagFixPartyVoiceGetPermissions() and ERRORVOICEMICREJECTED == VOICESTATUS.ERROR_VOICE_MIC_REJECTED then ERRORVOICEMICREJECTED1 == VOICESTATUS.VOICE_CONNECTING else ERRORVOICEMICREJECTED ~= ERRORVOICEMICREJECTED1
end

return function(p1)
	-- upvalues: Rodux (copy), config (copy), ExperienceJoined (copy), Cryo (copy), ExperienceLeft (copy), ConstantsModule (copy), FStringTimeoutLoadingLocalPlayerInBackgroundDM (copy), RestoreState (copy), VoiceStatusChanged (copy), SharedFlags (copy), VOICESTATUS (copy)
	return Rodux.createReducer(p1 or config, {
		[ExperienceJoined.name] = function(p2, p3)
			-- upvalues: Cryo (upval)
			local Payload = p3.payload
			
			return Cryo.Dictionary.join(p2, {
				jobId = Payload.jobId,
				gameId = Payload.gameId,
				placeId = Payload.placeId
			})
		end,
		[ExperienceLeft.name] = function(p2)
			-- upvalues: ConstantsModule (upval), FStringTimeoutLoadingLocalPlayerInBackgroundDM (upval)
			local VoiceStatus = p2.voiceStatus
			
			return {
				jobId = nil,
				gameId = nil,
				placeId = nil,
				voiceChannelId = nil,
				voiceSessionId = nil,
				voiceStatus = if VoiceStatus == ConstantsModule.VOICE_STATUS.ERROR_VOICE_DISCONNECTED or VoiceStatus == ConstantsModule.VOICE_STATUS.ERROR_START_BACKGROUND_DM or VoiceStatus == ConstantsModule.VOICE_STATUS.ERROR_RCC_CONNECTING or VoiceStatus == ConstantsModule.VOICE_STATUS.ERROR_RCC_TIMEOUT or FStringTimeoutLoadingLocalPlayerInBackgroundDM ~= ConstantsModule.LOCAL_PLAYER_LOADING_TIMEOUT_ENUM.Disable and VoiceStatus == ConstantsModule.VOICE_STATUS.ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT then p2.voiceStatus else ConstantsModule.VOICE_STATUS.DISCONNECTED
			}
		end,
		[RestoreState.name] = function(p2, p3)
			-- upvalues: Cryo (upval)
			return if p3.payload.Experience then Cryo.Dictionary.join({}, p3.payload.Experience) else p2
		end,
		[VoiceStatusChanged.name] = function(p2, p3)
			-- upvalues: SharedFlags (upval), VOICESTATUS (upval), Cryo (upval)
			local VoiceStatus = p2.voiceStatus
			local Status = p3.payload.status
			
			if not (if SharedFlags.GetFFlagFixPartyVoiceGetPermissions() and VoiceStatus == VOICESTATUS.ERROR_VOICE_MIC_REJECTED then Status == VOICESTATUS.VOICE_CONNECTING else VoiceStatus ~= Status) then
				return p2
			end
			local JoinResult = Cryo.Dictionary.join(p2, { voiceStatus = p3.payload.status })
			
			if p3.payload.status == VOICESTATUS.VOICE_CONNECTED then
				JoinResult = Cryo.Dictionary.join(JoinResult, {
					voiceChannelId = p3.payload.voiceChannelId,
					voiceSessionId = p3.payload.voiceSessionId
				})
			end
			return JoinResult
		end
	})
end