local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local dictionary = require(parent.llama).Dictionary
local none = require(parent.llama).None
local roduxModule = require(parent.Rodux)
local VOICE_STATE = require(parent.VoiceChat).Constants.VOICE_STATE
local actions = expChat.Actions

return roduxModule.createReducer({}, {
	[require(actions.VoiceParticipantAdded).name] = function(p0, p1) --[[ line: 22 ]]
		-- upvalues: dictionary (ref)
		local userId = p1.userId
		
		return dictionary.join(p0, { [userId] = p0[userId] or "Hidden" })
	end,
	[require(actions.VoiceParticipantRemoved).name] = function(p2, p3) --[[ line: 32 ]]
		-- upvalues: dictionary (ref), none (ref)
		return dictionary.join(p2, { [p3.userId] = none })
	end,
	[require(actions.VoiceParticipantsChanged).name] = function(p4, p5) --[[ line: 39 ]]
		-- upvalues: VOICE_STATE (ref)
		local cloned = table.clone(p4)
		
		for i, v in p5.newParticipants do
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
	[require(actions.VoiceStateChanged).name] = function(p6, p7) --[[ line: 59 ]]
		-- upvalues: dictionary (ref)
		return if p6[p7.userId] then dictionary.join(p6, { [p7.userId] = p7.newState }) else p6
	end
})