local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local dictionary = require(parent.llama).Dictionary
local none = require(parent.llama).None
local actions = expChat.Actions

return require(parent.Rodux).createReducer({}, {
	[require(actions.VoiceParticipantAdded).name] = function(p0, p1)
		-- upvalues: dictionary (ref)
		local userId = p1.userId
		
		return dictionary.set(p0, userId, p0[userId] or false)
	end,
	[require(actions.VoiceParticipantRemoved).name] = function(p2, p3)
		-- upvalues: dictionary (ref), none (ref)
		return dictionary.set(p2, p3.userId, none)
	end,
	[require(actions.VoiceParticipantToggleMuted).name] = function(p4, p5)
		-- upvalues: dictionary (ref)
		return if p4[p5.userId] == nil then p4 else dictionary.join(p4, { [p5.userId] = p5.isMuted })
	end
})