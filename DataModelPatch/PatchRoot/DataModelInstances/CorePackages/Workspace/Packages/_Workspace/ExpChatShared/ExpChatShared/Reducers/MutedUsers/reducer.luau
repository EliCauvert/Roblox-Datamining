local ExpChatShared = script:FindFirstAncestor("ExpChatShared")
local Parent = ExpChatShared.Parent
local Set = require(Parent.llama).Set
local Actions = ExpChatShared.Actions

return require(Parent.Rodux).createReducer({}, {
	[require(Actions.UserMuted).name] = function(p1, p2)
		-- upvalues: Set (copy)
		return Set.add(p1, p2.userId)
	end,
	[require(Actions.UserUnmuted).name] = function(p1, p2)
		-- upvalues: Set (copy)
		return Set.subtract(p1, p2.userId)
	end
})