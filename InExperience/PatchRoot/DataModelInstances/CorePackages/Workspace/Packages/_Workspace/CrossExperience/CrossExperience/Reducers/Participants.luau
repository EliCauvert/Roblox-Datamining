local crossExperience = script:FindFirstAncestor("CrossExperience")
local dependenciesModule = require(crossExperience.dependencies)
local rodux = dependenciesModule.Rodux
local cryo = dependenciesModule.Cryo
local participantAdded = require(crossExperience.Actions).ParticipantAdded
local participantRemoved = require(crossExperience.Actions).ParticipantRemoved
local participantIsActive = require(crossExperience.Actions).ParticipantIsActive
local participantIsInactive = require(crossExperience.Actions).ParticipantIsInactive
local participantWasMuted = require(crossExperience.Actions).ParticipantWasMuted
local participantWasUnmuted = require(crossExperience.Actions).ParticipantWasUnmuted
local voiceChangerWasEnabled = require(crossExperience.Actions).VoiceChangerWasEnabled
local voiceChangerWasDisabled = require(crossExperience.Actions).VoiceChangerWasDisabled
local voicePackWasSet = require(crossExperience.Actions).VoicePackWasSet
local voiceChangerFeedbackWasEnabled = require(crossExperience.Actions).VoiceChangerFeedbackWasEnabled
local voiceChangerFeedbackWasDisabled = require(crossExperience.Actions).VoiceChangerFeedbackWasDisabled
local participantAudioFocusChanged = require(crossExperience.Actions).ParticipantAudioFocusChanged
local experienceJoined = require(crossExperience.Actions).ExperienceJoined
local experienceLeft = require(crossExperience.Actions).ExperienceLeft
local restoreState = require(crossExperience.Actions).RestoreState
local muteParticipant = require(crossExperience.Actions).MuteParticipant
local unmuteParticipant = require(crossExperience.Actions).UnmuteParticipant
local _ = require(crossExperience.Types)
local utilsModule = require(crossExperience.Utils)
local t = {
	participants = {},
	activeUserIds = {},
	publicVoiceFocusedUserIds = {}
}

local _ = function(p1)
	-- upvalues: t (ref), utilsModule (ref)
	if p1 then
		t.participants = utilsModule.stringMapToNumberMap(p1.participants)
		t.activeUserIds = p1.activeUserIds
		t.publicVoiceFocusedUserIds = utilsModule.stringMapToNumberMap(p1.publicVoiceFocusedUserIds)
	end
	return t
end

