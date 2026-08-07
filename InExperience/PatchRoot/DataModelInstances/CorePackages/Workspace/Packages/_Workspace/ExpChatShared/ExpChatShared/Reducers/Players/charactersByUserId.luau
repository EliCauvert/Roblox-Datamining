local expChatShared = script:FindFirstAncestor("ExpChatShared")
local parent = expChatShared.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local actions = expChatShared.Actions

return roduxModule.createReducer({}, {
	[require(actions.CharacterAdded).name] = function(p0, p1) --[[ line: 15 ]]
		-- upvalues: dictionary (ref)
		return dictionary.join(p0, { [p1.userId] = p1.character })
	end,
	[require(actions.PlayerRemoved).name] = function(p2, p3) --[[ line: 21 ]]
		-- upvalues: dictionary (ref)
		return dictionary.removeKey(p2, p3.userId)
	end
})