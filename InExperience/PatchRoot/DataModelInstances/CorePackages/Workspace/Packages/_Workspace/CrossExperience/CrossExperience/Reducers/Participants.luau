local CrossExperience = script:FindFirstAncestor("CrossExperience")
local DependenciesModule = require(CrossExperience.dependencies)
local Rodux = DependenciesModule.Rodux
local Cryo = DependenciesModule.Cryo
local ParticipantAdded = require(CrossExperience.Actions).ParticipantAdded
local ParticipantRemoved = require(CrossExperience.Actions).ParticipantRemoved
local ParticipantIsActive = require(CrossExperience.Actions).ParticipantIsActive
local ParticipantIsInactive = require(CrossExperience.Actions).ParticipantIsInactive
local ParticipantWasMuted = require(CrossExperience.Actions).ParticipantWasMuted
local ParticipantWasUnmuted = require(CrossExperience.Actions).ParticipantWasUnmuted
local VoiceChangerWasEnabled = require(CrossExperience.Actions).VoiceChangerWasEnabled
local VoiceChangerWasDisabled = require(CrossExperience.Actions).VoiceChangerWasDisabled
local VoicePackWasSet = require(CrossExperience.Actions).VoicePackWasSet
local VoiceChangerFeedbackWasEnabled = require(CrossExperience.Actions).VoiceChangerFeedbackWasEnabled
local VoiceChangerFeedbackWasDisabled = require(CrossExperience.Actions).VoiceChangerFeedbackWasDisabled
local ParticipantAudioFocusChanged = require(CrossExperience.Actions).ParticipantAudioFocusChanged
local ExperienceJoined = require(CrossExperience.Actions).ExperienceJoined
local ExperienceLeft = require(CrossExperience.Actions).ExperienceLeft
local RestoreState = require(CrossExperience.Actions).RestoreState
local MuteParticipant = require(CrossExperience.Actions).MuteParticipant
local UnmuteParticipant = require(CrossExperience.Actions).UnmuteParticipant
local _ = require(CrossExperience.Types)
local UtilsModule = require(CrossExperience.Utils)
local config = {
	participants = {},
	activeUserIds = {},
	publicVoiceFocusedUserIds = {}
}

local function _(p1) --[[ Line: 56 ]]
	-- upvalues: config (copy), UtilsModule (copy)
	if p1 then
		config.participants = UtilsModule.stringMapToNumberMap(p1.participants)
		config.activeUserIds = p1.activeUserIds
		config.publicVoiceFocusedUserIds = UtilsModule.stringMapToNumberMap(p1.publicVoiceFocusedUserIds)
	end
	return config
end

