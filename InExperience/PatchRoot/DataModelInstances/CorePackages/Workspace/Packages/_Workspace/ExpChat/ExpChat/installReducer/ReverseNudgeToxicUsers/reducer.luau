local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local actions = expChat.Actions

return roduxModule.createReducer({}, {
	[require(actions.AddReverseNudgeToxicUser).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, { [p2.toxicUserId] = p2.reverseNudgeType })
	end,
	[require(actions.RemoveReverseNudgeToxicUser).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.removeKey(p1, p2.toxicUserId)
	end
})