local expChatShared = script:FindFirstAncestor("ExpChatShared")
local parent = expChatShared.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local actions = expChatShared.Actions

return roduxModule.createReducer({}, {
	[require(actions.PlayerAdded).name] = function(p0, p1) --[[ line: 15 ]]
		-- upvalues: dictionary (ref)
		return dictionary.join(p0, { [string.lower(p1.username)] = p1.userId })
	end,
	[require(actions.PlayerRemoved).name] = function(p2, p3) --[[ line: 22 ]]
		-- upvalues: dictionary (ref)
		return dictionary.filter(p2, function(p4) --[[ line: 23 ]]
			-- upvalues: p3 (ref)
			return p4 ~= p3.userId
		end)
	end
})