local expChatShared = script:FindFirstAncestor("ExpChatShared")
local parent = expChatShared.Parent
local roduxModule = require(parent.Rodux)
local set = require(parent.llama).Set
local actions = expChatShared.Actions

return roduxModule.createReducer({}, {
	[require(actions.UserMuted).name] = function(p1, p2)
		-- upvalues: set (ref)
		return set.add(p1, p2.userId)
	end,
	[require(actions.UserUnmuted).name] = function(p1, p2)
		-- upvalues: set (ref)
		return set.subtract(p1, p2.userId)
	end
})