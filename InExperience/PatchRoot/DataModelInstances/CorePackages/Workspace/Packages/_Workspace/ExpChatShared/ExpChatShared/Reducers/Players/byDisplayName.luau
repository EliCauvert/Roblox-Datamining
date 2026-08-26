local expChatShared = script:FindFirstAncestor("ExpChatShared")
local parent = expChatShared.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local list = require(parent.llama).List
local actions = expChatShared.Actions

return roduxModule.createReducer({}, {
	[require(actions.PlayerAdded).name] = function(p1, p2)
		-- upvalues: dictionary (ref), list (ref)
		local lowerText = string.lower(p2.displayName)
		
		return dictionary.join(p1, {
			[lowerText] = list.append(p1[lowerText] or {}, p2.userId)
		})
	end,
	[require(actions.PlayerRemoved).name] = function(p1, p2)
		-- upvalues: dictionary (ref), list (ref)
		return dictionary.map(p1, function(p3)
			-- upvalues: list (copy), p2 (ref)
			return list.removeValue(p3, p2.userId)
		end)
	end
})