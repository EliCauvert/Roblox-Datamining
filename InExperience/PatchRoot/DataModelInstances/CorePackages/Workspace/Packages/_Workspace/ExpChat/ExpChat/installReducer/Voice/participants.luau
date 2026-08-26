local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local dictionary = require(parent.llama).Dictionary
local none = require(parent.llama).None
local roduxModule = require(parent.Rodux)
local VOICE_STATE = require(parent.VoiceChat).Constants.VOICE_STATE
local actions = expChat.Actions

return roduxModule.createReducer({}, {
	[require(actions.VoiceParticipantAdded).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		local userId = p2.userId
		
		return dictionary.join(p1, { [userId] = p1[userId] or "Hidden" })
	end,
	[require(actions.VoiceParticipantRemoved).name] = function(p1, p2)
		-- upvalues: dictionary (ref), none (ref)
		return dictionary.join(p1, { [p2.userId] = none })
	end,
	[require(actions.VoiceParticipantsChanged).name] = function(p1, p2)
		-- upvalues: VOICE_STATE (ref)
		local cloned = table.clone(p1)
		
		for i, v in p2.newParticipants do
			local INACTIVE = VOICE_STATE.INACTIVE
			
			if not v.subscriptionCompleted then
				INACTIVE = VOICE_STATE.CONNECTING
			elseif v.isMutedLocally then
				INACTIVE = VOICE_STATE.LOCAL_MUTED
			elseif v.isMuted then
				INACTIVE = VOICE_STATE.MUTED
			elseif v.isSignalActive then
				INACTIVE = VOICE_STATE.TALKING
			end
			cloned[tostring(i)] = INACTIVE
		end
		return cloned
	end,
	[require(actions.VoiceStateChanged).name] = function(p3, p4)
		-- upvalues: dictionary (ref)
		return if p3[p4.userId] then dictionary.join(p3, { [p4.userId] = p4.newState }) else p3
	end
})