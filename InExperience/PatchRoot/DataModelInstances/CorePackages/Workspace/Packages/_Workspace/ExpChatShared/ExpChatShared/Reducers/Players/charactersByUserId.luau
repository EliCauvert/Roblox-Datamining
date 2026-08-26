local expChatShared = script:FindFirstAncestor("ExpChatShared")
local parent = expChatShared.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local actions = expChatShared.Actions

return roduxModule.createReducer({}, {
	[require(actions.CharacterAdded).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, { [p2.userId] = p2.character })
	end,
	[require(actions.PlayerRemoved).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.removeKey(p1, p2.userId)
	end
})