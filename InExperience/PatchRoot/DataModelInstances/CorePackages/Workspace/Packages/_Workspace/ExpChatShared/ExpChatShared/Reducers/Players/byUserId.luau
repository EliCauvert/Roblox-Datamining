local ExpChatShared = script:FindFirstAncestor("ExpChatShared")
local Parent = ExpChatShared.Parent
local Dictionary = require(Parent.llama).Dictionary
local Actions = ExpChatShared.Actions

return require(Parent.Rodux).createReducer({}, {
	[require(Actions.PlayerAdded).name] = function(p1, p2) --[[ Line: 19 ]]
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, {
			[p2.userId] = {
				userId = p2.userId,
				username = p2.username,
				displayName = p2.displayName
			}
		})
	end,
	[require(Actions.PlayerRemoved).name] = function(p1, p2) --[[ Line: 29 ]]
		-- upvalues: Dictionary (copy)
		return Dictionary.removeKey(p1, p2.userId)
	end
})