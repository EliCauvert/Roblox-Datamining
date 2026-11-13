local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local Dictionary = require(Parent.llama).Dictionary
local None = require(Parent.llama).None
local RoduxModule = require(Parent.Rodux)
local Actions = ExpChat.Actions

return RoduxModule.createReducer({}, {
	[require(Actions.VoiceParticipantAdded).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		local UserId = p2.userId
		
		return Dictionary.set(p1, UserId, p1[UserId] or false)
	end,
	[require(Actions.VoiceParticipantRemoved).name] = function(p1, p2)
		-- upvalues: Dictionary (copy), None (copy)
		return Dictionary.set(p1, p2.userId, None)
	end,
	[require(Actions.VoiceParticipantToggleMuted).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return if p1[p2.userId] == nil then p1 else Dictionary.join(p1, { [p2.userId] = p2.isMuted })
	end
})