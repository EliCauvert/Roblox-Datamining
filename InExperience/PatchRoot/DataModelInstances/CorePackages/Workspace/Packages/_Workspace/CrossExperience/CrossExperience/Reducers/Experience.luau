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

local function _(p0, p1)
	-- upvalues: sharedFlags (ref), VOICE_STATUS (ref)
	return if sharedFlags.GetFFlagFixPartyVoiceGetPermissions() and p0 == VOICE_STATUS.ERROR_VOICE_MIC_REJECTED then p1 == VOICE_STATUS.VOICE_CONNECTING else p0 ~= p1
end

return function(p2)
	-- upvalues: rodux (ref), t (ref), experienceJoined (ref), cryo (ref), experienceLeft (ref), constantsModule (ref), fStringTimeoutLoadingLocalPlayerInBackgroundDM (ref), restoreState (ref), voiceStatusChanged (ref), sharedFlags (ref), VOICE_STATUS (ref)
	return rodux.createReducer(p2 or t, {
		[experienceJoined.name] = function(p3, p4)
			-- upvalues: cryo (copy)
			local payload = p4.payload
			
			return cryo.Dictionary.join(p3, {
				jobId = payload.jobId,
				gameId = payload.gameId,
				placeId = payload.placeId
			})
		end,
		[experienceLeft.name] = function(p5)
			-- upvalues: constantsModule (copy), fStringTimeoutLoadingLocalPlayerInBackgroundDM (copy)
			local voiceStatus = p5.voiceStatus
			
			return {
				jobId = nil,
				gameId = nil,
				placeId = nil,
				voiceChannelId = nil,
				voiceSessionId = nil,
				voiceStatus = if not (voiceStatus == constantsModule.VOICE_STATUS.ERROR_VOICE_DISCONNECTED or voiceStatus == constantsModule.VOICE_STATUS.ERROR_START_BACKGROUND_DM or (voiceStatus == constantsModule.VOICE_STATUS.ERROR_RCC_CONNECTING or voiceStatus == constantsModule.VOICE_STATUS.ERROR_RCC_TIMEOUT) or fStringTimeoutLoadingLocalPlayerInBackgroundDM ~= constantsModule.LOCAL_PLAYER_LOADING_TIMEOUT_ENUM.Disable and voiceStatus == constantsModule.VOICE_STATUS.ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT) then constantsModule.VOICE_STATUS.DISCONNECTED else p5.voiceStatus
			}
		end,
		[restoreState.name] = function(p6, p7)
			-- upvalues: cryo (copy)
			return if p7.payload.Experience then cryo.Dictionary.join({}, p7.payload.Experience) else p6
		end,
		[voiceStatusChanged.name] = function(p8, p9)
			-- upvalues: sharedFlags (copy), VOICE_STATUS (copy), cryo (copy)
			local var4
			local voiceStatus = p8.voiceStatus
			local status = p9.payload.status
			
			if sharedFlags.GetFFlagFixPartyVoiceGetPermissions() and voiceStatus == VOICE_STATUS.ERROR_VOICE_MIC_REJECTED then
				var4 = status == VOICE_STATUS.VOICE_CONNECTING
				var4 = nil
			else
				var4 = voiceStatus ~= status
			end
			if not var4 then
				return p8
			end
			local var5 = cryo.Dictionary.join(p8, { voiceStatus = p9.payload.status })
			
			if p9.payload.status == VOICE_STATUS.VOICE_CONNECTED then
				var5 = cryo.Dictionary.join(var5, {
					voiceChannelId = p9.payload.voiceChannelId,
					voiceSessionId = p9.payload.voiceSessionId
				})
			end
			return var5
		end
	})
end