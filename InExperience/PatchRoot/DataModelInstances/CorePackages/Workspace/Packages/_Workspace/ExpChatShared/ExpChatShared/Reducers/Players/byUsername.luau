local ExpChatShared = script:FindFirstAncestor("ExpChatShared")
local Parent = ExpChatShared.Parent
local RoduxModule = require(Parent.Rodux)
local Dictionary = require(Parent.llama).Dictionary
local Actions = ExpChatShared.Actions

return RoduxModule.createReducer({}, {
	[require(Actions.PlayerAdded).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, { [string.lower(p2.username)] = p2.userId })
	end,
	[require(Actions.PlayerRemoved).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.filter(p1, function(UserId): boolean
			-- upvalues: p2 (copy)
			return UserId ~= p2.userId
		end)
	end
})