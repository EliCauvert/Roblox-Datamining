local ExpChatShared = script:FindFirstAncestor("ExpChatShared")
local Parent = ExpChatShared.Parent
local Dictionary = require(Parent.llama).Dictionary
local Actions = ExpChatShared.Actions

return require(Parent.Rodux).createReducer({}, {
	[require(Actions.PlayerAdded).name] = function(p1, p2) --[[ Line: 15 ]]
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, { [string.lower(p2.username)] = p2.userId })
	end,
	[require(Actions.PlayerRemoved).name] = function(p1, p2) --[[ Line: 22 ]]
		-- upvalues: Dictionary (copy)
		return Dictionary.filter(p1, function(UserId): boolean --[[ Line: 23 ]]
			-- upvalues: p2 (copy)
			return UserId ~= p2.userId
		end)
	end
})