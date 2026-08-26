local crossExperience = script:FindFirstAncestor("CrossExperience")
local dependenciesModule = require(crossExperience.dependencies)
local rodux = dependenciesModule.Rodux
local cryo = dependenciesModule.Cryo
local sharedFlags = dependenciesModule.SharedFlags
local experienceJoined = require(crossExperience.Actions).ExperienceJoined
local experienceLeft = require(crossExperience.Actions).ExperienceLeft
local restoreState = require(crossExperience.Actions).RestoreState
local voiceStatusChanged = require(crossExperience.Actions).VoiceStatusChanged
local _ = require(crossExperience.Types)
local constantsModule = require(crossExperience.Constants)
local fStringTimeoutLoadingLocalPlayerInBackgroundDM = sharedFlags.FStringTimeoutLoadingLocalPlayerInBackgroundDM
local VOICE_STATUS = constantsModule.VOICE_STATUS
local t = {
	jobId = nil,
	gameId = nil,
	placeId = nil,
	voiceChannelId = nil,
	voiceSessionId = nil,
	voiceStatus = VOICE_STATUS.DISCONNECTED
}

local function _(p1, p2)
	-- upvalues: sharedFlags (ref), VOICE_STATUS (ref)
	return if sharedFlags.GetFFlagFixPartyVoiceGetPermissions() and p1 == VOICE_STATUS.ERROR_VOICE_MIC_REJECTED then p2 == VOICE_STATUS.VOICE_CONNECTING else p1 ~= p2
end

return function(p1)
	-- upvalues: rodux (ref), t (ref), experienceJoined (ref), cryo (ref), experienceLeft (ref), constantsModule (ref), fStringTimeoutLoadingLocalPlayerInBackgroundDM (ref), restoreState (ref), voiceStatusChanged (ref), sharedFlags (ref), VOICE_STATUS (ref)
	return rodux.createReducer(p1 or t, {
		[experienceJoined.name] = function(p2, p3)
			-- upvalues: cryo (copy)
			local payload = p3.payload
			
			return cryo.Dictionary.join(p2, {
				jobId = payload.jobId,
				gameId = payload.gameId,
				placeId = payload.placeId
			})
		end,
		[experienceLeft.name] = function(p2)
			-- upvalues: constantsModule (copy), fStringTimeoutLoadingLocalPlayerInBackgroundDM (copy)
			local voiceStatus = p2.voiceStatus
			
			return {
				jobId = nil,
				gameId = nil,
				placeId = nil,
				voiceChannelId = nil,
				voiceSessionId = nil,
				voiceStatus = if not (voiceStatus == constantsModule.VOICE_STATUS.ERROR_VOICE_DISCONNECTED or voiceStatus == constantsModule.VOICE_STATUS.ERROR_START_BACKGROUND_DM or (voiceStatus == constantsModule.VOICE_STATUS.ERROR_RCC_CONNECTING or voiceStatus == constantsModule.VOICE_STATUS.ERROR_RCC_TIMEOUT) or fStringTimeoutLoadingLocalPlayerInBackgroundDM ~= constantsModule.LOCAL_PLAYER_LOADING_TIMEOUT_ENUM.Disable and voiceStatus == constantsModule.VOICE_STATUS.ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT) then constantsModule.VOICE_STATUS.DISCONNECTED else p2.voiceStatus
			}
		end,
		[restoreState.name] = function(p2, p3)
			-- upvalues: cryo (copy)
			return if p3.payload.Experience then cryo.Dictionary.join({}, p3.payload.Experience) else p2
		end,
		[voiceStatusChanged.name] = function(p2, p3)
			-- upvalues: sharedFlags (copy), VOICE_STATUS (copy), cryo (copy)
			local var1
			local voiceStatus = p2.voiceStatus
			local status = p3.payload.status
			
			if sharedFlags.GetFFlagFixPartyVoiceGetPermissions() and voiceStatus == VOICE_STATUS.ERROR_VOICE_MIC_REJECTED then
				var1 = status == VOICE_STATUS.VOICE_CONNECTING
				var1 = nil
			else
				var1 = voiceStatus ~= status
			end
			if not var1 then
				return p2
			end
			local var2 = cryo.Dictionary.join(p2, { voiceStatus = p3.payload.status })
			
			if p3.payload.status == VOICE_STATUS.VOICE_CONNECTED then
				var2 = cryo.Dictionary.join(var2, {
					voiceChannelId = p3.payload.voiceChannelId,
					voiceSessionId = p3.payload.voiceSessionId
				})
			end
			return var2
		end
	})
end