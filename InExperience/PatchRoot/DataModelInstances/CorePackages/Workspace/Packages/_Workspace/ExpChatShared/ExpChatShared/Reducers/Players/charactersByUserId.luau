local ExpChatShared = script:FindFirstAncestor("ExpChatShared")
local Parent = ExpChatShared.Parent
local Dictionary = require(Parent.llama).Dictionary
local Actions = ExpChatShared.Actions

return require(Parent.Rodux).createReducer({}, {
	[require(Actions.CharacterAdded).name] = function(p1, p2) --[[ Line: 15 ]]
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, { [p2.userId] = p2.character })
	end,
	[require(Actions.PlayerRemoved).name] = function(p1, p2) --[[ Line: 21 ]]
		-- upvalues: Dictionary (copy)
		return Dictionary.removeKey(p1, p2.userId)
	end
})