return function(p1)
	-- upvalues: rodux (ref), t (ref), utilsModule (ref), participantAdded (ref), cryo (ref), participantRemoved (ref), participantWasMuted (ref), participantWasUnmuted (ref), voiceChangerWasEnabled (ref), voiceChangerWasDisabled (ref), voicePackWasSet (ref), voiceChangerFeedbackWasEnabled (ref), voiceChangerFeedbackWasDisabled (ref), participantIsActive (ref), participantIsInactive (ref), experienceJoined (ref), restoreState (ref), participantAudioFocusChanged (ref), muteParticipant (ref), unmuteParticipant (ref), experienceLeft (ref)
	local createReducer = rodux.createReducer
	
	if p1 then
		t.participants = utilsModule.stringMapToNumberMap(p1.participants)
		t.activeUserIds = p1.activeUserIds
		t.publicVoiceFocusedUserIds = utilsModule.stringMapToNumberMap(p1.publicVoiceFocusedUserIds)
	end
	return createReducer(t, {
		[participantAdded.name] = function(p2, p3)
			-- upvalues: cryo (copy)
			local participant = p3.payload.participant
			
			if p2.participants[participant.userId] then
				return p2
			end
			local cloned = table.clone(p2.participants)
			cloned[participant.userId] = participant
			
			return cryo.Dictionary.join(p2, { participants = cloned })
		end,
		[participantRemoved.name] = function(p2, p3)
			-- upvalues: cryo (copy)
			local userId = p3.payload.userId
			
			if not p2.participants[userId] then
				return p2
			end
			local cloned = table.clone(p2.participants)
			local cloned_1 = table.clone(p2.activeUserIds)
			local publicVoiceFocusedUserIds = p2.publicVoiceFocusedUserIds
			local index = table.find(cloned_1, userId)
			cloned[userId] = nil
			
			if publicVoiceFocusedUserIds[userId] then
				publicVoiceFocusedUserIds = table.clone(p2.publicVoiceFocusedUserIds)
				publicVoiceFocusedUserIds[userId] = nil
			end
			if index then
				table.remove(cloned_1, index)
			end
			return cryo.Dictionary.join(p2, {
				participants = cloned,
				activeUserIds = cloned_1,
				publicVoiceFocusedUserIds = publicVoiceFocusedUserIds
			})
		end,
		[participantWasMuted.name] = function(p2, p3)
			-- upvalues: cryo (copy)
			local userId = p3.payload.userId
			
			if not p2.participants[userId] then
				return p2
			end
			local participants = p2.participants
			local activeUserIds = p2.activeUserIds
			local index = table.find(activeUserIds, userId)
			
			if not participants[userId].isMuted then
				participants = table.clone(p2.participants)
				participants[userId].isMuted = true
			end
			if index then
				activeUserIds = table.clone(p2.activeUserIds)
				table.remove(activeUserIds, index)
			end
			return cryo.Dictionary.join(p2, {
				participants = participants,
				activeUserIds = activeUserIds
			})
		end,
		[participantWasUnmuted.name] = function(p2, p3)
			-- upvalues: cryo (copy)
			local userId = p3.payload.userId
			
			if p2.participants[userId] and p2.participants[userId].isMuted then
				local cloned = table.clone(p2.participants)
				cloned[userId].isMuted = false
				
				return cryo.Dictionary.join(p2, { participants = cloned })
			end
			return p2
		end,
		[voiceChangerWasEnabled.name] = function(p2, p3)
			-- upvalues: cryo (copy)
			local userId = p3.payload.userId
			
			if p2.participants[userId] then
				local cloned = table.clone(p2.participants)
				local cloned_1 = table.clone(p2.participants[userId])
				cloned_1.isVoiceChangerActive = true
				cloned[userId] = cloned_1
				
				return cryo.Dictionary.join(p2, { participants = cloned })
			end
			return p2
		end,
		[voiceChangerWasDisabled.name] = function(p2, p3)
			-- upvalues: cryo (copy)
			local userId = p3.payload.userId
			
			if p2.participants[userId] then
				local cloned = table.clone(p2.participants)
				local cloned_1 = table.clone(p2.participants[userId])
				cloned_1.isVoiceChangerActive = false
				cloned[userId] = cloned_1
				
				return cryo.Dictionary.join(p2, { participants = cloned })
			end
			return p2
		end,
		[voicePackWasSet.name] = function(p2, p3)
			-- upvalues: cryo (copy)
			local userId = p3.payload.userId
			
			if p2.participants[userId] then
				local cloned = table.clone(p2.participants)
				local cloned_1 = table.clone(p2.participants[userId])
				cloned_1.selectedVoicePack = p3.payload.voicePackName or "None"
				cloned[userId] = cloned_1
				
				return cryo.Dictionary.union(p2, { participants = cloned })
			end
			return p2
		end,
		[voiceChangerFeedbackWasEnabled.name] = function(p2, p3)
			-- upvalues: cryo (copy)
			local userId = p3.payload.userId
			
			if p2.participants[userId] then
				local cloned = table.clone(p2.participants)
				local cloned_1 = table.clone(p2.participants[userId])
				cloned_1.isVoiceChangerHearMyselfActive = true
				cloned[userId] = cloned_1
				
				return cryo.Dictionary.join(p2, { participants = cloned })
			end
			return p2
		end,
		[voiceChangerFeedbackWasDisabled.name] = function(p2, p3)
			-- upvalues: cryo (copy)
			local userId = p3.payload.userId
			
			if p2.participants[userId] then
				local cloned = table.clone(p2.participants)
				local cloned_1 = table.clone(p2.participants[userId])
				cloned_1.isVoiceChangerHearMyselfActive = false
				cloned[userId] = cloned_1
				
				return cryo.Dictionary.join(p2, { participants = cloned })
			end
			return p2
		end,
		[participantIsActive.name] = function(p2, p3)
			-- upvalues: cryo (copy)
			local userId = p3.payload.userId
			local cloned = table.clone(p2.activeUserIds)
			local index = table.find(cloned, userId)
			
			if not index then
				table.insert(cloned, userId)
			elseif index ~= #cloned then
				table.remove(cloned, index)
				table.insert(cloned, userId)
			end
			return cryo.Dictionary.join(p2, { activeUserIds = cloned })
		end,
		[participantIsInactive.name] = function(p2, p3)
			-- upvalues: cryo (copy)
			local index = table.find(p2.activeUserIds, p3.payload.userId)
			
			if index then
				local cloned = table.clone(p2.activeUserIds)
				table.remove(cloned, index)
				
				return cryo.Dictionary.join(p2, { activeUserIds = cloned })
			end
			return p2
		end,
		[experienceJoined.name] = function(p2, p3)
			-- upvalues: cryo (copy)
			local payload = p3.payload
			
			return if payload.participants and payload.activeUserIds then cryo.Dictionary.join(p2, {
				participants = payload.participants,
				activeUserIds = payload.activeUserIds,
				publicVoiceFocusedUserIds = payload.publicVoiceFocusedUserIds
			}) else p2
		end,
		[restoreState.name] = function(p2, p3)
			-- upvalues: cryo (copy)
			return if p3.payload.Participants then cryo.Dictionary.join({}, p3.payload.Participants) else p2
		end,
		[participantAudioFocusChanged.name] = function(p2, p3)
			-- upvalues: cryo (copy)
			local contextIds = p3.payload.contextIds
			local cloned = table.clone(p2.publicVoiceFocusedUserIds)
			
			if contextIds then
				for i, v in pairs(contextIds) do
					local var1 = tonumber(i)
					
					if var1 then
						if v == 1 then
							cloned[var1] = true
						else
							cloned[var1] = nil
						end
					end
				end
			end
			return cryo.Dictionary.join(p2, { publicVoiceFocusedUserIds = cloned })
		end,
		[muteParticipant.name] = function(p4, p5)
			-- upvalues: cryo (copy)
			local userId = p5.payload.userId
			
			if p4.participants[userId] and not p4.participants[userId].isMutedLocally then
				local cloned = table.clone(p4.participants)
				cloned[userId].isMutedLocally = true
				
				return cryo.Dictionary.join(p4, { participants = cloned })
			end
			return p4
		end,
		[unmuteParticipant.name] = function(p4, p5)
			-- upvalues: cryo (copy)
			local userId = p5.payload.userId
			
			if p4.participants[userId] and p4.participants[userId].isMutedLocally == true then
				local cloned = table.clone(p4.participants)
				cloned[userId].isMutedLocally = false
				
				return cryo.Dictionary.join(p4, { participants = cloned })
			end
			return p4
		end,
		[experienceLeft.name] = function()
			return {
				participants = {},
				activeUserIds = {},
				publicVoiceFocusedUserIds = {}
			}
		end
	})
end