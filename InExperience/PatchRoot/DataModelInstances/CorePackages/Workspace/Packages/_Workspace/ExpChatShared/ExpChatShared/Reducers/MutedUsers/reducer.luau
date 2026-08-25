local expChatShared = script:FindFirstAncestor("ExpChatShared")
local parent = expChatShared.Parent
local roduxModule = require(parent.Rodux)
local set = require(parent.llama).Set
local actions = expChatShared.Actions

return roduxModule.createReducer({}, {
	[require(actions.UserMuted).name] = function(p0, p1)
		-- upvalues: set (ref)
		return set.add(p0, p1.userId)
	end,
	[require(actions.UserUnmuted).name] = function(p2, p3)
		-- upvalues: set (ref)
		return set.subtract(p2, p3.userId)
	end
})