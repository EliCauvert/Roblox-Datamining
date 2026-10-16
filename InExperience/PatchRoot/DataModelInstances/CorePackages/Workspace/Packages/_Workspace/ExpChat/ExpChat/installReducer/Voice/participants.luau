local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local Dictionary = require(Parent.llama).Dictionary
local None = require(Parent.llama).None
local VOICESTATE = require(Parent.VoiceChat).Constants.VOICE_STATE
local Actions = ExpChat.Actions

return require(Parent.Rodux).createReducer({}, {
	[require(Actions.VoiceParticipantAdded).name] = function(p1, p2) --[[ Line: 22 ]]
		-- upvalues: Dictionary (copy)
		local UserId = p2.userId
		
		return Dictionary.join(p1, { [UserId] = p1[UserId] or "Hidden" })
	end,
	[require(Actions.VoiceParticipantRemoved).name] = function(p1, p2) --[[ Line: 32 ]]
		-- upvalues: Dictionary (copy), None (copy)
		return Dictionary.join(p1, { [p2.userId] = None })
	end,
	[require(Actions.VoiceParticipantsChanged).name] = function(Tbl, p1) --[[ Line: 39 ]]
		-- upvalues: VOICESTATE (copy)
		local Copy = table.clone(Tbl)
		
		for i, newParticipant in p1.newParticipants do
			Copy[tostring(i)] = if newParticipant.subscriptionCompleted then if newParticipant.isMutedLocally then VOICESTATE.LOCAL_MUTED elseif newParticipant.isMuted then VOICESTATE.MUTED elseif newParticipant.isSignalActive then VOICESTATE.TALKING else VOICESTATE.INACTIVE else VOICESTATE.CONNECTING
		end
		return Copy
	end,
	[require(Actions.VoiceStateChanged).name] = function(p2, p3) --[[ Line: 59 ]]
		-- upvalues: Dictionary (copy)
		return if p2[p3.userId] then Dictionary.join(p2, { [p3.userId] = p3.newState }) else p2
	end
})