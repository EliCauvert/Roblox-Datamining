local expChatShared = script:FindFirstAncestor("ExpChatShared")
local parent = expChatShared.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local actions = expChatShared.Actions

return roduxModule.createReducer({}, {
	[require(actions.PlayerAdded).name] = function(p0, p1)
		-- upvalues: dictionary (ref)
		return dictionary.join(p0, {
			[p1.userId] = {
				userId = p1.userId,
				username = p1.username,
				displayName = p1.displayName
			}
		})
	end,
	[require(actions.PlayerRemoved).name] = function(p2, p3)
		-- upvalues: dictionary (ref)
		return dictionary.removeKey(p2, p3.userId)
	end
})