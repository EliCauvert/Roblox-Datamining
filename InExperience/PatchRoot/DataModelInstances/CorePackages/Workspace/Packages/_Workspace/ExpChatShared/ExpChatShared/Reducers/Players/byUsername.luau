local expChatShared = script:FindFirstAncestor("ExpChatShared")
local parent = expChatShared.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local actions = expChatShared.Actions

return roduxModule.createReducer({}, {
	[require(actions.PlayerAdded).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, { [string.lower(p2.username)] = p2.userId })
	end,
	[require(actions.PlayerRemoved).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.filter(p1, function(p3)
			-- upvalues: p2 (ref)
			return p3 ~= p2.userId
		end)
	end
})