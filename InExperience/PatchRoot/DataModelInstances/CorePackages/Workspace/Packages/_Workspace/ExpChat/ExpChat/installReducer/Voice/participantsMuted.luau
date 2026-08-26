local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local dictionary = require(parent.llama).Dictionary
local none = require(parent.llama).None
local actions = expChat.Actions

return require(parent.Rodux).createReducer({}, {
	[require(actions.VoiceParticipantAdded).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		local userId = p2.userId
		
		return dictionary.set(p1, userId, p1[userId] or false)
	end,
	[require(actions.VoiceParticipantRemoved).name] = function(p1, p2)
		-- upvalues: dictionary (ref), none (ref)
		return dictionary.set(p1, p2.userId, none)
	end,
	[require(actions.VoiceParticipantToggleMuted).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return if p1[p2.userId] == nil then p1 else dictionary.join(p1, { [p2.userId] = p2.isMuted })
	end
})