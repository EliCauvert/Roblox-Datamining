local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local actions = expChat.Actions

return roduxModule.createReducer({}, {
	[require(actions.AddReverseNudgeToxicUser).name] = function(p0, p1) --[[ line: 16 ]]
		-- upvalues: dictionary (ref)
		return dictionary.join(p0, { [p1.toxicUserId] = p1.reverseNudgeType })
	end,
	[require(actions.RemoveReverseNudgeToxicUser).name] = function(p2, p3) --[[ line: 20 ]]
		-- upvalues: dictionary (ref)
		return dictionary.removeKey(p2, p3.toxicUserId)
	end
})