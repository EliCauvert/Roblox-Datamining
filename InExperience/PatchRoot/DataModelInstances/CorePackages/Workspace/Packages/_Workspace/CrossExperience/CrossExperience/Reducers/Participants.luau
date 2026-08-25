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

local _ = function(p0)
	-- upvalues: t (ref), utilsModule (ref)
	if p0 then
		t.participants = utilsModule.stringMapToNumberMap(p0.participants)
		t.activeUserIds = p0.activeUserIds
		t.publicVoiceFocusedUserIds = utilsModule.stringMapToNumberMap(p0.publicVoiceFocusedUserIds)
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
		[participantRemoved.name] = function(p4, p5)
			-- upvalues: cryo (copy)
			local userId = p5.payload.userId
			
			if not p4.participants[userId] then
				return p4
			end
			local cloned = table.clone(p4.participants)
			local cloned_1 = table.clone(p4.activeUserIds)
			local publicVoiceFocusedUserIds = p4.publicVoiceFocusedUserIds
			local index = table.find(cloned_1, userId)
			cloned[userId] = nil
			
			if publicVoiceFocusedUserIds[userId] then
				publicVoiceFocusedUserIds = table.clone(p4.publicVoiceFocusedUserIds)
				publicVoiceFocusedUserIds[userId] = nil
			end
			if index then
				table.remove(cloned_1, index)
			end
			return cryo.Dictionary.join(p4, {
				participants = cloned,
				activeUserIds = cloned_1,
				publicVoiceFocusedUserIds = publicVoiceFocusedUserIds
			})
		end,
		[participantWasMuted.name] = function(p6, p7)
			-- upvalues: cryo (copy)
			local userId = p7.payload.userId
			
			if not p6.participants[userId] then
				return p6
			end
			local participants = p6.participants
			local activeUserIds = p6.activeUserIds
			local index = table.find(activeUserIds, userId)
			
			if not participants[userId].isMuted then
				participants = table.clone(p6.participants)
				participants[userId].isMuted = true
			end
			if index then
				activeUserIds = table.clone(p6.activeUserIds)
				table.remove(activeUserIds, index)
			end
			return cryo.Dictionary.join(p6, {
				participants = participants,
				activeUserIds = activeUserIds
			})
		end,
		[participantWasUnmuted.name] = function(p8, p9)
			-- upvalues: cryo (copy)
			local userId = p9.payload.userId
			
			if p8.participants[userId] and p8.participants[userId].isMuted then
				local cloned = table.clone(p8.participants)
				cloned[userId].isMuted = false
				
				return cryo.Dictionary.join(p8, { participants = cloned })
			end
			return p8
		end,
		[voiceChangerWasEnabled.name] = function(p10, p11)
			-- upvalues: cryo (copy)
			local userId = p11.payload.userId
			
			if p10.participants[userId] then
				local cloned = table.clone(p10.participants)
				local cloned_1 = table.clone(p10.participants[userId])
				cloned_1.isVoiceChangerActive = true
				cloned[userId] = cloned_1
				
				return cryo.Dictionary.join(p10, { participants = cloned })
			end
			return p10
		end,
		[voiceChangerWasDisabled.name] = function(p12, p13)
			-- upvalues: cryo (copy)
			local userId = p13.payload.userId
			
			if p12.participants[userId] then
				local cloned = table.clone(p12.participants)
				local cloned_1 = table.clone(p12.participants[userId])
				cloned_1.isVoiceChangerActive = false
				cloned[userId] = cloned_1
				
				return cryo.Dictionary.join(p12, { participants = cloned })
			end
			return p12
		end,
		[voicePackWasSet.name] = function(p14, p15)
			-- upvalues: cryo (copy)
			local userId = p15.payload.userId
			
			if p14.participants[userId] then
				local cloned = table.clone(p14.participants)
				local cloned_1 = table.clone(p14.participants[userId])
				cloned_1.selectedVoicePack = p15.payload.voicePackName or "None"
				cloned[userId] = cloned_1
				
				return cryo.Dictionary.union(p14, { participants = cloned })
			end
			return p14
		end,
		[voiceChangerFeedbackWasEnabled.name] = function(p16, p17)
			-- upvalues: cryo (copy)
			local userId = p17.payload.userId
			
			if p16.participants[userId] then
				local cloned = table.clone(p16.participants)
				local cloned_1 = table.clone(p16.participants[userId])
				cloned_1.isVoiceChangerHearMyselfActive = true
				cloned[userId] = cloned_1
				
				return cryo.Dictionary.join(p16, { participants = cloned })
			end
			return p16
		end,
		[voiceChangerFeedbackWasDisabled.name] = function(p18, p19)
			-- upvalues: cryo (copy)
			local userId = p19.payload.userId
			
			if p18.participants[userId] then
				local cloned = table.clone(p18.participants)
				local cloned_1 = table.clone(p18.participants[userId])
				cloned_1.isVoiceChangerHearMyselfActive = false
				cloned[userId] = cloned_1
				
				return cryo.Dictionary.join(p18, { participants = cloned })
			end
			return p18
		end,
		[participantIsActive.name] = function(p20, p21)
			-- upvalues: cryo (copy)
			local userId = p21.payload.userId
			local cloned = table.clone(p20.activeUserIds)
			local index = table.find(cloned, userId)
			
			if not index then
				table.insert(cloned, userId)
			elseif index ~= #cloned then
				table.remove(cloned, index)
				table.insert(cloned, userId)
			end
			return cryo.Dictionary.join(p20, { activeUserIds = cloned })
		end,
		[participantIsInactive.name] = function(p22, p23)
			-- upvalues: cryo (copy)
			local index = table.find(p22.activeUserIds, p23.payload.userId)
			
			if index then
				local cloned = table.clone(p22.activeUserIds)
				table.remove(cloned, index)
				
				return cryo.Dictionary.join(p22, { activeUserIds = cloned })
			end
			return p22
		end,
		[experienceJoined.name] = function(p24, p25)
			-- upvalues: cryo (copy)
			local payload = p25.payload
			
			return if payload.participants and payload.activeUserIds then cryo.Dictionary.join(p24, {
				participants = payload.participants,
				activeUserIds = payload.activeUserIds,
				publicVoiceFocusedUserIds = payload.publicVoiceFocusedUserIds
			}) else p24
		end,
		[restoreState.name] = function(p26, p27)
			-- upvalues: cryo (copy)
			return if p27.payload.Participants then cryo.Dictionary.join({}, p27.payload.Participants) else p26
		end,
		[participantAudioFocusChanged.name] = function(p28, p29)
			-- upvalues: cryo (copy)
			local contextIds = p29.payload.contextIds
			local cloned = table.clone(p28.publicVoiceFocusedUserIds)
			
			if contextIds then
				for i, v in pairs(contextIds) do
					local var25 = tonumber(i)
					
					if var25 then
						if v == 1 then
							cloned[var25] = true
						else
							cloned[var25] = nil
						end
					end
				end
			end
			return cryo.Dictionary.join(p28, { publicVoiceFocusedUserIds = cloned })
		end,
		[muteParticipant.name] = function(p30, p31)
			-- upvalues: cryo (copy)
			local userId = p31.payload.userId
			
			if p30.participants[userId] and not p30.participants[userId].isMutedLocally then
				local cloned = table.clone(p30.participants)
				cloned[userId].isMutedLocally = true
				
				return cryo.Dictionary.join(p30, { participants = cloned })
			end
			return p30
		end,
		[unmuteParticipant.name] = function(p32, p33)
			-- upvalues: cryo (copy)
			local userId = p33.payload.userId
			
			if p32.participants[userId] and p32.participants[userId].isMutedLocally == true then
				local cloned = table.clone(p32.participants)
				cloned[userId].isMutedLocally = false
				
				return cryo.Dictionary.join(p32, { participants = cloned })
			end
			return p32
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