return function(p1) --[[ Line: 67 ]]
	-- upvalues: Rodux (copy), config (copy), UtilsModule (copy), ParticipantAdded (copy), Cryo (copy), ParticipantRemoved (copy), ParticipantWasMuted (copy), ParticipantWasUnmuted (copy), VoiceChangerWasEnabled (copy), VoiceChangerWasDisabled (copy), VoicePackWasSet (copy), VoiceChangerFeedbackWasEnabled (copy), VoiceChangerFeedbackWasDisabled (copy), ParticipantIsActive (copy), ParticipantIsInactive (copy), ExperienceJoined (copy), RestoreState (copy), ParticipantAudioFocusChanged (copy), MuteParticipant (copy), UnmuteParticipant (copy), ExperienceLeft (copy)
	local CreateReducerFunction = Rodux.createReducer
	
	if p1 then
		config.participants = UtilsModule.stringMapToNumberMap(p1.participants)
		config.activeUserIds = p1.activeUserIds
		config.publicVoiceFocusedUserIds = UtilsModule.stringMapToNumberMap(p1.publicVoiceFocusedUserIds)
	end
	return CreateReducerFunction(config, {
		[ParticipantAdded.name] = function(p2, p3) --[[ Line: 70 ]]
			-- upvalues: Cryo (upval)
			local Participant = p3.payload.participant
			
			if p2.participants[Participant.userId] then
				return p2
			else
				local Copy = table.clone(p2.participants)
				Copy[Participant.userId] = Participant
				
				return Cryo.Dictionary.join(p2, { participants = Copy })
			end
		end,
		[ParticipantRemoved.name] = function(p2, p3) --[[ Line: 84 ]]
			-- upvalues: Cryo (upval)
			local UserId = p3.payload.userId
			
			if not p2.participants[UserId] then
				return p2
			end
			local Copy = table.clone(p2.participants)
			local Copy1 = table.clone(p2.activeUserIds)
			local PublicVoiceFocusedUserIds = p2.publicVoiceFocusedUserIds
			local FoundIndex: number? = table.find(Copy1, UserId)
			Copy[UserId] = nil
			
			if PublicVoiceFocusedUserIds[UserId] then
				PublicVoiceFocusedUserIds = table.clone(p2.publicVoiceFocusedUserIds)
				PublicVoiceFocusedUserIds[UserId] = nil
			end
			if FoundIndex then
				table.remove(Copy1, FoundIndex)
			end
			return Cryo.Dictionary.join(p2, {
				participants = Copy,
				activeUserIds = Copy1,
				publicVoiceFocusedUserIds = PublicVoiceFocusedUserIds
			})
		end,
		[ParticipantWasMuted.name] = function(p2, p3) --[[ Line: 113 ]]
			-- upvalues: Cryo (upval)
			local UserId = p3.payload.userId
			
			if not p2.participants[UserId] then
				return p2
			end
			local Participants = p2.participants
			local ActiveUserIds = p2.activeUserIds
			local FoundIndex: number? = table.find(ActiveUserIds, UserId)
			
			if not Participants[UserId].isMuted then
				Participants = table.clone(p2.participants)
				Participants[UserId].isMuted = true
			end
			if FoundIndex then
				ActiveUserIds = table.clone(p2.activeUserIds)
				table.remove(ActiveUserIds, FoundIndex)
			end
			return Cryo.Dictionary.join(p2, {
				participants = Participants,
				activeUserIds = ActiveUserIds
			})
		end,
		[ParticipantWasUnmuted.name] = function(p2, p3) --[[ Line: 140 ]]
			-- upvalues: Cryo (upval)
			local UserId = p3.payload.userId
			
			if p2.participants[UserId] and p2.participants[UserId].isMuted then
				local Copy = table.clone(p2.participants)
				Copy[UserId].isMuted = false
				
				return Cryo.Dictionary.join(p2, { participants = Copy })
			else
				return p2
			end
		end,
		[VoiceChangerWasEnabled.name] = function(p2, p3) --[[ Line: 156 ]]
			-- upvalues: Cryo (upval)
			local UserId = p3.payload.userId
			
			if p2.participants[UserId] then
				local Copy = table.clone(p2.participants)
				local Copy1 = table.clone(p2.participants[UserId])
				Copy1.isVoiceChangerActive = true
				Copy[UserId] = Copy1
				
				return Cryo.Dictionary.join(p2, { participants = Copy })
			else
				return p2
			end
		end,
		[VoiceChangerWasDisabled.name] = function(p2, p3) --[[ Line: 175 ]]
			-- upvalues: Cryo (upval)
			local UserId = p3.payload.userId
			
			if p2.participants[UserId] then
				local Copy = table.clone(p2.participants)
				local Copy1 = table.clone(p2.participants[UserId])
				Copy1.isVoiceChangerActive = false
				Copy[UserId] = Copy1
				
				return Cryo.Dictionary.join(p2, { participants = Copy })
			else
				return p2
			end
		end,
		[VoicePackWasSet.name] = function(p2, p3) --[[ Line: 194 ]]
			-- upvalues: Cryo (upval)
			local UserId = p3.payload.userId
			
			if p2.participants[UserId] then
				local Copy = table.clone(p2.participants)
				local Copy1 = table.clone(p2.participants[UserId])
				Copy1.selectedVoicePack = p3.payload.voicePackName or "None"
				Copy[UserId] = Copy1
				
				return Cryo.Dictionary.union(p2, { participants = Copy })
			else
				return p2
			end
		end,
		[VoiceChangerFeedbackWasEnabled.name] = function(p2, p3) --[[ Line: 210 ]]
			-- upvalues: Cryo (upval)
			local UserId = p3.payload.userId
			
			if p2.participants[UserId] then
				local Copy = table.clone(p2.participants)
				local Copy1 = table.clone(p2.participants[UserId])
				Copy1.isVoiceChangerHearMyselfActive = true
				Copy[UserId] = Copy1
				
				return Cryo.Dictionary.join(p2, { participants = Copy })
			else
				return p2
			end
		end,
		[VoiceChangerFeedbackWasDisabled.name] = function(p2, p3) --[[ Line: 229 ]]
			-- upvalues: Cryo (upval)
			local UserId = p3.payload.userId
			
			if p2.participants[UserId] then
				local Copy = table.clone(p2.participants)
				local Copy1 = table.clone(p2.participants[UserId])
				Copy1.isVoiceChangerHearMyselfActive = false
				Copy[UserId] = Copy1
				
				return Cryo.Dictionary.join(p2, { participants = Copy })
			else
				return p2
			end
		end,
		[ParticipantIsActive.name] = function(p2, p3) --[[ Line: 248 ]]
			-- upvalues: Cryo (upval)
			local UserId = p3.payload.userId
			local Copy = table.clone(p2.activeUserIds)
			local FoundIndex: number? = table.find(Copy, UserId)
			
			if FoundIndex then
				if FoundIndex ~= #Copy then
					table.remove(Copy, FoundIndex)
					table.insert(Copy, UserId)
				end
			else
				table.insert(Copy, UserId)
			end
			return Cryo.Dictionary.join(p2, { activeUserIds = Copy })
		end,
		[ParticipantIsInactive.name] = function(p2, p3) --[[ Line: 267 ]]
			-- upvalues: Cryo (upval)
			local FoundIndex: number? = table.find(p2.activeUserIds, p3.payload.userId)
			
			if FoundIndex then
				local Copy = table.clone(p2.activeUserIds)
				table.remove(Copy, FoundIndex)
				
				return Cryo.Dictionary.join(p2, { activeUserIds = Copy })
			else
				return p2
			end
		end,
		[ExperienceJoined.name] = function(p2, p3) --[[ Line: 283 ]]
			-- upvalues: Cryo (upval)
			local Payload = p3.payload
			
			return if Payload.participants and Payload.activeUserIds then Cryo.Dictionary.join(p2, {
				participants = Payload.participants,
				activeUserIds = Payload.activeUserIds,
				publicVoiceFocusedUserIds = Payload.publicVoiceFocusedUserIds
			}) else p2
		end,
		[RestoreState.name] = function(p2, p3) --[[ Line: 295 ]]
			-- upvalues: Cryo (upval)
			return if p3.payload.Participants then Cryo.Dictionary.join({}, p3.payload.Participants) else p2
		end,
		[ParticipantAudioFocusChanged.name] = function(p2, p3) --[[ Line: 302 ]]
			-- upvalues: Cryo (upval)
			local ContextIds = p3.payload.contextIds
			local Copy = table.clone(p2.publicVoiceFocusedUserIds)
			
			if ContextIds then
				for i, contextId in pairs(ContextIds) do
					local Number: number? = tonumber(i)
					
					if Number then
						if contextId == 1 then
							Copy[Number] = true
						else
							Copy[Number] = nil
						end
					end
				end
			end
			return Cryo.Dictionary.join(p2, { publicVoiceFocusedUserIds = Copy })
		end,
		[MuteParticipant.name] = function(p4, p5) --[[ Line: 330 ]]
			-- upvalues: Cryo (upval)
			local UserId = p5.payload.userId
			
			if p4.participants[UserId] and not p4.participants[UserId].isMutedLocally then
				local Copy = table.clone(p4.participants)
				Copy[UserId].isMutedLocally = true
				
				return Cryo.Dictionary.join(p4, { participants = Copy })
			else
				return p4
			end
		end,
		[UnmuteParticipant.name] = function(p4, p5) --[[ Line: 343 ]]
			-- upvalues: Cryo (upval)
			local UserId = p5.payload.userId
			
			if p4.participants[UserId] and p4.participants[UserId].isMutedLocally == true then
				local Copy = table.clone(p4.participants)
				Copy[UserId].isMutedLocally = false
				
				return Cryo.Dictionary.join(p4, { participants = Copy })
			else
				return p4
			end
		end,
		[ExperienceLeft.name] = function() --[[ Line: 356 ]]
			return {
				participants = {},
				activeUserIds = {},
				publicVoiceFocusedUserIds = {}
			}
		end
	})
end