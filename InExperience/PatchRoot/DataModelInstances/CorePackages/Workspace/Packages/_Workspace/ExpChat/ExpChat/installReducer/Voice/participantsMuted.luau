local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local Dictionary = require(Parent.llama).Dictionary
local None = require(Parent.llama).None
local Actions = ExpChat.Actions

return require(Parent.Rodux).createReducer({}, {
	[require(Actions.VoiceParticipantAdded).name] = function(p1, p2) --[[ Line: 19 ]]
		-- upvalues: Dictionary (copy)
		local UserId = p2.userId
		
		return Dictionary.set(p1, UserId, p1[UserId] or false)
	end,
	[require(Actions.VoiceParticipantRemoved).name] = function(p1, p2) --[[ Line: 27 ]]
		-- upvalues: Dictionary (copy), None (copy)
		return Dictionary.set(p1, p2.userId, None)
	end,
	[require(Actions.VoiceParticipantToggleMuted).name] = function(p1, p2) --[[ Line: 32 ]]
		-- upvalues: Dictionary (copy)
		return if p1[p2.userId] == nil then p1 else Dictionary.join(p1, { [p2.userId] = p2.isMuted })
	end
})