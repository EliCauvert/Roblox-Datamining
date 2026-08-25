local expChatShared = script:FindFirstAncestor("ExpChatShared")
local parent = expChatShared.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local list = require(parent.llama).List
local actions = expChatShared.Actions

return roduxModule.createReducer({}, {
	[require(actions.PlayerAdded).name] = function(p0, p1)
		-- upvalues: dictionary (ref), list (ref)
		local lowerText = string.lower(p1.displayName)
		
		return dictionary.join(p0, {
			[lowerText] = list.append(p0[lowerText] or {}, p1.userId)
		})
	end,
	[require(actions.PlayerRemoved).name] = function(p2, p3)
		-- upvalues: dictionary (ref), list (ref)
		return dictionary.map(p2, function(p4)
			-- upvalues: list (copy), p3 (ref)
			return list.removeValue(p4, p3.userId)
		end)
	end
})